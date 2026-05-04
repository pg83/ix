import os
import sys
import shutil
import random
import signal
import asyncio
import subprocess

import core.log as cl
import core.error as ce
import core.utils as cu

try:
    from asyncio import to_thread
except ImportError:
    from core.threads import to_thread


def detect_sandbox():
    if os.environ.get('IX_NO_SANDBOX'):
        return None

    if sys.platform != 'linux':
        return None

    if not hasattr(os, 'unshare'):
        return None

    return shutil.which('mount')


def wrap_args(n, env, mount_bin):
    out_dirs = n.get('out_dir', [])
    in_dirs = n.get('in_dir', [])

    args = [
        f'mount={mount_bin}',
        f"tmpfs={'true' if n.get('tmpfs', True) else 'false'}",
        f"net={'true' if n.get('pool') == 'network' else 'false'}",
        f"tmp={env.get('tmp', '')}",
        f"out={out_dirs[0] if out_dirs else ''}",
    ]

    for d in in_dirs:
        args.append(f'in={d}')

    return args


def execute_cmd(c, n, mt, ix_binary, mount_bin):
    env = cu.dict_dict_update(c.get('env', {}), {
        'make_thrs': str(mt),
        'IX_RANDOM': str(random.randint(0, 1000000000)),
    })

    args = c['args']

    try:
        descr = env['out']
    except KeyError:
        descr = ' '.join(args)

    cl.log(f'ENTER {descr}', color='b')

    if mount_bin:
        full = (
            [sys.executable, ix_binary, 'exec']
            + wrap_args(n, env, mount_bin)
            + ['--']
            + list(args)
        )
    else:
        full = list(args)

    try:
        subprocess.run(full, env=env, input=c.get('stdin', '').encode(), check=True)
    except subprocess.CalledProcessError:
        cl.log(f'ERROR {descr}', color='r')
        os.kill(0, signal.SIGKILL)
    except Exception as e:
        raise ce.Error(f'{descr} failed', exception=e)

    cl.log(f'LEAVE {descr}', color='b')


def iter_in(c):
    if 'in' in c:
        yield from c['in']

    if 'in_dir' in c:
        for x in c['in_dir']:
            yield x + '/touch'


def iter_out(c):
    if 'out' in c:
        yield from c['out']

    if 'out_dir' in c:
        for x in c['out_dir']:
            yield x + '/touch'


def iter_cmd(c):
    if 'cmd' in c:
        yield from c['cmd']


async def gather(it):
    return await asyncio.gather(*list(it))


def iter_nodes(nodes):
    for n in cu.iter_uniq_list(nodes):
        yield {
            'n': n,
            'l': asyncio.Lock(),
            'v': False,
        }


def group_by_out(nodes):
    by_out = {}

    for n in iter_nodes(nodes):
        for o in iter_out(n['n']):
            assert o not in by_out

            by_out[o] = n

    return by_out


class Executor:
    def __init__(self, nodes, pools, trash, ix_binary):
        self.s = dict((k, asyncio.Semaphore(v)) for k, v in pools.items())
        self.o = group_by_out(nodes)
        self.l = []
        self.mt = pools['threads']
        self.trash_dir = trash
        self.ix_binary = ix_binary
        # One probe per graph: if Linux + os.unshare + a mount binary on
        # the executor's PATH are all present, every cmd runs under
        # `ix exec mount=<abs> ...`. Otherwise we don't wrap at all —
        # cmds run directly with no sandbox.
        self.mount_bin = detect_sandbox()

        if self.mount_bin:
            cl.log(f'sandbox: mount={self.mount_bin}', color='b')
        else:
            cl.log('sandbox: disabled (Linux/os.unshare/mount missing)', color='y')

    async def visit_lst(self, l):
        await gather(self.visit_node(self.o[n]) for n in l)

    async def visit_all(self, l):
        await self.visit_lst(l)

        for x in self.l:
            await x

    async def visit_node(self, n):
        async with n['l']:
            if not n['v']:
                await self.do_visit(n['n'])
                assert not n['v']
                n['v'] = True

    async def do_visit(self, n):
        await self.visit_node_impl(n)

        for o in iter_out(n):
            cl.log(f'TOUCH {o}', color='g')

    async def visit_node_impl(self, n):
        if all(os.path.isfile(x) for x in iter_out(n)):
            return

        await self.visit_lst(iter_in(n))

        async with self.s[n['pool']]:
            await to_thread(self.execute_node, n)

    def prepare_dir(self, d):
        try:
            os.rename(d, os.path.join(self.trash_dir, str(random.random())))
        except FileNotFoundError:
            pass
        except Exception:
            try:
                shutil.rmtree(d)
            except FileNotFoundError:
                pass

        os.makedirs(d, exist_ok=True)

    def execute_node(self, n):
        for o in iter_out(n):
            self.prepare_dir(os.path.dirname(o))

        for c in iter_cmd(n):
            execute_cmd(c, n, self.mt, self.ix_binary, self.mount_bin)

        cu.sync()

        for o in iter_out(n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass

        cu.sync()


async def arun(g, trash, ix_binary):
    await Executor(g['nodes'], g['pools'], trash, ix_binary).visit_all(g['targets'])


def kill_all(*args):
    os.kill(0, signal.SIGKILL)


def execute(g, trash, ix_binary):
    try:
        cmd = [shutil.which('chrt'), '-i', '-p', '0', str(os.getpid())]
        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except Exception:
        pass

    os.setpgrp()

    signal.signal(signal.SIGINT, kill_all)

    asyncio.run(arun(g, trash, ix_binary))
