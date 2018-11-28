/// @func canvas_draw
/// @arg id,x,y
var canvas = argument0;
var cx = argument1;
var cy = argument2;

var surface = canvas_get_surface(canvas);
var buffer = canvas_get_buffer(canvas);
if (!surface_exists(surface)) {
	surface = surface_create(canvas_get_width(canvas),canvas_get_height(canvas));
	buffer_set_surface(buffer,surface,0,0,0);
	canvas_set_surface(canvas,surface);
} 

draw_surface(surface,cx,cy);