{% extends '//etc/services/runit/script/ix.sh' %}

{% set srv_dir = 'ix_update' %}
{% set srv_user = 'pg' %}

{% block run_deps %}
bin/runsrv
set/pg/system/env
{% endblock %}

{% block srv_command %}
set -eu
. /etc/profile
export PATH=/ix/realm/pg/bin:/ix/realm/system/bin:/bin
sleep 60
cd /home/pg/{{'ix' if pg_host == 'note' else 'monorepo/ix'}}
git pull --ff-only
exec ./ix mut system
{% endblock %}
