{# std::mutex for single-threaded sandboxes (wasm32-none): the target's
   libc++ is built without threads and leaves std::mutex and
   std::recursive_mutex out of <mutex>, while a library may lock its tables
   with one wherever it runs. This <mutex> takes the libc++ one and adds
   the two classes as locks of nothing, for the one thread there is. #}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/mutex
{% include 'mutex' %}
EOF
{% endblock %}
