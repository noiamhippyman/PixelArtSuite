/// @func canvas_editor_set_tool
/// @args id,tool
var editor = argument0;
var tool = argument1;

if (!canvas_editor_exists(editor)) exit;

editor.toolMode = tool;