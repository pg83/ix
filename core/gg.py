import os
import itertools
import multiprocessing

import core.utils as cu


def rec_node(n):
    return itertools.chain([n], n.iter_all_build_depends(), n.iter_all_runtime_depends())


def rec_nodes(n):
    v = set()

    def visit(x):
        if x.uid not in v:
            v.add(x.uid)

            yield x

            for y in rec_node(x):
                yield from visit(y)

    for x in n:
        yield from visit(x)


def build_commands(nodes):
    for x in rec_nodes(nodes):
        if x.buildable():
            yield from x.iter_build_commands()


def validate(nodes):
    for n in nodes:
        if n['pool'] == 'network':
            if not n.get('predict', None):
                raise Exception(f'invalid node {n}')

        yield n


def slots(t):
    if t > 16:
        return int(t**0.5)

    if t > 11:
        return 4

    if t > 7:
        return 3

    if t > 3:
        return 2

    return 1


def build_graph(n):
    t = int(os.environ.get('IX_THREADS') or multiprocessing.cpu_count())

    return {
        'nodes': list(validate(cu.iter_uniq_list(build_commands(n)))),
        'targets': [(x.out_dir + '/touch') for x in n],
        'pools': {
            'full': 2 if t > 32 else 1,
            'slot': slots(t),
            'misc': 4,
            'threads': 1,
            'network': 16,
        },
    }
