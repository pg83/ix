{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/wabt/runtime(trap_handler=decodeTrapHandler)
{% endblock %}

{% block bld_data %}
lib/image/magick/wasm(target=wasm32-none,kind=lib,simd128={{simd128}})
{% endblock %}

{% block bld_tool %}
bld/wabt
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
wasm2c --version
wasm2c "${IX_IMAGE_MAGICK_DECODE_WASM}" --module-name decode --num-outputs 16 -o decode.c

# 170 MB of generated C: its warnings are the generator's, and debug info
# for it would outweigh the library
export CC CPPFLAGS CFLAGS
ls decode_*.c | xargs -P "$(nproc)" -I{} sh -c '${CC} ${CPPFLAGS} ${CFLAGS} -g0 -w -c {} -o {}.o'
ar rcs libdecode.a *.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include
cp libdecode.a ${out}/lib/
cp decode.h ${out}/include/
{% endblock %}
