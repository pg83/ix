#!/usr/bin/env python3

import argparse
import hashlib
import json
import os
import tempfile
import urllib.request


DEFAULT_PROFILE_URL = (
    "https://raw.githubusercontent.com/moby/profiles/refs/tags/"
    "seccomp/v0.2.3/seccomp/default.json"
)
DEFAULT_PROFILE_SHA256 = (
    "536529b665dd0972c37bfb569f5d4ac8a53592e7b00752bc39ff063ca9864c74"
)

CLONE_NEWNS = 0x00020000
CLONE_NEWUSER = 0x10000000
CLONE_NEWNET = 0x40000000

MS_RDONLY = 0x00000001
MS_REMOUNT = 0x00000020
MS_BIND = 0x00001000
MS_REC = 0x00004000
MS_PRIVATE = 0x00040000

IX_MOUNT_FLAGS = (
    0,
    MS_BIND,
    MS_BIND | MS_REMOUNT | MS_RDONLY,
    MS_BIND | MS_REC,
    MS_PRIVATE | MS_REC,
)


def fetch_default_profile():
    with urllib.request.urlopen(DEFAULT_PROFILE_URL, timeout=30) as response:
        content = response.read()

    actual_hash = hashlib.sha256(content).hexdigest()
    if actual_hash != DEFAULT_PROFILE_SHA256:
        raise RuntimeError(f"default seccomp profile hash mismatch: {actual_hash}")

    return json.loads(content)


def extend_for_ix(profile):
    syscalls = profile.get("syscalls")
    if not isinstance(syscalls, list):
        raise ValueError("default seccomp profile has no syscall list")

    namespace_masks = (
        CLONE_NEWUSER | CLONE_NEWNS,
        CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWNET,
    )
    for mask in namespace_masks:
        syscalls.append(
            {
                "names": ["unshare"],
                "action": "SCMP_ACT_ALLOW",
                "args": [
                    {
                        "index": 0,
                        "value": mask,
                        "op": "SCMP_CMP_EQ",
                    }
                ],
                "comment": "IX build namespace",
            }
        )

    for flags in IX_MOUNT_FLAGS:
        syscalls.append(
            {
                "names": ["mount"],
                "action": "SCMP_ACT_ALLOW",
                "args": [
                    {
                        "index": 3,
                        "value": flags,
                        "op": "SCMP_CMP_EQ",
                    }
                ],
                "comment": "IX sandbox mount operation",
            }
        )

    return profile


def write_profile(profile, output_path):
    output_dir = os.path.dirname(os.path.abspath(output_path))
    os.makedirs(output_dir, exist_ok=True)

    fd, temporary_path = tempfile.mkstemp(
        dir=output_dir,
        prefix=".seccomp-",
        suffix=".json",
        text=True,
    )
    replaced = False
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as output:
            json.dump(profile, output, indent=2)
            output.write("\n")
        os.replace(temporary_path, output_path)
        replaced = True
    finally:
        if not replaced:
            os.unlink(temporary_path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("output")
    args = parser.parse_args()

    profile = extend_for_ix(fetch_default_profile())
    write_profile(profile, args.output)


if __name__ == "__main__":
    main()
