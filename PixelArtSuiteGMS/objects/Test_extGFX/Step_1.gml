var wx = window_get_x();
var wy = window_get_y();
var ww = window_get_width();
var wh = window_get_height();

var winMove = (currentWindowPos[0] != wx) || (currentWindowPos[1] != wy);
var winResize = (currentWindowSize[0] != ww) || (currentWindowSize[1] != wh);

if (winResize) {
	var xoff = 0;
	var yoff = 0;
	if (winMove) {
		xoff = (currentWindowPos[0] - wx) / scale;
		yoff = (currentWindowPos[1] - wy) / scale;
	}
	
	currentWindowSize[0] = ww;
	currentWindowSize[1] = wh;
	
	display_set_gui_size(currentWindowSize[0],currentWindowSize[1]);
	
	var cx = camera_get_view_x(camera);
	var cy = camera_get_view_y(camera);
	camera_set_view_pos(camera,cx-xoff,cy-yoff);
	camera_set_view_size(camera,currentWindowSize[0],currentWindowSize[1]);
	view_set_wport(0,currentWindowSize[0]);
	view_set_hport(0,currentWindowSize[1]);
	
	
	cx = camera_get_view_x(camera);
	cy = camera_get_view_y(camera);
	
	var cw = camera_get_view_width(camera);
	var ch = camera_get_view_height(camera);
	cameraX = (cx + cw / 2) * scale;
	cameraY = (cy + ch / 2) * scale;
	
	baseViewWidth = ww;
	baseViewHeight = wh;
}

if (winMove) {
	currentWindowPos[0] = wx;
	currentWindowPos[1] = wy;
}
