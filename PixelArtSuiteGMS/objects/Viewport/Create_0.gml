var ww = window_get_width();
var wh = window_get_height();

window_set_min_width(320);
window_set_min_height(240);

camera = camera_create_view(x-ww/2, y-wh/2, ww, wh);
camera_set_view_size(camera, ww, wh);

viewIndex = 0;
view_enabled = true;
view_visible[viewIndex] = true;

view_set_camera(viewIndex,camera);
view_set_wport(viewIndex,ww);
view_set_hport(viewIndex,wh);


currentWindowX = window_get_x();
currentWindowY = window_get_y();
currentWindowWidth = window_get_width();
currentWindowHeight = window_get_height();

isPanning = false;
panX = 0;
panY = 0;