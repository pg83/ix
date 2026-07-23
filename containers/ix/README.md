# Running IX in a container

The container supplies bootstrap tools while all mutable IX data remains on the
host. `IX_STATE_DIR` is mounted at `/ix` and contains `store`, `build`, `trash`,
and assembled realms. The repository itself is mounted read-only at `/src/ix`.

Load the dedicated AppArmor profile once after boot:

```sh
./containers/ix/load_apparmor.sh
```

Run any IX command with an explicit external state directory:

```sh
IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/run.sh build bin/shitty
```

Assemble the system realms in the same external directory:

```sh
IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/run.sh mut system set/stalix --failsafe --mingetty etc/zram/0
IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/run.sh mut root set/install
IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/run.sh mut boot set/boot/all
```

Converge the system realm using the assembled target tools:

```sh
IX_CONTAINER_TARGET_ENV=1 IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/run.sh mut system
```

Import the assembled root as a Docker image. The importer follows `meta.json`
links from the three realm outputs and copies only that recursive store closure.
It does not include the source checkout, `build`, `trash`, or unrelated store
objects. Numeric ownership, modes, hardlinks, ACLs, and extended attributes are
preserved:

```sh
IX_STATE_DIR=/absolute/path/to/ix ./containers/ix/import_image.sh shitty
```

The container drops all outer capabilities and enables `no-new-privileges`.
Its seccomp profile is derived from the pinned Moby default profile and adds
only the two namespace masks and exact mount flag combinations used by the IX
sandbox. AppArmor additionally restricts the mount sources, targets, filesystem
type, and options. The generated profile is stored next to the state directory
in `${IX_STATE_DIR}.container` by default.

Creating the profile for the first time requires host Python and access to the
pinned Moby profile URL. Later runs reuse the verified generated file and do not
invoke host Python or download the profile again. The Docker builder image
supplies the bootstrap compilers and Python used by IX itself.
