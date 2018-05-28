#pragma once
typedef unsigned int uint32;
class Renderer
{
public:
	Renderer() {};
	~Renderer() {};
	
	char* GetScreenBuffer();
	void SetScreenBuffer(char* buffer);

	uint32 GetScreenWidth();
	void SetScreenWidth(uint32 width);

	uint32 GetScreenHeight();
	void SetScreenHeight(uint32 height);

	bool GetNeedsUpdate();
	
	void ClearScreen(char r, char g, char b, char a);
	void SetPixel(int x, int y, char r, char g, char b, char a);
	void DrawLine(float x1, float y1, float x2, float y2, char r, char g, char b, char a);
	void DrawCircle(int x, int y, int radius, char r, char g, char b, char a, bool outline);
	void DrawRectangle(int x1, int y1, int x2, int y2, char r, char g, char b, char a, bool outline);
private:
	char* m_screenBuffer = nullptr;
	uint32 m_screenBufferSize;
	uint32 m_screenWidth;
	uint32 m_screenHeight;
	bool m_screenNeedsUpdate;

	uint32 GetScreenBufferSize();
	void SetScreenBufferSize();

	void SetNeedsUpdate();
};

