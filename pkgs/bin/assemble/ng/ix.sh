{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/b66418c2d28afac3d33c0327405bf0d9ab43c86d.tar.gz
{% endblock %}

{% block go_sha %}
0000000000000000000000000000000000000000000000000000000000000000
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/assemble{{target.exe_suffix}} ${out}/bin/assemble_ng{{target.exe_suffix}}
{% endblock %}
