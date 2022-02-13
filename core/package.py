import os
import string
import itertools

import core.utils as cu
import core.error as ce
import core.gen_cmds as cg
import core.render_ctx as cr


def fmt_sel(s):
    r = s['name']

    for f in s['flags']:
        if f in ('host', 'target'):
            pass
        else:
            r = r + ' ' + f + '=' + str(s['flags'][f])

    return r


def parse_pkg_flags(v):
    def it():
        for x in v.split(','):
            a, b, c = x.partition('=')

            yield a, c

    return dict(it())


def parse_pkg_name(v):
    a, b, c = v.partition('(')

    r = {
        'name': a,
    }

    if b:
        r['flags'] = parse_pkg_flags(c[:-1])

    return r


def make_selector(v, flags):
    v = parse_pkg_name(v)

    v['flags'] = cu.dict_dict_update(flags, v.get('flags', {}))

    return v


def rlist(l):
    return list(reversed(list(l)))


def visit_node(n, f, k):
    s = set()

    def v(l):
        kk = k(l)

        if kk not in s:
            s.add(kk)

            for x in rlist(f(l)):
                yield from v(x)

            yield l

    return rlist(v(n))


def visit_lst(l, f):
    def ff(n):
        return f(n) if n else l

    def kk(n):
        return n.uid if n else None

    return visit_node(None, ff, kk)[1:]


def add_kind(k, l):
    return ({'kind': k, 'p': x} for x in l)


def popf(d, f):
    if f in d:
        d = cu.copy_dict(d)
        d.pop(f)

    return d


def gen_sym():
    for x in string.ascii_letters + string.digits:
        yield x, x

    yield '+', '-plus-'


SYM = dict(gen_sym())


def canon_name(n):
    n = ''.join(SYM.get(x, '-') for x in n)

    while '--' in n:
        n = n.replace('--', '-')

    n = n.rstrip('-')

    n = n.replace('lib-lib', 'lib')
    n = n.replace('bin-bin', 'bin')
    n = n.replace('aux-aux', 'aux')
    n = n.replace('bin-bld', 'bld')

    return n.lower()


class Package:
    def __init__(self, selector, mngr):
        self.manager = mngr

        selector = cu.copy_dict(selector)

        if 'flags' not in selector:
            selector['flags'] = {}

        flags = selector['flags']

        if 'target' not in flags:
            flags['target'] = self.config.platform['target']

        if 'kind' not in flags:
            flags['kind'] = 'bin'

        self.selector = selector
        self.descr = cr.RenderContext(self).render()

        sd = self.config.store_dir

        self.uid = cu.struct_hash([
            1,
            self.descr['bld']['fetch'],
            self.descr['bld']['script'],
            self.norm_name,
            self.pkg_name,
            sd,
            self.iter_build_dirs(),
        ])

        self.out_dir = f'{sd}/{self.uid}-{self.pkg_name}'

    @property
    def norm_name(self):
        return self.name.removesuffix('.sh').removesuffix('/mix')

    @property
    @cu.cached_method
    def pkg_name(self):
        k = self.flags['kind']

        return canon_name(f'{k}-{self.norm_name}')

    @property
    def uniq_id(self):
        return self.pkg_name.replace('-', '_')

    @property
    def flags(self):
        return self.selector['flags']

    @property
    def name(self):
        res = self.selector['name']

        if not res.endswith('.sh'):
            res = res + '/mix.sh'

        return res

    @property
    def config(self):
        return self.manager.config

    @property
    def target(self):
        return self.flags['target']

    @property
    def host(self):
        return self.config.platform['host']

    def host_lib_flags(self):
        return {'target': self.host, 'kind': 'lib'}

    def target_lib_flags(self):
        return popf(cu.dict_dict_update(self.flags, {'kind': 'lib'}), 'setx')

    def bin_flags(self):
        return {'target': self.host, 'kind': 'bin'}

    def load_package(self, n, flags):
        try:
            n['name']
        except TypeError:
            n = make_selector(n, flags)

        return self.load_package_impl(n)

    def load_package_impl(self, sel):
        # print(f'{fmt_sel(self.selector)} -> {fmt_sel(sel)}')

        try:
            # TODO(pg): proper local flags
            return self.manager.load_package(popf(sel, 'setx'))
        except FileNotFoundError:
            raise ce.Error(f'can not load dependant package {fmt_sel(sel)} of {fmt_sel(self.selector)}')

    def load_packages(self, l, flags):
        return (self.load_package(x, flags) for x in l)

    def bld_lib_deps(self, k):
        yield from self.descr['bld'][k]

        for p in self.bld_bin_closure():
            yield from p.descr['ind']['deps']

    def bld_host_lib_deps(self):
        return self.bld_lib_deps('host_libs')

    def bld_target_lib_deps(self):
        return self.bld_lib_deps('target_libs')

    def visit(self, lst, flags, childf):
        return visit_lst(self.load_packages(lst, flags), childf)

    @cu.cached_method
    def bld_bin_closure(self):
        return self.visit(self.descr['bld']['deps'], self.bin_flags(), lambda x: x.run_closure())

    @cu.cached_method
    def lib_closure(self):
        return self.visit(self.descr['lib']['deps'], self.target_lib_flags(), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_host_lib_closure(self):
        return self.visit(self.bld_host_lib_deps(), self.host_lib_flags(), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_target_lib_closure(self):
        return self.visit(self.bld_target_lib_deps(), self.target_lib_flags(), lambda x: x.lib_closure())

    def bld_lib_closure(self):
        return itertools.chain(self.bld_target_lib_closure(), self.bld_host_lib_closure())

    def iter_all_build_depends(self):
        yield from add_kind('bin', self.bld_bin_closure())
        yield from add_kind('data', self.run_data())
        yield from add_kind('target lib', self.bld_target_lib_closure())
        yield from add_kind('host lib', self.bld_host_lib_closure())

    def iter_build_depends(self):
        pred = lambda x: x['p'].buildable()

        return filter(pred, self.iter_all_build_depends())

    def iter_build_dirs(self):
        return list(x['p'].out_dir for x in self.iter_build_depends())

    @cu.cached_method
    def run_deps(self):
        return list(self.load_packages(self.descr['run']['deps'], {'target': self.target, 'kind': 'bin'}))

    @cu.cached_method
    def run_data(self):
        return list(self.load_packages(self.descr['run']['data'], {'target': self.target, 'kind': 'aux'}))

    def all_run_deps(self):
        yield from self.run_deps()
        yield from self.run_data()

        for p in self.bld_target_lib_closure():
            yield from p.run_data()

    @cu.cached_method
    def run_closure(self):
        return visit_lst(self.all_run_deps(), lambda x: x.run_closure())

    def iter_all_runtime_depends(self):
        return filter(lambda x: x.buildable(), self.run_closure())

    def buildable(self):
        return not not self.descr['bld']['script']

    def iter_build_commands(self):
        return cg.iter_build_commands(self)
