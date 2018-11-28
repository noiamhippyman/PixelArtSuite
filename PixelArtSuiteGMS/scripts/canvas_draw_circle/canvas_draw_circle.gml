/// @func canvas_draw_circle
/// @args id,x,y,radius,r,g,b,a,outline
var canvas = argument0;
var cx = argument1;
var cy = argument2;
var crad = argument3;
var cr = argument4;
var cg = argument5;
var cb = argument6;
var ca = argument7;
var outline = argument8;

var width = canvas_get_width(canvas);
var height = canvas_get_height(canvas);
var buffer = canvas_get_buffer(canvas);
var surface = canvas_get_surface(canvas);

gfx_set_screen_target(buffer,width,height);
gfx_draw_circle(cx,cy,crad,cr,cg,cb,ca,outline);

if (surface_exists(surface)) buffer_set_surface(buffer,surface,0,0,0);