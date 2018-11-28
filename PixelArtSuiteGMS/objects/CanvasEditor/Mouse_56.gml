if (!canvas_exists(canvas) || !isUsingTool) exit;

// Clear any previous drawn stuff on internal editor canvas
canvas_clear(__editor_canvas,0,0,0,0);


// Apply action to project canvas on release
switch (toolMode) {
	case enCanvasEditorTool.DrawCircle:
		var radius = point_distance(toolStartX,toolStartY,toolEndX,toolEndY);
		canvas_draw_circle(canvas,toolStartX,toolStartY,radius,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
	break;
	case enCanvasEditorTool.DrawLine:
		canvas_draw_line(canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3]);
	break;
	case enCanvasEditorTool.DrawRectangle:
		canvas_draw_rectangle(canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
	break;
}

isUsingTool = false;