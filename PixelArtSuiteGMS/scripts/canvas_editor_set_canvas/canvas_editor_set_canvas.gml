/// @func canvas_editor_set_canvas
/// @args id,canvasID
var editor = argument0;
var canvas = argument1;

if (!instance_exists(editor) || editor.object_index != CanvasEditor) exit;

editor.canvas = canvas;

if (canvas_exists(editor.__editor_canvas)) canvas_destroy(editor.__editor_canvas);
editor.__editor_canvas = canvas_create(canvas_get_width(canvas),canvas_get_height(canvas));
canvas_clear(editor.__editor_canvas,0,0,0,0);