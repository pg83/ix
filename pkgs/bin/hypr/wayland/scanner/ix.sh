{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v0.3.9.tar.gz
sha:94b1be527cf91071b59269bacf610b0c5992706a648dbea15797bdb5e15828f0
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}

