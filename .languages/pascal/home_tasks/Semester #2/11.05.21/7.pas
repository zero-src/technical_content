uses crt;

const BGColCount = 8;
      
var BGColors: array [1..BGColCount] of word =
    (
        Black, Blue, Green, Cyan,
        Red, Magenta, Brown, LightGray,
    );

begin
    for var i := 1 to BGColCount do
    begin
        TextBackground(BGColors[i]);
        ClrScr;
        
        print(i);
        Delay(3000);
    end;
end.