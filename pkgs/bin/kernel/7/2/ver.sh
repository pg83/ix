{% block kernel_version %}
7.2.13
{% endblock %}

{% block kernel_sha %}
08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
