begin
  var arr: array of integer;
  arr := new integer[10];
  
  for var i := 0 to 9 do
    arr.fill(i -> i);
  
  arr.Print;
end.