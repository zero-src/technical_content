uses crt;

const ColorCount = 16;
      
var AllColors: array [1..ColorCount] of word =
    (
        Black, Blue, Green, Cyan,
        Red, Magenta, Brown, LightGray,
        DarkGray, LightBlue, LightGreen, LightCyan,
        LightRed, LightMagenta, Yellow, White
    );
    
begin
    TextBackground(AllColors[1]);
    ClrScr;
    
    for var i := 1 to 200 do
    begin
        var col := Random(1, ColorCount);
        var x := Random(80);
        var y := Random(25);
        
        TextColor(AllColors[col]);
        GotoXY(x, y);
        print('*');
    end;
    
    readln;
end.