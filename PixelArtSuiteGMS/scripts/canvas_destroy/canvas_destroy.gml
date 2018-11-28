/// @func canvas_destroy
/// @args id
var canvas = argument0;
surface_free(canvas_get_surface(canvas));
buffer_delete(canvas_get_buffer(canvas));
ds_list_destroy(canvas);