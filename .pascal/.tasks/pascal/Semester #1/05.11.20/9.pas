begin
  var arr: array of integer;
  arr := new integer[10];
  
  var (a, b) := readinteger2('(a, b):');
  for var i := 0 to 9 do
    arr.fill(i -> a * i + b);
  
  arr.Print;
end.