{% extends 'base.sh' %}

{% block std_box %}
bld/pzd/des
{{super()}}
{% endblock %}

{% block nim_refine %}
{% endblock %}

{% block bld_data %}
aux/nim/v1(url={{self.nim_url().strip()}},fetch_sha={{self.nim_src_sha().strip()}},sha={{self.nim_sha().strip()}},parent_id={{self.nim_src_sha().strip()}},refine={{self.nim_refine().strip() | b64e}})
{% endblock %}

{% block unpack %}
mkdir src
cd src
des ${src}/*.pzd .
{% endblock %}

{% block build %}
nimcc --out:${tmp}/{{self.nim_bin().strip()}}{{target.exe_suffix}} {{self.nim_main().strip()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp ${tmp}/{{self.nim_bin().strip()}}{{target.exe_suffix}} ${out}/bin/
{% endblock %}
