﻿begin
  var arr: array of integer;
  arr := new integer[10];
  
  for var i := 0 to 9 do
    arr.fill(i -> random(-10, 20));
  
  for var i := 0 to 9 do
    arr[i] := trunc(arr[i] / 2);
  
  arr.Print;
end.