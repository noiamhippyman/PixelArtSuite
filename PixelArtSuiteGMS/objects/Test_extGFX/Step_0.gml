// Temporary way to toggle blend/replace
if (keyboard_check_pressed(vk_f1)) {
	gfx_set_blend_enabled(!gfx_get_blend_enabled());
}

// Drawing
if (mouse_check_button(mb_left)) {
	var blendEnabled = gfx_get_blend_enabled();
	gfx_draw_circle(mouse_x,mouse_y,5,120,12,140,blendEnabled ? 32 : 255,false);
    gfx_set_pixel(mouse_x,mouse_y,0,255,0,blendEnabled ? 16 : 255);
}


if (!surface_exists(layer1Surface)) {
    layer1Surface = surface_create(canvasWidth,canvasHeight);
}

//if (gfx_needs_update()) {
buffer_set_surface(layer1Buffer,layer1Surface,0,0,0);
//}

// Mouse zooming
// TODO: need to change zooming to zoom in towards mouse position
var mouseWheelAxis = mouse_wheel_up() - mouse_wheel_down();
if (mouseWheelAxis != 0) {
	scale += mouseWheelAxis * 0.125;
	scale = clamp(scale,0.125, 10);
	show_debug_message("Scale: " + string(scale) + "::" + string(current_time));
}

var cw = camera_get_view_width(camera);
var ch = camera_get_view_height(camera);
var dw = baseViewWidth / scale;
var dh = baseViewHeight / scale;
if (cw != dw) {
	camera_set_view_size(camera,dw,dh);
	view_set_wport(0,dw);
	view_set_hport(0,dh);	
	camera_set_view_pos(camera, cameraX - camera_get_view_width(camera) / 2, cameraY - camera_get_view_height(camera) / 2);
}


// Move camera with mouse
if (isDraggingCamera) {
	
	var mx = window_mouse_get_x();
	var my = window_mouse_get_y();
	var ww = window_get_width();
	var wh = window_get_height();
	
	if (cameraDragX != mx) {
		cameraX += (cameraDragX - mx) / scale;
		cameraDragX = mx;
		camera_set_view_pos(camera, cameraX - camera_get_view_width(camera) / 2, cameraY - camera_get_view_height(camera) / 2);
	}
	if (cameraDragY != my) {
		cameraY += (cameraDragY - my) / scale;
		cameraDragY = my;
		camera_set_view_pos(camera, cameraX - camera_get_view_width(camera) / 2, cameraY - camera_get_view_height(camera) / 2);
	}
	
	if (mx < 0) {
		window_mouse_set(mx + ww, my);
		cameraDragX += ww;
	}
	
	if (mx > ww) {
		window_mouse_set(mx - ww, my);
		cameraDragX -= ww;
	}
	
	if (my < 0) {
		window_mouse_set(mx, my + wh);
		cameraDragY += wh;
	}
	
	if (my > wh) {
		window_mouse_set(mx, my - wh);
		cameraDragY -= wh;
	}
	
	if (mouse_check_button_released(mb_middle)) {
		isDraggingCamera = false;
		cameraDragX = 0;
		cameraDragY = 0;
	}

}

if (mouse_check_button_pressed(mb_middle)) {
	isDraggingCamera = true;
	cameraDragX = window_mouse_get_x();
	cameraDragY = window_mouse_get_y();
}


// Performance checking
numFrames++;
timer += delta_time;
if (timer >= 1000000) {
	timer -= 1000000;
	window_set_caption("ms/frame: " + string(1000 / numFrames));
	numFrames = 0;
}