{% block kernel_version %}
7.3.6
{% endblock %}

{% block kernel_sha %}
8183d475a76a0faffa92d6cd500af421f589dfd0300a0f1060bb875e11d45723
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
