﻿uses crt;

const White = 15;
      Blue = 1;
      Blink = 128;

begin
    TextBackground(White);
    ClrScr;
    
    TextColor(Blue + Blink);
    
    print('Упражнение 4');
    readln;
end.