{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
openvpn
{% endblock %}

{% block version %}
2.7.7
{% endblock %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b56dd6c4e8b38ce43e6f4a901435a41b0b646bd90ec050b38ea2ee5e94e81bde
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/lz4
lib/lzo
lib/kernel
lib/cap/ng
lib/bsd/overlay
lib/{{openvpnssl or 'openssl'}}
{% endblock %}

{% block configure_flags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}

{% block build %}
{{super()}}
>doc/openvpn.8
>doc/openvpn-examples.5
{% endblock %}
