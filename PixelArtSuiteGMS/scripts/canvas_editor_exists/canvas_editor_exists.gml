/// @func canvas_editor_exists
/// @args editor
var editor = argument0;
return instance_exists(editor) && editor.object_index == CanvasEditor;