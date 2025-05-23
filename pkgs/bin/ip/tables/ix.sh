{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iptables
{% endblock %}

{% block version %}
1.8.11
{% endblock %}

{% block git_repo %}
https://git.netfilter.org/iptables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
b99b603ff20cd976ba9181034ffbd130e702b3e4601e71caf7b89346efefbe3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/nft/nl
lib/kernel
lib/nfnetlink
{% endblock %}

{% block cpp_defines %}
__UAPI_DEF_ETHHDR=0
{% endblock %}
