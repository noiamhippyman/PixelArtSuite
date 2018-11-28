if (!canvas_exists(canvas) || !isUsingTool) exit;

toolEndX = canvasMouseX;
toolEndY = canvasMouseY;

// Apply immediately when using Draw or Erase tool
switch (toolMode) {
	case enCanvasEditorTool.Draw:
		if (toolBrushSize == 1) {
			canvas_draw_pixel(canvas,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3]);
		} else {
			canvas_draw_circle(canvas,toolEndX,toolEndY,toolBrushSize/2,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
		}
	break;
	
	case enCanvasEditorTool.Erase:
		var blendEnabled = gfx_get_blend_enabled();
		if (blendEnabled) {
			gfx_set_blend_enabled(false);
		}
		
		if (toolBrushSize == 1) {
			canvas_draw_pixel(canvas,toolEndX,toolEndY,0,0,0,0);
		} else {
			canvas_draw_circle(canvas,toolEndX,toolEndY,toolBrushSize/2,0,0,0,0,false);
		}
		
		gfx_set_blend_enabled(blendEnabled);
	break;
}