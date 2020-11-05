const a = 0;
      b = 9;
      
begin
  var arr: array of integer;
  arr := new integer[b - a + 1];
  
  for var i := a to b do
    arr.fill(i -> random(-10, 20));
  
  arr.Print;
end.