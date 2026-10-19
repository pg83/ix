{% extends '//die/c/make.sh' %}

{# repology reads the release number NNN as 3.NNN #}
{% block version %}
3.507
{% endblock %}

{% block pkg_name %}
iozone3
{% endblock %}

{% block fetch %}
https://www.iozone.org/src/current/iozone3_{{self.version().strip() | field(1)}}.tgz
dd03eccd3768e8400816d67ae0e47f4646cb5834cfc2fc09927fe7b87a6fca7a
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block unpack %}
{{super()}}
cd src/current
make clean
{% endblock %}

{% block make_target %}
linux
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp iozone fileop ${out}/bin/
{% endblock %}
