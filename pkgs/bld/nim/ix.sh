{% extends '//bin/nim/t/ix.sh' %}

{% block build %}
# The release includes generated C sources; no existing Nim is needed.
sh build.sh --os {{self.nim_os().strip()}} --cpu {{self.nim_cpu().strip()}}
{% endblock %}
