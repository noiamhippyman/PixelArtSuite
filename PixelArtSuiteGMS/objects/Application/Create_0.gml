gfx_init();

canvasEditor = instance_create_layer(0,0,"Instances",CanvasEditor);
viewport = instance_create_layer(room_width/2,room_height/2,"Instances",Viewport);

canvas = canvas_create(320,320);
canvas_editor_set_canvas(canvasEditor,canvas);

canvas_clear(canvas,255,255,255,255);
canvas_draw_circle(canvas,160,160,128,32,225,32,255,false);
for (var i = 0; i < 128; ++i) {
	canvas_draw_circle(canvas,160,160,128-i,128,64,32,255,true);
}