{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/Nicoshev/rapidhash/archive/refs/tags/rapidhash_v3.tar.gz
2e708bb2be76fd76f1e5d75bb3145d058e2dad0c5b0022646f84ec83aeff400d
{% endblock %}

{% block install %}
mkdir ${out}/include
cp rapidhash.h ${out}/include/
{% endblock %}
