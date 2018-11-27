#include "Renderer.h"
#include <math.h>
#include <algorithm>
#include <iostream>
int x_from_index(int index, int rowLength) {
	return index % rowLength;
}

int y_from_index(int index, int rowLength) {
	return div(index, rowLength).quot;
}

int index_from_2d(int x, int y, int rowLength) {
	return y * rowLength + x;
}

unsigned char* Renderer::GetScreenBuffer() { return m_screenBuffer; }
void Renderer::SetScreenBuffer(unsigned char* buffer) { m_screenBuffer = buffer; }

uint32 Renderer::GetScreenWidth() { return m_screenWidth; }
void Renderer::SetScreenWidth(uint32 width) { m_screenWidth = width; SetScreenBufferSize(); }

uint32 Renderer::GetScreenHeight() { return m_screenHeight; }
void Renderer::SetScreenHeight(uint32 height) { m_screenHeight = height; SetScreenBufferSize(); }

bool Renderer::GetNeedsUpdate() { return m_screenNeedsUpdate; }
void Renderer::SetNeedsUpdate() { m_screenNeedsUpdate = true; }

bool Renderer::GetBlendEnabled() { return m_blendEnabled; }
void Renderer::SetBlendEnabled(bool enable) { m_blendEnabled = enable; }

uint32 Renderer::GetScreenBufferSize() { return m_screenBufferSize; }
void Renderer::SetScreenBufferSize() { m_screenBufferSize = GetScreenWidth() * GetScreenHeight() * sizeof(uint32); }

void Renderer::ClearScreen(unsigned char r, unsigned char g, unsigned char b, unsigned char a)
{
	unsigned char* buff = GetScreenBuffer();
	int   size = GetScreenBufferSize();
	for (int i = 0; i < size; i += 4) {
		buff[i] = r;
		buff[i + 1] = g;
		buff[i + 2] = b;
		buff[i + 3] = a;
		//int r2 = buff[i] + r;
		//int g2 = buff[i+1] + g;
		//int b2 = buff[i+2] + b;
		//int a2 = buff[i+3] + a;
		//buff[i] = r2 < buff[i] ? 255 : r2;
		//buff[i + 1] = g2 < buff[i + 1] ? 255 : g2;
		//buff[i + 2] = b2 < buff[i + 2] ? 255 : b2;
		//buff[i + 3] = a2 < buff[i + 3] ? 255 : a2;
		
		//buff[i] = std::min(buff[i] + r, 255);
		//buff[i + 1] = std::min(buff[i + 1] + g, 255);
		//buff[i + 2] = std::min(buff[i + 2] + b, 255);
		//buff[i + 3] = std::min(buff[i + 3] + a, 255);
		
	}
	SetNeedsUpdate();
}

void Renderer::SetPixel(int x, int y, unsigned char r, unsigned char g, unsigned char b, unsigned char a)
{
	unsigned char* buff = GetScreenBuffer();
	int width = GetScreenWidth();
	if (x < 0 || x >= width || y < 0 || y >= GetScreenHeight()) return;

	int i = index_from_2d(x, y, width) * 4;

	if (!GetBlendEnabled()) {
		buff[i] = r;
		buff[i + 1] = g;
		buff[i + 2] = b;
		buff[i + 3] = a;
	} else {

		// Add blend mode
		buff[i] = std::min(buff[i] + r, 255);
		buff[i + 1] = std::min(buff[i + 1] + g, 255);
		buff[i + 2] = std::min(buff[i + 2] + b, 255);
		buff[i + 3] = std::min(buff[i + 3] + a, 255);
	}
	

	//int r2 = buff[i] + r;
	//int g2 = buff[i + 1] + g;
	//int b2 = buff[i + 2] + b;
	//int a2 = buff[i + 3] + a;
	//buff[i] = r2 < buff[i] ? 255 : r2;
	//buff[i + 1] = g2 < buff[i + 1] ? 255 : g2;
	//buff[i + 2] = b2 < buff[i + 2] ? 255 : b2;
	//buff[i + 3] = a2 < buff[i + 3] ? 255 : a2;
	
	//buff[i] = std::min(buff[i] + r, 255);
	//buff[i + 1] = std::min(buff[i + 1] + g, 255);
	//buff[i + 2] = std::min(buff[i + 2] + b, 255);
	//buff[i + 3] = std::min(buff[i + 3] + a, 255);

	SetNeedsUpdate();
}

