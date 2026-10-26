{% block kernel_version %}
6.18.59
{% endblock %}

{% block kernel_sha %}
53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963
{% endblock %}

{% block kernel_url %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-{{self.kernel_version().strip()}}.tar.xz
{% endblock %}
