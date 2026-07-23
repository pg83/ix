#!/usr/bin/env python3

import argparse
import json
import os
import re
import tempfile
from pathlib import Path


STORE_PREFIX = "/ix/store/"
STORE_NAME = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._+@=-]*$")
REALMS = ("system", "root", "boot")


def store_name(target):
    if not isinstance(target, str) or not target.startswith(STORE_PREFIX):
        raise ValueError(f"invalid store target: {target!r}")

    name = target.removeprefix(STORE_PREFIX)
    if not STORE_NAME.fullmatch(name):
        raise ValueError(f"invalid store object name: {name!r}")

    return name


def read_links(store_object):
    metadata = store_object / "meta.json"
    if not metadata.exists():
        return ()

    with metadata.open(encoding="utf-8") as source:
        document = json.load(source)

    links = document.get("links", ())
    if not isinstance(links, list) or not all(isinstance(link, str) for link in links):
        raise ValueError(f"invalid links in {metadata}")

    return links


def resolve_closure(state_dir):
    state = Path(state_dir)
    store = state / "store"
    realm_dir = state / "realm"

    pending = []
    for realm in REALMS:
        realm_link = realm_dir / realm
        if not realm_link.is_symlink():
            raise ValueError(f"missing assembled realm: {realm_link}")
        pending.append(store_name(os.readlink(realm_link)))

    closure = set()
    while pending:
        name = pending.pop()
        if name in closure:
            continue

        store_object = store / name
        if store_object.is_symlink() or not store_object.is_dir():
            raise ValueError(f"missing store object: {store_object}")
        if not (store_object / "touch").is_file():
            raise ValueError(f"incomplete store object: {store_object}")

        closure.add(name)
        for target in read_links(store_object):
            dependency = store_name(target)
            if dependency not in closure:
                pending.append(dependency)

    return sorted(closure)


def write_manifest(entries, output_path):
    destination = Path(output_path).resolve()
    destination.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_path = tempfile.mkstemp(
        dir=destination.parent,
        prefix=".image-closure-",
        suffix=".txt",
        text=True,
    )
    replaced = False
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8") as output:
            for entry in entries:
                output.write(f"{entry}\n")
        os.replace(temporary_path, destination)
        replaced = True
    finally:
        if not replaced:
            os.unlink(temporary_path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("state_dir")
    parser.add_argument("output")
    args = parser.parse_args()

    write_manifest(resolve_closure(args.state_dir), args.output)


if __name__ == "__main__":
    main()
