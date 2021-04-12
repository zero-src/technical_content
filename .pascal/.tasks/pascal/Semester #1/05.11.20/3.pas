begin
  var arr: array of real;
  arr := new real[10];
  
  for var i := 0 to 9 do
    arr.fill(i -> random(-10.0, 20.0));
  
  arr.Print;
end.