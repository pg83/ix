import os


class VFS:
    def __init__(self, parent):
        self.parent = parent
        self.mod = exec(parent.serve('mount.py'), self.__dict__)

    def serve(self, path):
        return self.mod['serve'](path)


class FS:
    def __init__(self, root):
        self.root = root

    def serve(self, path):
        try:
            with open(os.path.join(self.root, path), 'rb') as f:
                return f.read()
        except FileNotFoundError as e:
            a, sep, c = path.partition('/')

            if sep:
                return vfs(os.path.join(self.root, a)).serve(c)

            raise e


class UFS:
    def __init__(self, roots):
        self.fs = [vfs(x) for x in roots]

    def serve(self, path):
        for fs in self.fs:
            try:
                return fs.serve(path)
            except FileNotFoundError:
                pass

        raise FileNotFoundError(path)


def load_vfs(root):
    fs = FS(root)

    try:
        return VFS(fs)
    except FileNotFoundError:
        return fs


def vfs(root):
    while True:
        try:
            return vfs.__cache__[root]
        except AttributeError:
            vfs.__cache__ = {}
        except KeyError:
            vfs.__cache__[root] = load_vfs(root)
