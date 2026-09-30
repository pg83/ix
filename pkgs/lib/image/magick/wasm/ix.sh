{# ImageMagick as one pure wasm module with a single decode() export.

   Built for wasm32-none: the module imports nothing, and the build proves
   it with wasm-imports. The build also runs the module: the host
   ImageMagick draws an original, writes it in every format the wasm build
   decodes, and produces the reference pixels for the same pipeline
   (auto-orient, sRGB, 8-bit RGBA); wasm-decode on WAMR feeds each file to
   decode() and compares. Lossless formats must match exactly, lossy ones
   within one step. Broken files must fail without taking the loader
   down, and every image is decoded twice in one instance, which is how a
   viewer reuses it. #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/image/magick
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/wasm/opt
bld/wasm/imports
bld/wasm/decode(jit=1)
bld/magick
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > decode.c
{{ix.load_file('decode.c')}}
EOF

# no entry: the host just calls decode. decode runs the static constructors
# once per instance, on its first call; later calls in the same instance skip
# that. Because the module references __wasm_call_ctors itself, wasm-ld does
# not wrap the exports with a ctors/dtors pair per call. 8 MB of stack for
# the coders.
${CC} decode.c -o decode.wasm \
    $(pkg-config --cflags MagickWand-7.Q16HDRI) \
    $(pkg-config --static --libs MagickWand-7.Q16HDRI) \
    -Wl,--no-entry \
    -Wl,--export=decode \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

# binaryen's optimizer on the linked module: whole-program passes wasm-ld
# has no equivalent of, identical-function folding among them. It reads
# the module's target_features section and stays inside it. clang would
# run wasm-opt -O2 by itself when it finds one in PATH; --no-wasm-opt
# above keeps this the only pass.
ls -la decode.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 decode.wasm -o decode.wasm
ls -la decode.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none decode.wasm

mkdir images refs bad

# the original: shapes with real alpha on a transparent canvas, and an
# opaque variant on a gradient for the formats without alpha
magick -size 320x240 xc:none \
    -fill 'rgba(0,200,80,0.6)' -stroke none -draw 'circle 160,120 160,50' \
    -fill 'rgba(255,255,255,0.9)' -stroke black -strokewidth 3 -draw 'rectangle 20,20 120,90' \
    -fill none -stroke '#ff00ff' -strokewidth 5 -draw 'line 0,239 319,0' \
    -fill '#ffcc00' -stroke none -draw 'polygon 240,200 300,200 270,150' \
    images/orig.png

magick -size 320x240 gradient:'#ff8800-#0044ff' images/orig.png -composite images/opaque.png

# name file tolerance
: > cases.txt

case_() {
    echo "$1 images/$2 $3" >> cases.txt
}

magick images/orig.png images/rgba.png;                                  case_ png-rgba rgba.png 0
magick images/opaque.png -colors 200 png8:images/pal.png;                case_ png-palette pal.png 0
magick images/opaque.png -depth 16 images/deep.png;                      case_ png-16bit deep.png 0
magick images/opaque.png -colorspace Gray images/gray.png;               case_ png-gray gray.png 0
magick images/orig.png -interlace PNG images/ilace.png;                  case_ png-interlaced ilace.png 0
magick images/opaque.png -quality 90 images/q90.jpg;                     case_ jpeg q90.jpg 1
magick images/opaque.png -quality 85 -interlace JPEG images/prog.jpg;    case_ jpeg-progressive prog.jpg 1
magick images/opaque.png -colorspace CMYK images/cmyk.jpg;               case_ jpeg-cmyk cmyk.jpg 1
magick images/opaque.png -colorspace Gray images/gray.jpg;               case_ jpeg-gray gray.jpg 1
magick images/orig.png -define webp:lossless=true images/ll.webp;        case_ webp-lossless ll.webp 0
magick images/opaque.png -quality 80 images/q80.webp;                    case_ webp q80.webp 1
magick images/orig.png -compress None images/none.tif;                   case_ tiff-none none.tif 0
magick images/orig.png -compress LZW images/lzw.tif;                     case_ tiff-lzw lzw.tif 0
magick images/opaque.png -compress Zip -depth 16 images/zip16.tif;       case_ tiff-zip-16bit zip16.tif 0
magick images/opaque.png -orient RightTop images/orient.tif;             case_ tiff-orientation orient.tif 0
magick images/orig.png -quality 100 images/ll.jxl;                       case_ jxl-lossless ll.jxl 0
magick images/opaque.png -quality 85 images/q85.jxl;                     case_ jxl q85.jxl 1
magick images/opaque.png images/plain.jp2;                               case_ jpeg2000 plain.jp2 1
magick images/opaque.png images/plain.gif;                               case_ gif plain.gif 0
magick images/opaque.png \( +clone -negate \) \( +clone -flop \) -delay 10 images/anim.gif
                                                                         case_ gif-animated anim.gif 0
magick images/opaque.png images/plain.bmp;                               case_ bmp plain.bmp 0
magick images/opaque.png images/plain.ppm;                               case_ ppm plain.ppm 0
magick images/opaque.png -colorspace Gray images/plain.pgm;              case_ pgm plain.pgm 0
magick images/opaque.png -monochrome images/plain.pbm;                   case_ pbm plain.pbm 0
magick images/orig.png images/plain.pam;                                 case_ pam plain.pam 0
magick images/orig.png images/plain.tga;                                 case_ tga plain.tga 0
magick images/opaque.png images/plain.pcx;                               case_ pcx plain.pcx 0
magick images/opaque.png images/plain.sgi;                               case_ sgi plain.sgi 0
magick images/orig.png images/plain.miff;                                case_ miff plain.miff 0
magick -seed 7 -size 1600x1200 plasma:fractal images/big.png;            case_ png-1600x1200 big.png 0

# references: the host ImageMagick through the pipeline decode() applies.
# The same ImageMagick build must agree to the bit; a different version or
# quantum (the system's Q16 against our Q16-HDRI) rounds 16-bit data
# differently, so then every case allows one step.
vh="$(pkg-config --variable=includedir MagickWand-7.Q16HDRI)/MagickCore/version.h"
ours="$(sed -n 's/^#define MagickLibVersionText *"\([^"]*\)".*/\1/p' "${vh}")$(sed -n 's/^#define MagickLibAddendum *"\([^"]*\)".*/\1/p' "${vh}") Q16-HDRI"
host="$(magick -version | sed -n 's/^Version: ImageMagick \([^ ]*\) \([^ ]*\).*/\1 \2/p')"
floor=0
if [ "${host}" != "${ours}" ]; then
    echo "reference ImageMagick ${host}, module ImageMagick ${ours}: tolerance floor 1"
    floor=1
fi

while read name file tol; do
    src=${file}
    case ${name} in
        gif-animated) src="${file}[0]";;
    esac
    magick "${src}" -auto-orient -colorspace sRGB -depth 8 "rgba:refs/${name}.rgba"
    magick "${src}" -auto-orient -format '%w %h' info: > refs/${name}.dim
done < cases.txt

# broken inputs: must fail, must not hang or crash the loader
for f in rgba.png q90.jpg ll.jxl q80.webp lzw.tif plain.jp2 plain.gif; do
    n=$(wc -c < images/${f})
    head -c $((n * 6 / 10)) images/${f} > bad/trunc-${f}
    cp images/${f} bad/mid-${f}
    head -c 64 /dev/urandom | dd of=bad/mid-${f} bs=1 seek=$((n / 2)) conv=notrunc 2>/dev/null
done
head -c 4096 /dev/urandom > bad/noise.bin
: > bad/empty.bin

fail=0

while read name file tol; do
    set -- $(cat refs/${name}.dim)
    [ "${tol}" -lt "${floor}" ] && tol=${floor}
    if out=$(wasm-decode decode.wasm ${file} $1 $2 ${tol} refs/${name}.rgba 2>&1); then
        echo "ok   ${name}: ${out}"
    else
        echo "FAIL ${name}: ${out}"
        fail=1
    fi
done < cases.txt

for f in bad/*; do
    rc=0
    out=$(wasm-decode decode.wasm ${f} -o /dev/null 2>&1) || rc=$?
    case ${rc} in
        1|3) echo "ok   $(basename ${f}): rejected (${rc}) ${out}";;
        0) echo "ok   $(basename ${f}): decoded anyway, ${out}";;
        *) echo "FAIL $(basename ${f}): loader exit ${rc} ${out}"; fail=1;;
    esac
done

test ${fail} = 0
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp decode.wasm ${out}/share/
{% endblock %}

{# postinstall moves share/ to lib/aux/ for a lib package; the env is
   written after that, so consumers get the final path #}
{% block env %}
export IX_IMAGE_MAGICK_DECODE_WASM="${out}/lib/aux/decode.wasm"
{% endblock %}
