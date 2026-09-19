{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if server %}
bin/autologin(slot=1)
{% else %}
bin/{{getty}}/runit(vt_slot=1,vt_session={{vt_1_session}})
bin/{{getty}}/runit(vt_slot=2,vt_session={{vt_2_session}})
bin/{{getty}}/runit(vt_slot=3,vt_session={{vt_3_session}})
bin/{{getty}}/runit(vt_slot=4,vt_session={{vt_4_session}})
{% if failsafe %}
bin/autologin(slot=5)
{% else %}
bin/{{getty}}/runit(vt_slot=5,vt_session={{vt_5_session}})
{% endif %}
{% endif %}
{% endblock %}
