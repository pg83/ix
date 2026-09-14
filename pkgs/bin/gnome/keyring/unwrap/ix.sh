{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gnome-keyring
{% endblock %}

{% block version %}
51.0
{% endblock %}

{# need to statlink plugins #}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-keyring/-/archive/{{self.version().strip()}}/gnome-keyring-{{self.version().strip()}}.tar.bz2
d9465633280b4633231fd74ff5c5f49178ff6c68acbfea24924ccc66a2fb80c5
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/gcr
lib/glib
lib/gcrypt
lib/secret
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block meson_flags %}
systemd=disabled
manpage=false
debug-mode=false
pkcs11-modules=${out}/lib
pkcs11-config=${out}/lib
{% endblock %}

{% block patch %}
find ./egg/ -type f -name '*.c' | grep egg- | grep -v egg-cleanup | while read l; do
    echo > ${l}
done
find ./ -type f -name '*.c' | grep test- | while read l; do
    echo 'int main() {}' > ${l}
done
{% endblock %}

{% block c_rename_symbol %}
SECMEM_pool_data_v1_0
{% endblock %}
