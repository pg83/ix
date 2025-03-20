{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/sysprof/-/archive/48.0/sysprof-48.0.tar.bz2
sha:bc6d5774cf6734a94484e6160ed476a86c38030cede6444b874c2767c011dddd
{% endblock %}

{% block bld_libs %}
lib/c
lib/dex
lib/gtk
lib/glib
lib/panel
lib/unwind
lib/adwaita
lib/json/glib
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block meson_flags %}
help=false
tools=false
tests=false
examples=false
sysprofd=none
systemdunitdir=${out}/share/systemd
{% endblock %}

{% block patch %}
sed -e 's|libsysprof = library|libsysprof = shared_library|' \
    -i src/libsysprof/meson.build
sed -e 's|.*PolkitDetail.*||' \
    -i src/libsysprof/sysprof-instrument.c
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}

{% block c_rename_symbol %}
array_array_container_andnot
array_array_container_iandnot
array_array_container_inplace_union
array_array_container_ixor
array_array_container_lazy_inplace_union
array_array_container_lazy_union
array_array_container_lazy_xor
array_array_container_union
array_array_container_xor
array_bitset_container_andnot
array_bitset_container_iandnot
array_bitset_container_intersect
array_bitset_container_intersection
array_bitset_container_intersection_cardinality
array_bitset_container_ixor
array_bitset_container_lazy_union
array_bitset_container_lazy_xor
array_bitset_container_union
array_bitset_container_xor
array_container_add_from_range
array_container_andnot
array_container_clone
array_container_copy
array_container_create
array_container_create_given_capacity
array_container_create_range
array_container_deserialize
array_container_equal_bitset
array_container_free
array_container_from_bitset
array_container_from_run
array_container_grow
array_container_intersect
array_container_intersection
array_container_intersection_cardinality
array_container_intersection_inplace
array_container_is_subset
array_container_is_subset_bitset
array_container_is_subset_run
array_container_iterate
array_container_iterate64
array_container_negation
array_container_negation_range
array_container_negation_range_inplace
array_container_number_of_runs
array_container_printf
array_container_printf_as_uint32_array
array_container_read
array_container_serialization_len
array_container_serialize
array_container_shrink_to_fit
array_container_to_uint32_array
array_container_union
array_container_write
array_container_xor
array_run_container_andnot
array_run_container_iandnot
array_run_container_inplace_union
array_run_container_intersect
array_run_container_intersection
array_run_container_intersection_cardinality
array_run_container_ixor
array_run_container_lazy_xor
array_run_container_union
array_run_container_xor
bitset_array_container_andnot
bitset_array_container_iandnot
bitset_array_container_ixor
bitset_bitset_container_andnot
bitset_bitset_container_iandnot
bitset_bitset_container_intersection
bitset_bitset_container_intersection_inplace
bitset_bitset_container_ixor
bitset_bitset_container_xor
bitset_clear_list
bitset_container_add_from_range
bitset_container_and
bitset_container_and_justcard
bitset_container_and_nocard
bitset_container_andnot
bitset_container_andnot_justcard
bitset_container_andnot_nocard
bitset_container_clear
bitset_container_clone
bitset_container_compute_cardinality
bitset_container_copy
bitset_container_create
bitset_container_deserialize
bitset_container_equals
bitset_container_free
bitset_container_from_array
bitset_container_from_run
bitset_container_from_run_range
bitset_container_index_equalorlarger
bitset_container_intersect
bitset_container_intersection
bitset_container_intersection_justcard
bitset_container_intersection_nocard
bitset_container_is_subset
bitset_container_is_subset_run
bitset_container_iterate
bitset_container_iterate64
bitset_container_maximum
bitset_container_minimum
bitset_container_negation
bitset_container_negation_inplace
bitset_container_negation_range
bitset_container_negation_range_inplace
bitset_container_number_of_runs
bitset_container_or
bitset_container_or_justcard
bitset_container_or_nocard
bitset_container_printf
bitset_container_printf_as_uint32_array
bitset_container_rank
bitset_container_read
bitset_container_select
bitset_container_serialization_len
bitset_container_serialize
bitset_container_set_all
bitset_container_set_range
bitset_container_to_uint32_array
bitset_container_union
bitset_container_union_justcard
bitset_container_union_nocard
bitset_container_write
bitset_container_xor
bitset_container_xor_justcard
bitset_container_xor_nocard
bitset_extract_intersection_setbits_uint16
bitset_extract_setbits
bitset_extract_setbits_sse_uint16
bitset_extract_setbits_uint16
bitset_flip_list
bitset_flip_list_withcard
bitset_run_container_andnot
bitset_run_container_iandnot
bitset_run_container_ixor
bitset_set_list
bitset_set_list_withcard
container_clone
container_deserialize
container_free
container_printf
container_printf_as_uint32_array
container_serialization_len
container_serialize
convert_run_optimize
convert_run_to_efficient_container
convert_run_to_efficient_container_and_free
convert_to_bitset_or_array_container
difference_uint16
extend_array
fast_union_uint16
get_copy_of_container
intersect_skewed_uint16
intersect_skewed_uint16_cardinality
intersect_skewed_uint16_nonempty
intersect_uint16
intersect_uint16_cardinality
intersect_uint16_nonempty
intersection_uint32
intersection_uint32_card
memequals
ra_advance_until_freeing
ra_append
ra_append_copies_after
ra_append_copies_until
ra_append_copy
ra_append_copy_range
ra_append_move_range
ra_append_range
ra_clear
ra_clear_containers
ra_clear_without_containers
ra_copy
ra_copy_range
ra_downsize
ra_get_key_at_index
ra_has_run_container
ra_init
ra_init_with_capacity
ra_insert_new_key_value_at
ra_overwrite
ra_portable_deserialize
ra_portable_deserialize_size
ra_portable_header_size
ra_portable_serialize
ra_portable_size_in_bytes
ra_range_uint32_array
ra_remove_at_index
ra_remove_at_index_and_free
ra_reset
ra_shift_tail
ra_shrink_to_fit
ra_to_uint32_array
roaring_advance_uint32_iterator
roaring_bitmap_add
roaring_bitmap_add_checked
roaring_bitmap_add_many
roaring_bitmap_add_range_closed
roaring_bitmap_and
roaring_bitmap_and_cardinality
roaring_bitmap_and_inplace
roaring_bitmap_andnot
roaring_bitmap_andnot_cardinality
roaring_bitmap_andnot_inplace
roaring_bitmap_clear
roaring_bitmap_contains_range
roaring_bitmap_copy
roaring_bitmap_create
roaring_bitmap_create_with_capacity
roaring_bitmap_deserialize
roaring_bitmap_equals
roaring_bitmap_flip
roaring_bitmap_flip_inplace
roaring_bitmap_free
roaring_bitmap_from_range
roaring_bitmap_frozen_serialize
roaring_bitmap_frozen_size_in_bytes
roaring_bitmap_frozen_view
roaring_bitmap_get_cardinality
roaring_bitmap_intersect
roaring_bitmap_is_empty
roaring_bitmap_is_strict_subset
roaring_bitmap_is_subset
roaring_bitmap_jaccard_index
roaring_bitmap_lazy_or
roaring_bitmap_lazy_or_inplace
roaring_bitmap_lazy_xor
roaring_bitmap_lazy_xor_inplace
roaring_bitmap_maximum
roaring_bitmap_minimum
roaring_bitmap_of
roaring_bitmap_of_ptr
roaring_bitmap_or
roaring_bitmap_or_cardinality
roaring_bitmap_or_inplace
roaring_bitmap_or_many
roaring_bitmap_or_many_heap
roaring_bitmap_overwrite
roaring_bitmap_portable_deserialize
roaring_bitmap_portable_deserialize_safe
roaring_bitmap_portable_deserialize_size
roaring_bitmap_portable_serialize
roaring_bitmap_portable_size_in_bytes
roaring_bitmap_printf
roaring_bitmap_printf_describe
roaring_bitmap_range_cardinality
roaring_bitmap_range_uint32_array
roaring_bitmap_rank
roaring_bitmap_remove
roaring_bitmap_remove_checked
roaring_bitmap_remove_many
roaring_bitmap_remove_range_closed
roaring_bitmap_remove_run_compression
roaring_bitmap_repair_after_lazy
roaring_bitmap_run_optimize
roaring_bitmap_select
roaring_bitmap_serialize
roaring_bitmap_shrink_to_fit
roaring_bitmap_size_in_bytes
roaring_bitmap_statistics
roaring_bitmap_to_uint32_array
roaring_bitmap_xor
roaring_bitmap_xor_cardinality
roaring_bitmap_xor_inplace
roaring_bitmap_xor_many
roaring_copy_uint32_iterator
roaring_create_iterator
roaring_free_uint32_iterator
roaring_init_iterator
roaring_init_iterator_last
roaring_iterate
roaring_iterate64
roaring_move_uint32_iterator_equalorlarger
roaring_previous_uint32_iterator
roaring_read_uint32_iterator
run_array_container_andnot
run_array_container_iandnot
run_array_container_ixor
run_bitset_container_andnot
run_bitset_container_iandnot
run_bitset_container_intersect
run_bitset_container_intersection
run_bitset_container_intersection_cardinality
run_bitset_container_ixor
run_bitset_container_lazy_union
run_bitset_container_lazy_xor
run_bitset_container_union
run_bitset_container_xor
run_container_add
run_container_andnot
run_container_clone
run_container_copy
run_container_create
run_container_create_given_capacity
run_container_deserialize
run_container_equals_array
run_container_equals_bitset
run_container_free
run_container_from_array
run_container_grow
run_container_intersect
run_container_intersection
run_container_intersection_cardinality
run_container_is_subset
run_container_is_subset_array
run_container_is_subset_bitset
run_container_iterate
run_container_iterate64
run_container_negation
run_container_negation_inplace
run_container_negation_range
run_container_negation_range_inplace
run_container_printf
run_container_printf_as_uint32_array
run_container_rank
run_container_read
run_container_select
run_container_serialization_len
run_container_serialize
run_container_shrink_to_fit
run_container_smart_append_exclusive
run_container_to_uint32_array
run_container_union
run_container_union_inplace
run_container_write
run_container_xor
run_run_container_andnot
run_run_container_iandnot
run_run_container_ixor
run_run_container_xor
shared_container_extract_copy
shared_container_free
union_uint16
union_uint32
union_uint32_card
xor_uint16
{% endblock %}
