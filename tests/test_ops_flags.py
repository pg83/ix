import os
from pathlib import Path
import runpy
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[1]
runpy.run_path(str(ROOT / 'ix'))

from core.config import Config
from core.manager import Manager


class RuntimeVariantTests(unittest.TestCase):
    def variant(self, backend, env_flags='', package_flags=None):
        env = {'PATH': os.defpath, 'IX_EXEC_KIND': backend, 'IX_FLAGS': env_flags}

        # Only tool discovery is stubbed: render the real xkbcommon recipe
        # through the selected backend without executing a build.
        with patch.dict(os.environ, env, clear=True), \
             patch('core.ops_sys.choice', return_value='/unused'), \
             patch('core.ops_molot.shutil.which', return_value='/unused'):
            config = Config(str(ROOT / 'ix'), [str(ROOT / 'pkgs')], '/ix', False, False, '')
            descriptor = Manager(config).load_descriptor({
                'name': 'lib/xkb/common',
                'flags': package_flags or {},
            })

            return descriptor.descr['lib']['deps']

    def test_backend_defaults(self):
        for backend in ('system', 'molot', 'local', 'fake'):
            with self.subTest(backend=backend):
                variant = 'stalix' if backend in ('system', 'molot') else 'default'
                self.assertEqual(self.variant(backend), [f'lib/xkb/common/{variant}'])

    def test_environment_override(self):
        for backend in ('system', 'molot', 'local', 'fake'):
            for flags, variant in (('stalix=', 'default'), ('stalix=1', 'stalix')):
                with self.subTest(backend=backend, flags=flags):
                    self.assertEqual(self.variant(backend, flags), [f'lib/xkb/common/{variant}'])

    def test_package_override(self):
        for backend in ('system', 'molot'):
            for env, value, variant in (('stalix=1', '', 'default'), ('stalix=', '1', 'stalix')):
                with self.subTest(backend=backend, env=env, value=value):
                    self.assertEqual(
                        self.variant(backend, env, {'stalix': value}),
                        [f'lib/xkb/common/{variant}'],
                    )


if __name__ == '__main__':
    unittest.main()
