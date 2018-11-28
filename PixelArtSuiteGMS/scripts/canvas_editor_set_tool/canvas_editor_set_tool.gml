/// @func canvas_editor_set_tool
/// @args id,CanvasEditorTool
var editor = argument0;
var tool = argument1;

editor.toolMode = tool;
canvas_clear(editor.__editor_canvas,0,0,0,0);