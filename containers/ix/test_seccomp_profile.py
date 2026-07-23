import pathlib
import sys
import unittest

sys.path.insert(0, str(pathlib.Path(__file__).parent))

import seccomp_profile


class ExtendForIxTest(unittest.TestCase):
    def test_adds_only_expected_rules(self):
        profile = {"syscalls": []}

        result = seccomp_profile.extend_for_ix(profile)

        self.assertIs(result, profile)
        self.assertEqual(
            len(result["syscalls"]),
            2 + len(seccomp_profile.IX_MOUNT_FLAGS),
        )
        self.assertEqual(
            result["syscalls"][0]["args"][0]["value"],
            seccomp_profile.CLONE_NEWUSER | seccomp_profile.CLONE_NEWNS,
        )
        self.assertEqual(
            result["syscalls"][1]["args"][0]["value"],
            seccomp_profile.CLONE_NEWUSER
            | seccomp_profile.CLONE_NEWNS
            | seccomp_profile.CLONE_NEWNET,
        )
        mount_rules = result["syscalls"][2:]
        self.assertEqual(
            [rule["names"] for rule in mount_rules],
            [["mount"]] * len(seccomp_profile.IX_MOUNT_FLAGS),
        )
        self.assertEqual(
            [rule["args"][0]["index"] for rule in mount_rules],
            [3] * len(seccomp_profile.IX_MOUNT_FLAGS),
        )
        self.assertEqual(
            [rule["args"][0]["value"] for rule in mount_rules],
            list(seccomp_profile.IX_MOUNT_FLAGS),
        )
        self.assertEqual(
            [rule["args"][0]["op"] for rule in mount_rules],
            ["SCMP_CMP_EQ"] * len(seccomp_profile.IX_MOUNT_FLAGS),
        )
        added_names = {name for rule in result["syscalls"] for name in rule["names"]}
        self.assertNotIn("pivot_root", added_names)
        self.assertNotIn("umount", added_names)
        self.assertNotIn("umount2", added_names)
        self.assertTrue(
            all(rule["action"] == "SCMP_ACT_ALLOW" for rule in result["syscalls"])
        )

    def test_rejects_missing_syscall_list(self):
        with self.assertRaisesRegex(ValueError, "no syscall list"):
            seccomp_profile.extend_for_ix({})


if __name__ == "__main__":
    unittest.main()
