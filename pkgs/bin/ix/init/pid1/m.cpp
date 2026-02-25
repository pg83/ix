#include <std/sys/fs.h>
#include <std/sys/fd.h>
#include <std/ios/sys.h>
#include <std/str/view.h>
#include <std/str/hash.h>
#include <std/sym/i_map.h>
#include <std/sys/throw.h>
#include <std/ios/in_fd.h>
#include <std/ios/in_mem.h>
#include <std/lib/vector.h>
#include <std/lib/buffer.h>
#include <std/str/builder.h>

#include <time.h>
#include <fcntl.h>
#include <spawn.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>

using namespace Std;

namespace {
    static Buffer readf(StringView path) {
        Buffer pathBuf(path);

        int rawFd = ::open(pathBuf.cStr(), O_RDONLY);

        if (rawFd < 0) {
            Errno().raise(StringBuilder() << StringView(u8"can not open ") << path);
        }

        ScopedFD fd(rawFd);
        StringBuilder buf;

        FDInput(fd).sendTo(buf);

        return buf;
    }

    static StringView currentException() {
        try {
            throw;
        } catch (Exception& e) {
            return e.description();
        }

        return StringView(u8"unknown error");
    }

    using ProcID = u64;

    static ProcID fhash(StringView p) {
        return p.hash64() ^ StringView(readf(p)).hash64();
    }

    static auto wait_pid() {
        int status;

        return waitpid(-1, &status, WNOHANG);
    }

    struct Proc {
        pid_t pid = 0;
        ProcID md5;

        inline Proc(ProcID m, Buffer& pathBuf)
            : md5(m)
        {
            char* cmd[] = {
                pathBuf.cStr(),
                0,
            };

            if (posix_spawnp(&pid, cmd[0], 0, 0, cmd, 0)) {
                Errno().raise(StringBuilder() << StringView(u8"can not spawn ") << pathBuf);
            }
        }

        inline void terminate() {
            kill(pid, SIGTERM);
        }
    };

    struct Context {
        const Buffer where;
        IntMap<Proc> running;
        IntMap<ProcID> pids;

        inline void run() {
            while (true) {
                try {
                    do {
                        step();
                        waitPending();
                        usleep(10000);
                    } while (getpid() == 1 && killStale() > 0);
                } catch (...) {
                    sysE << StringView(u8"step error ")
                         << currentException()
                         << endL
                         << flsH;
                }

                sleep(1);
            }
        }

        void step() {
            IntMap<bool> cur;

            StringBuilder pb;

            listDir(where, [&](TPathInfo info) {
                if (!info.isDir) {
                    return;
                }

                pb.reset();

                pb << where
                   << StringView(u8"/")
                   << info.item
                   << StringView(u8"/run");

                try {
                    auto md5 = fhash(pb);

                    if (!running.find(md5)) {
                        pids[running.insert(md5, md5, pb)->pid] = md5;
                    }

                    cur[md5] = true;
                } catch (...) {
                    sysE << StringView(u8"skip ")
                         << StringView(pb)
                         << StringView(u8": ")
                         << currentException()
                         << endL
                         << flsH;
                }
            });

            running.visit([&](Proc& proc) {
                if (cur.find(proc.md5) == nullptr) {
                    proc.terminate();
                }
            });
        }

        void waitPending() {
            for (auto pid = wait_pid(); pid > 0; pid = wait_pid()) {
                if (auto procId = pids.find(pid); procId) {
                    running.erase(*procId);
                    pids.erase(pid);

                    sysE << StringView(u8"complete ")
                         << pid
                         << endL
                         << flsH;
                } else {
                    sysE << StringView(u8"unknown pid ")
                         << pid
                         << endL
                         << flsH;
                }
            }
        }

        unsigned int killStale() {
            Buffer childs = readf(StringView(u8"/proc/1/task/1/children"));
            MemoryInput input(childs.data(), childs.length());

            unsigned int stale = 0;

            Buffer line;

            while ((line.reset(), input.readTo(line, ' '), line.length())) {
                auto pid = (pid_t)StringView(line).stol();

                if (pids.find(pid) == nullptr) {
                    ++stale;
                    kill(pid, SIGKILL);

                    sysE << StringView(u8"stale pid ")
                         << pid
                         << endL
                         << flsH;
                }
            }

            return stale;
        }
    };
}

int main() {
    Context{
        .where = StringView(u8"/etc/services"),
    }.run();
}
