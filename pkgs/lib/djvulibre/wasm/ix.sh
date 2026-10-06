{# DjVuLibre as one pure wasm module with the exports of djvu.c: open a
   file from memory, count and measure its pages, render one to RGBA.

   Built for wasm32-none: the module imports nothing, and the build
   proves it with wasm-imports. The build also runs the module: wasm-page
   on WAMR opens a DjVu the host's c44 encoded from a picture, renders
   its page twice in one instance, which is how a viewer reuses it, and
   requires ink on the page. #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/djvulibre
{% endblock %}

{% block bld_tool %}
bld/python
bld/wasm/opt
bld/wasm/imports
bld/wasm/page(jit=1)
bin/djvulibre
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > djvu.cpp
{{ix.load_file('djvu.cpp')}}
EOF

# the module is compiled as the library was: its config.h, no exceptions,
# the trap in their place, the thread model of the shim. No entry: the
# host just calls the exports. djvu_open runs the static constructors once
# per instance, on an instance's first call; because the module references
# __wasm_call_ctors itself, wasm-ld does not wrap the exports with a
# ctors/dtors pair per call. 8 MB of stack for the decoder.
${CXX} ${CPPFLAGS} ${CXXFLAGS} -fno-exceptions -DHAVE_CONFIG_H -DDJVU_NO_EXCEPTIONS -DHAVE_PTHREAD=1 -c djvu.cpp -o djvu.o
${CXX} djvu.o -o djvu.wasm -ldjvulibre ${LDFLAGS} \
    -Wl,--no-entry \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

# binaryen's optimizer on the linked module: whole-program passes wasm-ld
# has no equivalent of. clang would run wasm-opt -O2 by itself when it
# finds one in PATH; --no-wasm-opt above keeps this the only pass.
ls -la djvu.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 djvu.wasm -o djvu.wasm
ls -la djvu.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none djvu.wasm

# a page to render: a gradient with a dark box, which c44 encodes as an
# IW44 colour page
python3 - << 'EOF'
w, h = 200, 100
out = bytearray(b"P6\n%d %d\n255\n" % (w, h))
for y in range(h):
    for x in range(w):
        if 20 <= x < 80 and 20 <= y < 80:
            out += bytes((20, 30, 40))
        else:
            out += bytes((x * 255 // w, y * 255 // h, 200))
open("page.ppm", "wb").write(out)
EOF
c44 page.ppm page.djvu

wasm-page djvu.wasm djvu page.djvu 0 400 200 out.rgba | tee render.txt
ink=$(sed -n 's/.* \([0-9]*\) with ink$/\1/p' render.txt)
test "${ink:-0}" -gt 100
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp djvu.wasm ${out}/share/
{% endblock %}

{# postinstall moves share/ to lib/aux/ for a lib package; the env is
   written after that, so consumers get the final path #}
{% block env %}
export IX_DJVULIBRE_WASM="${out}/lib/aux/djvu.wasm"
{% endblock %}
