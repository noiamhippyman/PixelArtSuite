
gfx_set_screen_buffer(buffer_get_address(layer1Buffer));

//blue background
gfx_clear_screen(0,0,255,255);

//red pixel at 4,4
gfx_set_pixel(4,4,255,0,0,255);

//transparent green diagonal line from top-left to bottom-right
gfx_draw_line(0,0,canvasWidth,canvasHeight,0,255,0,128);

//black outline of circle centered on canvas
gfx_draw_circle(canvasWidth/2,canvasHeight/2,canvasWidth/4,0,0,0,255,true);

//white outline of square all the way around canvas
gfx_draw_rectangle(0,0,canvasWidth,canvasHeight,255,255,255,128,true);



if (!surface_exists(layer1Surface)) {
    layer1Surface = surface_create(canvasWidth,canvasHeight);
}

buffer_set_surface(layer1Buffer,layer1Surface,0,0,0);