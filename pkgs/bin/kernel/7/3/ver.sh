{% block kernel_version %}
7.3
{% endblock %}

{% block kernel_sha %}
87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
