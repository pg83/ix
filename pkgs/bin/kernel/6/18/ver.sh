{% block kernel_version %}
6.18.58
{% endblock %}

{% block kernel_sha %}
069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
