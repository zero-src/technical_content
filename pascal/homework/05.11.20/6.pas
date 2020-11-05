begin
  var (a, b) := (ArrRandomInteger(10, -10, 20), ArrRandomInteger(10, -10, 20));
  
  for var i := 0 to 9 do
    b[i] := a[i];
  
  b.Print;
end.