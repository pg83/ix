#!/usr/bin/env sh

set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)

exec sudo apparmor_parser -r -K "${script_dir}/ix-container.apparmor"
