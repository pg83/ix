#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${IX_STATE_DIR:-}" ]]; then
    echo "IX_STATE_DIR must name the external IX root" >&2
    exit 2
fi

case "${IX_STATE_DIR}" in
    /*) ;;
    *)
        echo "IX_STATE_DIR must be an absolute path" >&2
        exit 2
        ;;
esac

if [[ ! -d "${IX_STATE_DIR}" ]]; then
    echo "IX_STATE_DIR does not exist: ${IX_STATE_DIR}" >&2
    exit 2
fi

image_tag=${1:-shitty}
script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
state_dir=$(CDPATH='' cd -- "${IX_STATE_DIR}" && pwd -P)
export_image="debian@sha256:7b140f374b289a7c2befc338f42ebe6441b7ea838a042bbd5acbfca6ec875818"
runtime_dir=${IX_CONTAINER_RUNTIME_DIR:-"${state_dir}.container"}
mkdir -p "${runtime_dir}"
runtime_dir=$(CDPATH='' cd -- "${runtime_dir}" && pwd -P)
closure_manifest="${runtime_dir}/image-closure.txt"

python3 "${script_dir}/store_closure.py" "${state_dir}" "${closure_manifest}"

if ! docker image inspect "${export_image}" >/dev/null 2>&1; then
    docker pull "${export_image}" >/dev/null
fi

docker run --rm \
    --cap-drop ALL \
    --cap-add CHOWN \
    --cap-add DAC_OVERRIDE \
    --cap-add FOWNER \
    --cap-add FSETID \
    --cap-add SETFCAP \
    --security-opt no-new-privileges=true \
    --volume "${state_dir}:/source/ix:ro" \
    --volume "${closure_manifest}:/closure.txt:ro" \
    "${export_image}" \
    sh -eu -c '
        mkdir -p \
            /rootfs/etc \
            /rootfs/ix/realm \
            /rootfs/ix/store \
            /rootfs/home/root \
            /rootfs/var \
            /rootfs/sys \
            /rootfs/proc \
            /rootfs/dev
        tar \
            --numeric-owner \
            --acls \
            --xattrs \
            --xattrs-include="*" \
            -C /source/ix/store \
            -cf - \
            -T /closure.txt |
            tar \
                --numeric-owner \
                --same-owner \
                --same-permissions \
                --acls \
                --xattrs \
                --xattrs-include="*" \
                -C /rootfs/ix/store \
                -xf -
        for realm in system root boot; do
            ln -s \
                "$(readlink "/source/ix/realm/${realm}")" \
                "/rootfs/ix/realm/${realm}"
        done
        ln -s /rootfs/ix /ix
        ln -s ix/realm/system/bin /rootfs/bin
        ln -s / /rootfs/usr
        tar \
            --numeric-owner \
            --acls \
            --xattrs \
            --xattrs-include="*" \
            -C /ix/realm/system/etc \
            -cf - \
            . |
            tar \
                --numeric-owner \
                --same-owner \
                --same-permissions \
                --acls \
                --xattrs \
                --xattrs-include="*" \
                -C /rootfs/etc \
                -xf -
        tar \
            --numeric-owner \
            --acls \
            --xattrs \
            --xattrs-include="*" \
            -C /rootfs \
            -cf - \
            .
    ' |
    docker import \
        --change 'WORKDIR /' \
        - \
        "${image_tag}"
