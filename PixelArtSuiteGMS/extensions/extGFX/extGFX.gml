#define gfx_set_screen_target
var buffer = argument0;
var width = argument1;
var height = argument2;
gfx_set_screen_buffer(buffer_get_address(buffer));
gfx_set_screen_size(width,height);
return 0;