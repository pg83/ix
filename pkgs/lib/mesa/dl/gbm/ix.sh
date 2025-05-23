{% extends '//die/dl/fix.sh' %}

{% block export_prefix %}
mesa_gbm_
{% endblock %}

{% block export_lib %}
gbm
{% endblock %}

{% block export_symbols %}
gbm_bo_create
gbm_bo_create_with_modifiers
gbm_bo_create_with_modifiers2
gbm_bo_destroy
gbm_bo_get_bpp
gbm_bo_get_device
gbm_bo_get_fd
gbm_bo_get_fd_for_plane
gbm_bo_get_format
gbm_bo_get_handle
gbm_bo_get_handle_for_plane
gbm_bo_get_height
gbm_bo_get_modifier
gbm_bo_get_offset
gbm_bo_get_plane_count
gbm_bo_get_stride
gbm_bo_get_stride_for_plane
gbm_bo_get_user_data
gbm_bo_get_width
gbm_bo_import
gbm_bo_map
gbm_bo_set_user_data
gbm_bo_unmap
gbm_bo_write
gbm_create_device
gbm_device_destroy
gbm_device_get_backend_name
gbm_device_get_fd
gbm_device_get_format_modifier_plane_count
gbm_device_is_format_supported
gbm_format_get_name
gbm_surface_create
gbm_surface_create_with_modifiers
gbm_surface_create_with_modifiers2
gbm_surface_destroy
gbm_surface_has_free_buffers
gbm_surface_lock_front_buffer
gbm_surface_release_buffer
{% endblock %}
