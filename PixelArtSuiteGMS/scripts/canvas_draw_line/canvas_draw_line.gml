/// @func canvas_draw_line
/// @args id,x1,y1,x2,y2,r,g,b,a
var canvas = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var cr = argument5;
var cg = argument6;
var cb = argument7;
var ca = argument8;

var width = canvas_get_width(canvas);
var height = canvas_get_height(canvas);
var buffer = canvas_get_buffer(canvas);
var surface = canvas_get_surface(canvas);

gfx_set_screen_target(buffer,width,height);
gfx_draw_line(x1,y1,x2,y2,cr,cg,cb,ca);
buffer_set_surface(buffer,surface,0,0,0);