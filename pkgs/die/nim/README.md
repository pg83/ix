# Nim packages

`base.sh` provides the host `bin/nim` compiler and an `nimcc` command which
compiles for the ix target through the ix C toolchain. Packages with `host_libs`
also get `nimhost` for build-time generators. `nim_flags` adds target compiler
options (release mode by default). Both commands accept normal `nim c` options;
the default caches live in `${tmp}` and can be overridden per executable.

Use `base.sh` for upstream build systems, e.g. `bin/chawan`, passing `nimcc`
to Make for target programs and `nimhost` for host generators.

`build.sh` adds Nimble dependency vendoring and builds a single executable:

```jinja2
{% extends '//die/nim/build.sh' %}

{% block nim_url %}https://example.org/app-1.0.tar.gz{% endblock %}
{% block nim_src_sha %}<source archive SHA256>{% endblock %}
{% block nim_sha %}<vendored PZD SHA256>{% endblock %}
{% block nim_main %}src/app.nim{% endblock %}
{% block nim_bin %}app{% endblock %}
```

`aux/nim/v1` uses `bld/nimble` and requires an upstream `nimble.lock`. It installs
dependencies with the ix Nim compiler, checks that the lockfile is unchanged,
and produces a source archive with relative, sorted dependency paths. Package
downloads and VCS caches are discarded. `nim_refine` optionally adjusts the
prepared source tree before packing. The target build uses neither Nimble nor
the network; it reads only the bundled paths. C dependencies remain `bld_libs`.

For a new archive, run the auxiliary build with a temporary expected hash,
then pin the SHA256 printed by `stable_pack_v3`. Verify another clean preparation
against that hash. Use `bld/pzd/ser` (including its pinned zstd) for local hash
checks: another zstd version can produce different compressed bytes.

Examples: `bin/moe/nim` (Nimble) and `bin/chawan` (Make, bundled dependencies).
`bin/moe` is the separate GNU Moe editor.
