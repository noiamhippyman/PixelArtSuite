/// @func canvas_draw_pixel
/// @args id,x,y,r,g,b,a
var canvas = argument0;
var cx = argument1;
var cy = argument2;
var cr = argument3;
var cg = argument4;
var cb = argument5;
var ca = argument6;

var width = canvas_get_width(canvas);
var height = canvas_get_height(canvas);
var buffer = canvas_get_buffer(canvas);
var surface = canvas_get_surface(canvas);

gfx_set_screen_target(buffer,width,height);
gfx_set_pixel(cx,cy,cr,cg,cb,ca);

if (surface_exists(surface)) buffer_set_surface(buffer,surface,0,0,0);