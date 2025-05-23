{% extends '//die/base.sh' %}

{% block git_sha %}
{% endblock %}

{% block git_repo %}
{% endblock %}

{% block git_branch %}
{% endblock %}

{% block git_commit %}
{% endblock %}

{% block git_refine %}
{% endblock %}

{% block git_version %}
v3
{% endblock %}

{% block bld_deps %}
{% if self.git_sha().strip() %}
bld/pzd/des
{% endif %}
{{super()}}
{% endblock %}

{% block git_hook_1 %}
{% endblock %}

{% block git_args %}
parent_id=src_{{self.git_sha().strip()}}
sha={{self.git_sha().strip()}}
branch={{self.git_branch().strip()}}
repo={{self.git_repo().strip()}}
commit={{self.git_commit().strip()}}
refine={{self.git_refine().strip() | b64e}}
git_hook_1={{self.git_hook_1() | b64e}}
{% endblock %}

{% block bld_data %}
{% if self.git_sha().strip() %}
aux/git/{{self.git_version().strip()}}({{self.git_args().strip().replace('\n', ',')}})
{% endif %}
{{super()}}
{% endblock %}

{% block step_unpack %}
{% if self.git_sha().strip() %}
mkdir src
cd src
des ${GIT_TGZ} .
{% else %}
{{super()}}
{% endif %}
{% endblock %}
