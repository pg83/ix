{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
extra-cmake-modules
{% endblock %}

{% block version %}
6.30.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
018fd7c33f873cd7a5288b6c8a0f048ad04e7ceed70348badffd3be28061d1ad
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
