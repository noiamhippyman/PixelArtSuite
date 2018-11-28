/// @func canvas_exists
/// @args id
var canvas = argument0;
return ds_exists(canvas,ds_type_list) && ds_list_size(canvas) == enCanvas.__PropertyCount;