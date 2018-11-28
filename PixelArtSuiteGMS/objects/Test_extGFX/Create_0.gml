canvasWidth = 64 * 3;
canvasHeight = 96 * 3;
var buffSize = canvasWidth * canvasHeight * buffer_sizeof(buffer_u32);
layer1Buffer = buffer_create(buffSize,buffer_fast,1);
layer1Surface = surface_create(canvasWidth,canvasHeight);

gfx_init();

gfx_set_screen_size(canvasWidth,canvasHeight);
gfx_set_screen_buffer(buffer_get_address(layer1Buffer));

gfx_clear_screen(128,128,128,255);


// Performance checking
numFrames = 0;
timer = 0;


// Window resizing and movement
currentWindowPos = [window_get_x(),window_get_y()];
currentWindowSize = [window_get_width(),window_get_height()];
window_set_min_width(640);
window_set_min_height(480);

// Camera
scale = 1;
camera = view_get_camera(0);
cameraX = canvasWidth / 2;
cameraY = canvasHeight / 2;

isDraggingCamera = false;
cameraDragX = 0;
cameraDragY = 0;

camera_set_view_size(camera, currentWindowSize[0],currentWindowSize[1]);
view_set_wport(0,currentWindowSize[0]);
view_set_hport(0,currentWindowSize[1]);

baseViewWidth = camera_get_view_width(camera);
baseViewHeight = camera_get_view_height(camera);

camera_set_view_pos(camera, cameraX - camera_get_view_width(camera) / 2, cameraY - camera_get_view_height(camera) / 2);