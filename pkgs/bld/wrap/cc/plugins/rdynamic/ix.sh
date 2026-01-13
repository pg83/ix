{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/dlfcn
bld/wrap/cc/plugins/norm
bld/wrap/cc/plugins/rdynamic/unwrap
{% endblock %}
