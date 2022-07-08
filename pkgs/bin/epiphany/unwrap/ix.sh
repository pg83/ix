{% extends '//die/gnome.sh' %}

{% block fetch %}
#https://download.gnome.org/sources/epiphany/42/epiphany-42.3.tar.xz
#sha:7316d3c6500e825d8e57293fa58047c56727bee16cd6b6ac804ffe5d9b229560
https://gitlab.gnome.org/GNOME/epiphany/-/archive/43.alpha/epiphany-43.alpha.tar.bz2
sha:b848328657e42ec14786b0522f3041f0e877d70af66154613c639f6e4aa45687
{% endblock %}

{% block bld_libs %}
lib/c
lib/gcr
lib/gtk
lib/gmp
lib/glib
lib/xml2
lib/cairo
lib/handy
lib/portal
lib/soup/3
lib/nettle
lib/secret
lib/dazzle
lib/sqlite3
lib/archive
lib/gtk/reg
lib/gtk/deps
lib/json/glib
lib/gdk/pixbuf
lib/web/kit/gtk
lib/glib/networking
lib/gsettings/desktop/schemas
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block run_data %}
aux/iso-codes
{% endblock %}

{% block meson_flags %}
unit_tests=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build

(find . -name '*.c' | while read l; do
    cat ${l}
done) | grep '_class_init' \
      | sed -e 's|_class_init.*|_get_type|' \
      | sort | uniq \
      | grep -v ephy_search_provider_get_type \
      | grep -v ephy_web_overview_model_get_type \
      | grep -v ephy_web_process_extension_get_type \
      | grep -v ephy_add_search_engine_row_item_get_type \
      | grep -v ephy_web_app_provider_service_get_type \
      | grep -v ephy_web_extension_extension_get_type \
      > types

cat << EOF >> types
adguard_get_resource
readability_get_resource
highlightjs_get_resource
pdfjs_get_resource
epiphany_get_resource
ephy_bookmark_properties_type_get_type
ephy_download_action_type_get_type
ephy_embed_shell_mode_get_type
ephy_history_page_visit_type_get_type
ephy_history_sort_type_get_type
ephy_history_url_property_get_type
ephy_link_flags_get_type
ephy_new_tab_flags_get_type
ephy_prefs_reader_color_scheme_get_type
ephy_prefs_reader_font_style_get_type
ephy_prefs_restore_session_policy_get_type
ephy_prefs_ui_tabs_bar_visibility_policy_get_type
ephy_prefs_web_hardware_acceleration_policy_get_type
ephy_security_level_get_type
ephy_sq_lite_connection_mode_get_type
ephy_startup_mode_get_type
ephy_web_view_document_type_get_type
ephy_web_view_error_page_get_type
ephy_web_view_navigation_flags_get_type
ephy_window_chrome_get_type
EOF

(
    echo 'void g_object_init();'

    cat types | while read l; do
        echo "GType ${l}(void);"
    done

    cat << EOF
__attribute__((constructor))
static void premain_init_types() {
    g_object_init();
EOF

    cat types | while read l; do
        echo "${l}();"
    done

    echo '}'
) >> src/ephy-main.c
{% endblock %}

{% block install %}
{{super()}}

{% call hooks.wrap_xdg_binary('epiphany') %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endcall %}

rm -r ${out}/bin/bin_*
{% endblock %}
