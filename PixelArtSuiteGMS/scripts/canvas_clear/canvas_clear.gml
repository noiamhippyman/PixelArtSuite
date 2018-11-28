/// @func canvas_clear
/// @args canvas,r,g,b,a
var canvas = argument0;
var cr = argument1;
var cg = argument2;
var cb = argument3;
var ca = argument4;

var buffer = canvas_get_buffer(canvas);
var surface = canvas_get_surface(canvas);

gfx_set_screen_target(canvas_get_buffer(canvas), canvas_get_width(canvas), canvas_get_height(canvas));
gfx_clear_screen(cr,cg,cb,ca);
buffer_set_surface(buffer,surface,0,0,0);