/// @func canvas_editor_get_tool(id);
/// @args id
var editor = argument0;

if (!canvas_editor_exists(editor)) exit;

return editor.toolMode;