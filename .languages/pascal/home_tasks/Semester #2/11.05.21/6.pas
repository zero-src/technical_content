uses crt;

const Yellow = 14;
      Green = 2;
      Red = 4;

begin
    TextBackground(Red);
    TextColor(Green);
    
    for var i := 1 to 1600 do
      print(random(0, 9));
    
    TextBackground(Green);
    TextColor(Yellow);
    
    for var i := 1 to 1600 do
      print(random(0, 9));
    
    readln;
end.