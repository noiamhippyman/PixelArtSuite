/// @func canvas_create
/// @args width,height
var cw = argument0;
var ch = argument1;

var canvas = ds_list_create();

canvas[|enCanvas.Width] = cw;
canvas[|enCanvas.Height] = ch;
canvas[|enCanvas.Surface] = surface_create(cw,ch);
canvas[|enCanvas.Buffer] = buffer_create(cw*ch*4, buffer_fixed, 1);

return canvas;