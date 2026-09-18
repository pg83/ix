"""Keep only portable source dependencies in a Nimble vendor archive."""
import json
import pathlib
import shutil
import subprocess
import sys

root = pathlib.Path(sys.argv[1]).resolve()
vendor = root / 'vendored'
paths = []
for line in (root / 'nimble.paths').read_text().splitlines():
    if line.startswith('--path:'):
        path = pathlib.Path(json.loads(line[len('--path:'):])).resolve()
        paths.append(path.relative_to(root).as_posix())
    elif line != '--noNimblePath':
        raise ValueError(f'Unexpected Nimble path entry: {line}')
(root / 'nimble.paths').write_text(
    'switch("noNimblePath")\n' + ''.join(
        f'switch("path", thisDir() & {json.dumps("/" + path)})\n'
        for path in sorted(set(paths))))

# Only installed package sources are needed for offline compilation.
# Nimble may build package binaries in their Git worktrees. Restore the pinned
# source revisions before dropping VCS metadata so build paths cannot leak into
# the vendor archive.
for metadata in sorted(vendor.rglob('.git')):
    repository = metadata.parent
    subprocess.run(
        ['git', '-C', repository, 'reset', '--hard', 'HEAD'],
        check=True, stdout=subprocess.DEVNULL)
    subprocess.run(
        ['git', '-C', repository, 'clean', '-ffdx'],
        check=True, stdout=subprocess.DEVNULL)

for entry in vendor.rglob('*'):
    if entry.is_file():
        with entry.open('rb') as source:
            is_elf = source.read(4) == b'\x7fELF'
        if is_elf:
            entry.unlink()

for entry in vendor.iterdir():
    if entry.name not in ('pkgs', 'pkgs2'):
        if entry.is_dir() and not entry.is_symlink():
            shutil.rmtree(entry)
        else:
            entry.unlink()
for entry in sorted(vendor.rglob('*'), reverse=True):
    if entry.name in ('.git', '.hg', 'nimcache'):
        if entry.is_dir() and not entry.is_symlink():
            shutil.rmtree(entry)
        else:
            entry.unlink()
    elif entry.name == 'nimblemeta.json':
        entry.unlink()
