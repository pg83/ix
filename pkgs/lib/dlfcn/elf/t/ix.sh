{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
solo
{% endblock %}

{# Bundle support — soloBundleMain() and dev/solo_pack.py — landed after
   tag 10, so this pin has to move before bin/*/solo can build. Replace the
   placeholder with the sha256 of the release tarball. #}

{% block version %}
11
{% endblock %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/{{self.version().strip()}}.tar.gz
FILL-IN-THE-SHA256-OF-THE-SOLO-11-RELEASE-TARBALL
{% endblock %}

{% block std_box %}
bin/python/12(intl_ver=no)
bld/pkg/config
{{super.super()}}
{% endblock %}
