{% extends '//bld/boot/10/bison/t/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.xz
27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d
https://github.com/stal-ix/sources/raw/main/bison-bootstrap-master.tar.bz2
be50cb3cb8698d07318adfce8df916f0c0a15a5647154d73b555bb8a1515706f
{% endblock %}

{% block unpack %}
extract1 ${src}/bison-3*
extract0 ${src}/bison-b*
ln -s bison-b* bb
{% endblock %}
