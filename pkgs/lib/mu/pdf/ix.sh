{% extends '//lib/mu/pdf/t/ix.sh' %}

{% block make_flags %}
{{super()}}
HAVE_GLUT=no
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
_cmsReadHeader
_cmsSearchTag
_cmsWriteHeader
cmsCloseIOhandler
cmsCreateProfilePlaceholder
cmsGetHeaderCreator
cmsGetHeaderFlags
cmsGetHeaderManufacturer
cmsGetHeaderRenderingIntent
cmsGetProfileIOhandler
cmsGetTagCount
cmsGetTagSignature
cmsIsTag
cmsOpenIOhandlerFromFile
cmsOpenIOhandlerFromMem
cmsOpenIOhandlerFromNULL
cmsOpenIOhandlerFromStream
cmsSetHeaderFlags
cmsSetHeaderManufacturer
cmsSetHeaderRenderingIntent
_cmsGetTagTrueType
cmsCloseProfile
cmsGetColorSpace
cmsGetDeviceClass
cmsGetEncodedICCversion
cmsGetHeaderAttributes
cmsGetHeaderCreationDateTime
cmsGetHeaderModel
cmsGetHeaderProfileID
cmsGetPCS
cmsGetProfileVersion
cmsLinkTag
cmsOpenProfileFromFile
cmsOpenProfileFromMem
cmsOpenProfileFromStream
cmsReadRawTag
cmsReadTag
cmsSaveProfileToFile
cmsSaveProfileToIOhandler
cmsSaveProfileToMem
cmsSaveProfileToStream
cmsSetColorSpace
cmsSetDeviceClass
cmsSetEncodedICCversion
cmsSetHeaderAttributes
cmsSetHeaderModel
cmsSetHeaderProfileID
cmsSetPCS
cmsSetProfileVersion
cmsTagLinkedTo
cmsWriteRawTag
cmsWriteTag
_cmsAdjustEndianess16
_cmsAdjustEndianess32
_cmsAllocMemPluginChunk
_cmsCalloc
_cmsCreateSubAlloc
_cmsDupMem
_cmsFree
_cmsInstallAllocFunctions
_cmsMalloc
_cmsMallocZero
_cmsMemPluginChunk
_cmsRealloc
_cmsRegisterMemHandlerPlugin
_cmsSubAlloc
_cmsSubAllocDestroy
_cmsSubAllocDup
cmsGetEncodedCMMversion
cmsfilelength
cmsstrcasecmp
extract_matrix_expansion
_cmsAdjustEndianess64
_cmsAllocLogErrorChunk
_cmsReadUInt16Number
_cmsReadUInt8Number
cmsSetLogErrorHandler
content_append
extract_block_free
extract_font_size
extract_line_span_first
extract_line_span_last
extract_matrix4_invert
extract_paragraph_free
extract_point_string
extract_rect_empty
extract_rect_string
extract_span_append_c
extract_span_char_last
extract_span_string
extract_subpage_free
extract_table_free
_cmsAllocMutexPluginChunk
_cmsCreateMutex
_cmsDestroyMutex
_cmsLockMutex
_cmsRead15Fixed16Number
_cmsReadFloat32Number
_cmsReadUInt16Array
_cmsReadUInt32Number
_cmsReadUInt64Number
_cmsRegisterMutexPlugin
_cmsTagSignature2String
cmsSignalError
content_append_block
content_append_line
content_append_paragraph
content_append_span
content_new_line
content_new_paragraph
content_new_root
content_new_span
_cms15Fixed16toDouble
_cms8Fixed8toDouble
_cmsAdaptationStateChunk
_cmsAlarmCodesChunk
_cmsAllocAdaptationStateChunk
_cmsAllocAlarmCodesChunk
_cmsAllocParallelizationPluginChunk
_cmsAllocTransformPluginChunk
_cmsContextGetClientChunk
_cmsDecodeDateTimeNumber
_cmsDoubleTo15Fixed16
_cmsDoubleTo8Fixed8
_cmsEncodeDateTimeNumber
_cmsGetContext
_cmsGetTime
_cmsGetTransformFlags
_cmsGetTransformFormatters16
_cmsGetTransformFormattersFloat
_cmsGetTransformMaxWorkers
_cmsGetTransformUserData
_cmsGetTransformWorker
_cmsGetTransformWorkerFlags
_cmsIOPrintf
_cmsLogErrorChunk
_cmsMutexPluginChunk
_cmsParallelizationPluginChunk
_cmsPluginMalloc
_cmsReadAlignment
_cmsReadTypeBase
_cmsReadXYZNumber
_cmsRegisterParallelizationPlugin
_cmsRegisterTransformPlugin
_cmsSetTransformUserData
_cmsTransformPluginChunk
_cmsUnlockMutex
_cmsWrite15Fixed16Number
_cmsWriteAlignment
_cmsWriteFloat32Number
_cmsWriteTypeBase
_cmsWriteUInt16Array
_cmsWriteUInt16Number
_cmsWriteUInt32Number
_cmsWriteUInt64Number
_cmsWriteUInt8Number
_cmsWriteXYZNumber
cmsCreateContext
cmsCreateExtendedTransform
cmsCreateMultiprofileTransform
cmsCreateProofingTransform
cmsCreateTransform
cmsDeleteContext
cmsDeleteTransform
cmsDoTransform
cmsDoTransformLineStride
cmsDoTransformStride
cmsDupContext
cmsGetAlarmCodes
cmsGetContextUserData
cmsGetTransformInputFormat
cmsGetTransformOutputFormat
cmsPlugin
cmsSetAdaptationState
cmsSetAlarmCodes
cmsUnregisterPlugins
content_append_new_block
content_append_new_image
content_append_new_line
content_append_new_paragraph
content_append_new_span
content_append_new_table
content_new_block
content_new_table
content_replace
content_replace_new_block
content_replace_new_line
content_replace_new_paragraph
extract_add_char
extract_add_image
extract_add_line
extract_add_path4
extract_baseline_angle
extract_begin
extract_begin_struct
extract_block_pre_rotation_bounds
extract_closepath
extract_end
extract_end_of_span
extract_end_struct
extract_exp_min
extract_fill_begin
extract_fill_end
extract_internal_end
extract_lineto
extract_matrix4_cmp
extract_matrix4_transform_point
extract_matrix4_transform_xy
extract_moveto
extract_multiply_matrix4_matrix4
extract_multiply_matrix_matrix
extract_page_begin
extract_page_end
extract_predicted_end_of_char
extract_process
extract_read_intermediate
extract_rect_infinite
extract_set_layout_analysis
extract_span_begin
extract_span_end
extract_stroke_begin
extract_stroke_end
extract_struct_string
extract_subpage_alloc
extract_tables_csv_format
extract_write
extract_write_content
extract_write_template
{% endblock %}
