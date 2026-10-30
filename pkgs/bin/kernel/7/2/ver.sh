{% block kernel_version %}
7.2.14
{% endblock %}

{% block kernel_sha %}
bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
