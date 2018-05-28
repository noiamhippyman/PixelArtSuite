#include "Renderer.h"

#define GMS_DLL extern "C" __declspec(dllexport)
#define GMS_FALSE 0
#define GMS_TRUE 1

Renderer* gfx = nullptr;

GMS_DLL double gfx_init() {
	if (gfx) return 0.0;
	gfx = new Renderer();
	return 0.0;
}

GMS_DLL double gfx_free() {
	if (!gfx) return 0.0;
	delete gfx;
	gfx = nullptr;
	return 0.0;
}

GMS_DLL double gfx_get_screen_buffer() { return (unsigned)gfx->GetScreenBuffer(); }
GMS_DLL double gfx_set_screen_buffer(char* buffer) {
	gfx->SetScreenBuffer(buffer);
	return 0.0;
}

GMS_DLL double gfx_set_screen_size(double width, double height) {
	gfx->SetScreenWidth(width);
	gfx->SetScreenHeight(height);
	return 0.0;
}

GMS_DLL double gfx_needs_update() {
	return gfx->GetNeedsUpdate() ? GMS_TRUE : GMS_FALSE;
}

GMS_DLL double gfx_clear_screen(double r, double g, double b, double a) {
	gfx->ClearScreen(r, g, b, a);
	return 0.0;
}

GMS_DLL double gfx_set_pixel(double x, double y, double r, double g, double b, double a) {
	gfx->SetPixel(x, y, r, g, b, a);
	return 0.0;
}

GMS_DLL double gfx_draw_line(double x1, double y1, double x2, double y2, double r, double g, double b, double a) {
	gfx->DrawLine(x1, y1, x2, y2, r, g, b, a);
	return 0.0;
}

GMS_DLL double gfx_draw_circle(double x, double y, double radius, double r, double g, double b, double a, double outline) {
	gfx->DrawCircle(x, y, radius, r, g, b, a, GMS_TRUE == (int)outline ? true : false);
	return 0.0;
}

GMS_DLL double gfx_draw_rectangle(double x1, double y1, double x2, double y2, double r, double g, double b, double a, double outline) {
	gfx->DrawRectangle(x1, y1, x2, y2, r, g, b, a, GMS_TRUE == (int)outline ? true : false);
	return 0.0;
}