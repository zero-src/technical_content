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
    
    for var i := 1 to ColorCount do
    begin
        TextColor(AllColors[i]);
        ClrScr;
        
        print(i);
        Delay(500);
    end;
    
    readln;
end