#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -eq 0 ]; then
    echo "usage: IX_STATE_DIR=/absolute/path $0 <ix arguments...>" >&2
    exit 2
fi

if [ -z "${IX_STATE_DIR:-}" ]; then
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

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
repo_root=$(CDPATH='' cd -- "${script_dir}/../.." && pwd -P)

mkdir -p "${IX_STATE_DIR}"
state_dir=$(CDPATH='' cd -- "${IX_STATE_DIR}" && pwd -P)

runtime_dir=${IX_CONTAINER_RUNTIME_DIR:-"${state_dir}.container"}
mkdir -p "${runtime_dir}"
runtime_dir=$(CDPATH='' cd -- "${runtime_dir}" && pwd -P)

uid=$(id -u)
gid=$(id -g)
builder_image="ix-local-builder:${uid}-${gid}"
seccomp_profile="${runtime_dir}/seccomp-ix-v1.json"
target_mounts=()

case "${IX_CONTAINER_TARGET_ENV:-0}" in
    0)
        exec_kind=local
        container_path=/opt/ix-bootstrap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
        ;;
    1)
        exec_kind=system
        container_path=/ix/realm/root/bin:/ix/realm/system/bin:/ix/realm/boot/bin

        system_realm_link="${state_dir}/realm/system"
        if [[ ! -L "${system_realm_link}" ]]; then
            echo "missing assembled system realm: ${system_realm_link}" >&2
            exit 2
        fi

        system_realm_target=$(readlink "${system_realm_link}")
        case "${system_realm_target}" in
            /ix/*)
                system_realm_host_target="${state_dir}/${system_realm_target#/ix/}"
                ;;
            *)
                echo "unexpected system realm target: ${system_realm_target}" >&2
                exit 2
                ;;
        esac

        target_bin="${system_realm_host_target}/bin"
        target_shell="${target_bin}/sh"
        if [[ -L "${target_shell}" ]]; then
            target_shell_link=$(readlink "${target_shell}")
            case "${target_shell_link}" in
                /ix/*)
                    target_shell_host="${state_dir}/${target_shell_link#/ix/}"
                    ;;
                *)
                    echo "unexpected system shell target: ${target_shell_link}" >&2
                    exit 2
                    ;;
            esac
        else
            target_shell_host="${target_shell}"
        fi

        if [[ ! -x "${target_shell_host}" ]]; then
            echo "system realm has no executable shell: ${target_bin}/sh" >&2
            exit 2
        fi

        target_mounts+=(
            --volume "${target_bin}:/bin:ro"
            --volume "${target_bin}:/usr/bin:ro"
        )
        ;;
    *)
        echo "IX_CONTAINER_TARGET_ENV must be 0 or 1" >&2
        exit 2
        ;;
esac

if [[ ! -s "${seccomp_profile}" ]]; then
    if ! command -v python3 >/dev/null 2>&1; then
        echo "python3 is required to create ${seccomp_profile}" >&2
        exit 2
    fi
    python3 "${script_dir}/seccomp_profile.py" "${seccomp_profile}"
fi

docker build \
    --file "${script_dir}/Dockerfile.builder" \
    --build-arg "IX_UID=${uid}" \
    --build-arg "IX_GID=${gid}" \
    --tag "${builder_image}" \
    "${script_dir}"

docker run --rm --init \
    --user "${uid}:${gid}" \
    --cap-drop ALL \
    --security-opt no-new-privileges=true \
    --security-opt "apparmor=ix-container" \
    --security-opt "seccomp=${seccomp_profile}" \
    "${target_mounts[@]}" \
    --volume "${state_dir}:/ix:rw" \
    --volume "${repo_root}:/src/ix:ro" \
    --env IX_ROOT=/ix \
    --env "IX_EXEC_KIND=${exec_kind}" \
    --env "PATH=${container_path}" \
    --workdir /src/ix \
    "${builder_image}" \
    /bin/sh -c '"$@"; status=$?; exit "$status"' ix-container ./ix "$@"
