#pragma once
typedef unsigned int uint32;
class Renderer
{
public:
	Renderer() {};
	~Renderer() {};
	
	unsigned char* GetScreenBuffer();
	void SetScreenBuffer(unsigned char* buffer);

	uint32 GetScreenWidth();
	void SetScreenWidth(uint32 width);

	uint32 GetScreenHeight();
	void SetScreenHeight(uint32 height);

	bool GetNeedsUpdate();

	bool GetBlendEnabled();
	void SetBlendEnabled(bool enable);
	
	void ClearScreen(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
	void SetPixel(int x, int y, unsigned char r, unsigned char g, unsigned char b, unsigned char a);
	void DrawLine(float x1, float y1, float x2, float y2, unsigned char r, unsigned char g, unsigned char b, unsigned char a);
	void DrawCircle(int x, int y, int radius, unsigned char r, unsigned char g, unsigned char b, unsigned char a, bool outline);
	void DrawRectangle(int x1, int y1, int x2, int y2, unsigned char r, unsigned char g, unsigned char b, unsigned char a, bool outline);
private:
	unsigned char* m_screenBuffer = nullptr;
	uint32 m_screenBufferSize;
	uint32 m_screenWidth;
	uint32 m_screenHeight;
	bool m_screenNeedsUpdate;
	bool m_blendEnabled;

	uint32 GetScreenBufferSize();
	void SetScreenBufferSize();

	void SetNeedsUpdate();
};

