if (!canvas_exists(canvas)) exit;

canvas_draw(canvas,x,y);

//if (isUsingTool) {
	canvas_draw(__editor_canvas,x,y);
//}