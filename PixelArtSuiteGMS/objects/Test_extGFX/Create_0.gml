canvasWidth = room_width;
canvasHeight = room_height;
var buffSize = canvasWidth * canvasHeight * buffer_sizeof(buffer_u32);
layer1Buffer = buffer_create(buffSize,buffer_fast,1);
layer1Surface = surface_create(canvasWidth,canvasHeight);

gfx_init();

gfx_set_screen_size(canvasWidth,canvasHeight);