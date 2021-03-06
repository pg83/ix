{% extends 'configure.sh' %}

{% block step_setup %}
export FORCE_UNSAFE_CONFIGURE=1
{{super()}}
{% endblock %}

{% block step_patch %}
{% block touch_yl %}
find . -type f | grep '\.[yl]$' | while read l; do
    echo "TOUCH ${l}"
    touch ${l}
done
{% endblock %}

{% if super().strip() %}
(
{{super()}}
)
{% endif %}

{% block patch_configure %}
find . -type f -name configure | while read l; do
    sed -e "s|/usr/bin/||g"             \
        -e "s|/usr/|/nowhere/|g"        \
        -e "s|/bin/sh|$(which sh)|g"    \
        -e "s|/bin/arch|arch|g"         \
        -e "s|/bin/uname|uname|g"       \
        -e "s|/bin/machine|machine|g"   \
        -e "s|/bin/universe|universe|g" \
        ${l} > _ && mv _ ${l}

    chmod +x ${l}
done
{% endblock %}
{% endblock %}

{% block configure_all_flags %}
${COFLAGS}

{% block configure_cross %}
{% if bin %}
--program-prefix={{bin_prefix or ''}}
--target={{for_target or target.gnu.three}}
{% else %}
--program-prefix=
--target={{target.gnu.three}}
{% endif %}

--build={{host.gnu.three}}
--host={{target.gnu.three}}
{% endblock %}

--enable-silent-rules
--disable-dependency-tracking

{% block enable_static %}
--enable-static
{% endblock %}
--disable-shared

{{super()}}
{% endblock %}