void Renderer::DrawLine(float x1, float y1, float x2, float y2, unsigned char r, unsigned char g, unsigned char b, unsigned char a)
{
	//source: https://rosettacode.org/wiki/Bitmap/Bresenham%27s_line_algorithm#C.2B.2B
	const bool steep = fabs(y2 - y1) > fabs(x2 - x1);
	if (steep) {
		std::swap(x1, y1);
		std::swap(x2, y2);
	}

	if (x1 > x2) {
		std::swap(x1, x2);
		std::swap(y1, y2);
	}

	const float dx = x2 - x1;
	const float dy = fabs(y2 - y1);

	float error = dx / 2.0f;
	const int ystep = (y1 < y2) ? 1 : -1;
	int y = (int)y1;

	const int maxX = (int)x2;
	for (int x = (int)x1; x < maxX; ++x) {
		if (steep) {
			SetPixel(y, x, r, g, b, a);
		}
		else {
			SetPixel(x, y, r, g, b, a);
		}

		error -= dy;
		if (error < 0) {
			y += ystep;
			error += dx;
		}
	}
	
	//TODO: Clean up
	//SetNeedsUpdate();
}

void Renderer::DrawCircle(int x, int y, int radius, unsigned char r, unsigned char g, unsigned char b, unsigned char a, bool outline)
{
	//outlined-circle source: https://rosettacode.org/wiki/Bitmap/Midpoint_circle_algorithm#C
	//filled-circle source: https://stackoverflow.com/a/1237519
	if (outline) {
		//Draw circle outline
		int f = 1 - radius;
		int ddf_x = 0;
		int ddf_y = -2 * radius;
		int px = 0;
		int py = radius;

		SetPixel(x, y + radius, r, g, b, a);
		SetPixel(x, y - radius, r, g, b, a);
		SetPixel(x + radius, y, r, g, b, a);
		SetPixel(x - radius, y, r, g, b, a);

		while (px < py) {
			if (f >= 0) {
				py--;
				ddf_y += 2;
				f += ddf_y;
			}
			px++;
			ddf_x += 2;
			f += ddf_x + 1;
			SetPixel(x + px, y + py, r, g, b, a);
			SetPixel(x - px, y + py, r, g, b, a);
			SetPixel(x + px, y - py, r, g, b, a);
			SetPixel(x - px, y - py, r, g, b, a);


			SetPixel(x + py, y + px, r, g, b, a);
			SetPixel(x - py, y + px, r, g, b, a);
			SetPixel(x + py, y - px, r, g, b, a);
			SetPixel(x - py, y - px, r, g, b, a);
		}
	}
	else {

		//Draw filled circle
		int rad1 = round(radius * radius + radius * 0.8f);
		for (int j = -radius; j <= radius; ++j) {
			for (int i = -radius; i <= radius; ++i) {
				if (i*i + j*j <= rad1) {
					SetPixel(x + i, y + j, r, g, b, a);
				}
			}
		}
	}
	
	//TODO: Clean up
	//SetNeedsUpdate();
}

void Renderer::DrawRectangle(int x1, int y1, int x2, int y2, unsigned char r, unsigned char g, unsigned char b, unsigned char a, bool outline)
{
	if (outline) {
		//Draw outlined rectangle
		int mnx = std::min(x1, x2);
		int mxx = std::max(x1, x2);
		int mny = std::min(y1, y2);
		int mxy = std::max(y1, y2);
		DrawLine(mnx, mny, mxx, mny, r, g, b, a);//top
		DrawLine(mnx, mny, mnx, mxy, r, g, b, a);//left
		DrawLine(mxx, mny, mxx, mxy, r, g, b, a);//right
		DrawLine(mnx, mxy, mxx, mxy, r, g, b, a);//bottom
	}
	else {
		//Draw filled rectangle
		int mnx = std::min(x1, x2);
		int mxx = std::max(x1, x2);
		int mny = std::min(y1, y2);
		int mxy = std::max(y1, y2);
		for (int i = mny; i <= mxy; ++i) {
			DrawLine(mnx, i, mxx + 1, i, r, g, b, a);
		}

	}

	//TODO: Clean up
	//SetNeedsUpdate();
}