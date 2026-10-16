{% extends '//lib/python/3/12/t/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.14.8
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73
{% endblock %}

{% block cpp_defines %}
USE_SSL=1
USE_NDBM=1
HAVE_NDBM_H=1
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% block c_flags %}
{{super()}}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-test-modules
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc/plugins/dedup
{% endblock %}
