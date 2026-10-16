{% block kernel_version %}
7.2.11
{% endblock %}

{% block kernel_sha %}
fd0fc479f983a8c05313f13e9c36330fe6651cf725396748c40d5cd93fa1e6a4
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
