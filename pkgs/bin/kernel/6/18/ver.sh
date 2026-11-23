{% block kernel_version %}
6.18.65
{% endblock %}

{% block kernel_sha %}
c92606f956f09dc50b5a0e2af9e86763fce27ada1647de97f8d1ac8cfc95801d
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
