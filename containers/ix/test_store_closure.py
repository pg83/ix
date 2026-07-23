import json
import os
import tempfile
import unittest
from pathlib import Path

from store_closure import resolve_closure, write_manifest


class StoreClosureTest(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.state = Path(self.temporary.name)
        (self.state / "store").mkdir()
        (self.state / "realm").mkdir()

    def tearDown(self):
        self.temporary.cleanup()

    def add_store_object(self, name, links=()):
        store_object = self.state / "store" / name
        store_object.mkdir()
        (store_object / "touch").touch()
        (store_object / "meta.json").write_text(
            json.dumps({"links": list(links)}),
            encoding="utf-8",
        )

    def test_resolves_only_recursive_realm_closure(self):
        self.add_store_object(
            "system",
            ("/ix/store/runtime", "/ix/store/shared"),
        )
        self.add_store_object("root", ("/ix/store/shared",))
        self.add_store_object("boot")
        self.add_store_object("runtime", ("/ix/store/transitive",))
        self.add_store_object("shared")
        self.add_store_object("transitive")
        self.add_store_object("unrelated")

        for realm in ("system", "root", "boot"):
            os.symlink(
                f"/ix/store/{realm}",
                self.state / "realm" / realm,
            )

        (self.state / "build").mkdir()
        (self.state / "build" / "sentinel").touch()
        (self.state / "trash").mkdir()
        (self.state / "trash" / "sentinel").touch()

        closure = resolve_closure(self.state)

        self.assertEqual(
            closure,
            [
                "boot",
                "root",
                "runtime",
                "shared",
                "system",
                "transitive",
            ],
        )
        self.assertNotIn("unrelated", closure)

    def test_rejects_store_path_traversal(self):
        self.add_store_object("system", ("/ix/store/../secret",))
        self.add_store_object("root")
        self.add_store_object("boot")
        for realm in ("system", "root", "boot"):
            os.symlink(
                f"/ix/store/{realm}",
                self.state / "realm" / realm,
            )

        with self.assertRaisesRegex(ValueError, "invalid store object name"):
            resolve_closure(self.state)

    def test_writes_sorted_manifest(self):
        destination = self.state / "runtime" / "closure.txt"

        write_manifest(["a", "b"], destination)

        self.assertEqual(destination.read_text(encoding="utf-8"), "a\nb\n")


if __name__ == "__main__":
    unittest.main()
