#include "dlfcn.h"

#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#include <std/sys/types.h>

#include <std/lib/smap.h>
#include <std/lib/stable.h>
#include <std/lib/singleton.h>

#include <std/ios/sys.h>
#include <std/ios/output.h>

#include <std/str/dynamic.h>

using namespace Std;

namespace {
    static int OpenFD() {
        if (auto env = getenv("DL_STUB_DEBUG"); env && env[0] == '/') {
            if (int fd = open(env, O_WRONLY | O_CREAT | O_APPEND, 0644); fd >= 0) {
                return fd;
            }
        }

        return 1;
    }

    struct Dbg: public Output {
        int FD = OpenFD();

        void writeImpl(const void* buf, size_t len) override {
            ::write(FD, buf, len);
        }
    };

    static inline bool debugEnabled() {
        static const bool enabled = getenv("DL_STUB_DEBUG");

        return enabled;
    }

#define DBG(X) \
    if (debugEnabled()) {   \
        OutBuf(singleton<Dbg>()) << X << endL << finI; \
    }

    static inline StringView sv(const char* s) noexcept {
        return StringView((const u8*)s, strlen(s));
    }

    struct IfaceHandle {
        virtual void* lookup(StringView s) const noexcept = 0;
    };

    struct Handle: public IfaceHandle, public StringTable {
        void* lookup(StringView s) const noexcept override {
            if (auto it = find(s); it) {
                DBG(StringView(u8"found ") << s);

                return it;
            }

            DBG(StringView(u8"not found ") << s);

            return nullptr;
        }
    };

    struct Handles: public IfaceHandle, public StringMap<Handle> {
        // default handle lookup
        void* lookup(StringView s) const noexcept override {
            /*
            for (const auto& it : *this) {
                if (auto res = it.second.lookup(s); res) {
                    DBG(StringView(u8"found global ") << s);

                    return res;
                }
            }
            */
            DBG(StringView(u8"not found global ") << s);

            return nullptr;
        }

        inline IfaceHandle* findHandle(StringView s) noexcept {
            DBG(StringView(u8"try open handle ") << s);

            if (auto it = find(s); it) {
                DBG(StringView(u8"found handle ") << s);

                return it;
            }

            DBG(StringView(u8"not found handle ") << s);

            return nullptr;
        }

        inline void registar(StringView lib, StringView symbol, void* ptr) noexcept {
            DBG(StringView(u8"register ") << lib << StringView(u8", ") << symbol);

            (*this)[lib].set(symbol, ptr);
        }

        static inline Handles* instance() noexcept {
            return &singleton<Handles>();
        }
    };

    static thread_local const char* DL_ERROR = nullptr;

    static inline void setLastError(const char* err) {
        DL_ERROR = err;
    }

    static auto lastError() noexcept {
        auto ret = DL_ERROR;

        DL_ERROR = nullptr;

        return ret;
    }

    static DynString baseName(const DynString& s) {
        DynString r;

        for (char ch : s) {
            if (ch == '/') {
                r.clear();
            } else {
                r.pushBack(ch);
            }
        }

        return r;
    }

    static inline DynString cutPrefix(const DynString& s, const StringView& prefix) {
        /*
        if (s.size() > prefix.size()) {
            if (s.substr(0, prefix.size()) == prefix) {
                return s.substr(prefix.size());
            }
        }*/

        return s;
    }

    static inline DynString cutExt(const DynString& s) {
        DynString r;

        for (char ch : s) {
            if (ch == '.') {
                break;
            }

            r.pushBack(ch);
        }

        return r;
    }

    static DynString calcName(const DynString& s) {
        return cutExt(cutPrefix(baseName(s), u8"lib"));
    }
}

extern "C" void* stub_dlsym(void* handle, const char* symbol) {
    lastError();

    if (handle) {
        if (auto ret = ((IfaceHandle*)handle)->lookup(sv(symbol)); ret) {
            return ret;
        }
    }

    setLastError("symbol not found");

    return 0;
}

extern "C" void* stub_dlopen(const char* filename, int mode) {
    lastError();

    DBG(StringView(u8"dlopen ") << filename << StringView(u8" ") << mode);

    if (!filename) {
        filename = "";
    }

    if (strcmp(filename, "") == 0) {
        return Handles::instance();
    }

    if (auto res = Handles::instance()->findHandle(sv(filename)); res) {
        return res;
    }

    if (auto res = Handles::instance()->findHandle(calcName(sv(filename))); res) {
        return res;
    }

    setLastError("library not found");

    return 0;
}

extern "C" int stub_dlclose(void*) {
    lastError();

    return 0;
}

extern "C" char* stub_dlerror(void) {
    return (char*)lastError();
}

extern "C" void stub_dlregister(const char* lib, const char* symbol, void* ptr) {
    Handles::instance()->registar(sv(lib), sv(symbol), ptr);
}

extern "C" int stub_dladdr(const void* /*addr*/, Dl_info* /*info*/) {
    return 0;
}

// some helpers
#define DL_CAT(X, Y)  DL_CA_(X, Y)
#define DL_CA_(X, Y)  DL_C__(X, Y)
#define DL_C__(X, Y)  X##Y
#define DL_STR(X)     DL_ST_(X)
#define DL_ST_(X)     #X

#if defined(__COUNTER__)
    #define DL_UID(N) DL_CAT(N, __COUNTER__)
#endif

#if !defined(DL_UID)
    #define DL_UID(N) DL_CAT(N, __LINE__)
#endif

#define DL_LIB(name)                    \
    namespace { namespace DL_UID(Reg) { \
        static struct Reg {             \
            inline Reg() {              \
                const char* lib = name; \

#define DL_S_2(name, ptr) \
                stub_dlregister(lib, name, (void*)ptr);

#define DL_S_1(name) \
                DL_S_2(DL_STR(name), name)

#define DL_END()           \
            };             \
        } LIB_REG; \
    }}

DL_LIB("dl")
DL_S_2("dlopen", stub_dlopen)
DL_S_2("dlsym", stub_dlsym)
DL_S_2("dlclose", stub_dlclose)
DL_S_2("dlerror", stub_dlerror)
DL_S_2("dladdr", stub_dladdr)
DL_END()

DL_LIB("c")
DL_S_2("dlopen", stub_dlopen)
DL_S_2("dlsym", stub_dlsym)
DL_S_2("dlclose", stub_dlclose)
DL_S_2("dlerror", stub_dlerror)
DL_S_2("dladdr", stub_dladdr)
DL_END()
