begin
  var arr: array of integer;
  arr := new integer[10];
  
  for var i := 0 to 9 do
    arr.fill(i -> random(-10, 20));
  
  for var i := 0 to 9 do
    if arr[i] mod 2 = 0 then
       arr[i] := arr[i] div 2;
  
  arr.Print;
end.
