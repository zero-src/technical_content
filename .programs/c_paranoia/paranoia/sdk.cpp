#include "includes.h"
#include "menu.h"
#include "sdk.h"

#define cls system("cls")

HANDLE out = GetStdHandle(STD_OUTPUT_HANDLE);
void fullscreen() {
	COORD NewSBSize = GetLargestConsoleWindowSize(out);
	NewSBSize.Y += 3;
	NewSBSize.X -= 2;
	SMALL_RECT DisplayArea = { 0, 0, 0, 0 };
	SetConsoleScreenBufferSize(out, NewSBSize);
	DisplayArea.Right = NewSBSize.X - 1;
	DisplayArea.Bottom = NewSBSize.Y - 1;
	SetConsoleWindowInfo(out, TRUE, &DisplayArea);
}

void menu::sized()
{
	wchar_t c_name[] = L"Paranoia";
	system("mode con cols=81 lines=20"); // 81, 20
	SetConsoleTitle(c_name);
}

void menu::draw(bool force)
{
	std::wstring elements[2]; char c;

	elements[0].append(L"1. Connected devices");
	elements[1].append(L"2. Check for users count");

	for (auto x : elements)
		std::wcout << x << "\n";

	if (force) {
		while ((c = _getch()) != '\r') {
			if (c == '1') {
				cls; fullscreen(); system("mode con cols=120 lines=35"); connected_devices();
			}
		}
	}
}



