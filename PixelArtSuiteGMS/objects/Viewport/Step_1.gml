// Window resizing

var wx = window_get_x();
var wy = window_get_y();
var ww = window_get_width();
var wh = window_get_height();

var winMove = (wx != currentWindowX || wy != currentWindowY);
var winResize = (ww != currentWindowWidth || ww != currentWindowHeight);

if (winResize) {
	
	var offX = 0;
	var offY = 0;
	if (winMove) {
		offX = wx - currentWindowX;
		offY = wy - currentWindowY;
	}
	
	camera_set_view_pos(camera, camera_get_view_x(camera)+offX, camera_get_view_y(camera)+offY);
	camera_set_view_size(camera,ww,wh);
	view_set_wport(viewIndex,ww);
	view_set_hport(viewIndex,wh);
	
	x = camera_get_view_x(camera) + ww / 2;
	y = camera_get_view_y(camera) + wh / 2;
	
	currentWindowWidth = ww;
	currentWindowHeight = wh;
}

if (winMove) {
	currentWindowX = wx;
	currentWindowY = wy;
}