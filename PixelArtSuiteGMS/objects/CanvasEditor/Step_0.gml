if (!canvas_exists(canvas)) exit;


var x2 = x+canvas_get_width(canvas);
var y2 = y+canvas_get_height(canvas);
isMouseOnCanvas = point_in_rectangle(mouse_x,mouse_y,x,y,x2,y2);

canvasMouseX = mouse_x - x;
canvasMouseY = mouse_y - y;

#region Temporary Input

var mouseWheelAxis = mouse_wheel_up() - mouse_wheel_down();

toolBrushSize = max(toolBrushSize + mouseWheelAxis, 1);

if (keyboard_check_pressed(ord("D"))) canvas_editor_set_tool(id,enCanvasEditorTool.Draw);
if (keyboard_check_pressed(ord("C"))) canvas_editor_set_tool(id,enCanvasEditorTool.DrawCircle);
if (keyboard_check_pressed(ord("L"))) canvas_editor_set_tool(id,enCanvasEditorTool.DrawLine);
if (keyboard_check_pressed(ord("R"))) canvas_editor_set_tool(id,enCanvasEditorTool.DrawRectangle);
if (keyboard_check_pressed(ord("E"))) canvas_editor_set_tool(id,enCanvasEditorTool.Erase);

#endregion
// Draw brush preview for draw and erase tools on internal editor canvas

canvas_clear(__editor_canvas,0,0,0,0);

if (isMouseOnCanvas) {
	switch (toolMode) {
		case enCanvasEditorTool.Draw:
			if (toolBrushSize == 1) {
				canvas_draw_pixel(__editor_canvas,canvasMouseX,canvasMouseY,toolColor[0],toolColor[1],toolColor[2],toolColor[3]);
			} else {
				var c = (floor((current_time / 250) mod 2) * 128) + 64;
				canvas_draw_circle(__editor_canvas,canvasMouseX,canvasMouseY,toolBrushSize/2,c,c,c,255,true);
			}
		break;
		
		case enCanvasEditorTool.Erase:
			if (toolBrushSize == 1) {
				canvas_draw_pixel(__editor_canvas,canvasMouseX,canvasMouseY,0,0,0,255);
			} else {
				var c = (floor((current_time / 250) mod 2) * 128) + 64;
				canvas_draw_circle(__editor_canvas,canvasMouseX,canvasMouseY,toolBrushSize/2,c,c,c,255,true);
			}
		break;
		
		case enCanvasEditorTool.DrawCircle:
			if (isUsingTool) {
				var radius = point_distance(toolStartX,toolStartY,toolEndX,toolEndY);
				canvas_draw_circle(__editor_canvas,toolStartX,toolStartY,radius,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
			}
		break;
	
		case enCanvasEditorTool.DrawLine:
			if (isUsingTool) {
				canvas_draw_line(__editor_canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3]);
			}
		break;
	
		case enCanvasEditorTool.DrawRectangle:
			if (isUsingTool) {
				canvas_draw_rectangle(__editor_canvas,toolStartX,toolStartY,toolEndX,toolEndY,toolColor[0],toolColor[1],toolColor[2],toolColor[3],false);
			}
		break;
	}
}

// Draw border around canvas
canvas_draw_rectangle(__editor_canvas,0,0,canvas_get_width(__editor_canvas)-1,canvas_get_height(__editor_canvas)-1,0,0,0,255,true);