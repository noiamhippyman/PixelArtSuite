var wx = window_get_x();
var wy = window_get_y();
var ww = window_get_width();
var wh = window_get_height();

// View Scaling
var mouseWheelAxis = mouse_wheel_up() - mouse_wheel_down();
if (mouseWheelAxis != 0) {
	viewScale = max(viewScale + mouseWheelAxis, 1);
	camera_set_view_size(camera,ww/viewScale,wh/viewScale);
	
}

// Window resizing
var winMove = (wx != currentWindowX || wy != currentWindowY);
var winResize = (ww != currentWindowWidth || wh != currentWindowHeight);

if (winResize) {
	
	var offX = 0;
	var offY = 0;
	if (winMove) {
		offX = wx - currentWindowX;
		offY = wy - currentWindowY;
	}
	
	camera_set_view_pos(camera, camera_get_view_x(camera)+offX/viewScale, camera_get_view_y(camera)+offY/viewScale);
	camera_set_view_size(camera,floor(ww/viewScale),floor(wh/viewScale));
	view_set_wport(viewIndex,ww);
	view_set_hport(viewIndex,wh);
	
	x = camera_get_view_x(camera) + camera_get_view_width(camera) / 2;
	y = camera_get_view_y(camera) + camera_get_view_height(camera) / 2;
	
	currentWindowWidth = ww;
	currentWindowHeight = wh;
}

if (winMove) {
	currentWindowX = wx;
	currentWindowY = wy;
}