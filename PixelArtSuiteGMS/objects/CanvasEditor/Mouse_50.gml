if (!canvas_exists(canvas) || !isUsingTool) exit;

toolEndX = canvasMouseX;
toolEndY = canvasMouseY;

// Clear any previous drawn stuff on internal editor canvas
canvas_clear(__editor_canvas,0,0,0,0);

switch (toolMode) {
	//Apply immediately to project canvas
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
	
	//Only draw on internal editor canvas for preview. Apply to project canvas on release
	case enCanvasEditorTool.DrawCircle:
		var radius = point_distance(toolStartX,toolStartY,toolEndX,toolEndY);
		canvas_draw_circle(__editor_canvas,toolStartX,toolStartY,radius,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
	break;
	
	case enCanvasEditorTool.DrawLine:
		canvas_draw_line(__editor_canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3]);
	break;
	
	case enCanvasEditorTool.DrawRectangle:
		canvas_draw_rectangle(__editor_canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
	break;
}