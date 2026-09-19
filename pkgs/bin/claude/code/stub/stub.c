// The whole stub. Everything it needs is linked in: the ELF loader, the
// glibc ABI bridge over musl, and whichever lib/<name>/dl providers the
// package lists. The program itself is appended to this binary by
// solo-pack, and soloBundleMain finds it through /proc/self/exe.
//
// argv is handed over untouched, so the guest's own argv[0] and any
// re-exec of itself keep naming the bundle.

#include <dlfcn.h>

int main(int argc, char** argv) {
    return soloBundleMain(argc, argv);
}
