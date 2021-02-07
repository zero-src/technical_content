function condition(n: integer; x, y: array of integer): integer;
begin
  for var i := 0 to n-1 do
    result += x[i] * y[i];
end;

var x, y: array of integer;
    n, res: integer;
    
begin
  n := readinteger('n:');
  
  x := new integer[n <= 0 ? 1 : n];
  y := new integer[n <= 0 ? 1 : n];
  
  for var i := 0 to n-1 do
    (x[i], y[i]) := readinteger2('x, y:');
  
  if condition(n, x, y) > 0 then
    for var i := 0 to n-1 do
      res += sqr(x[i])
  else
    for var i := 0 to n-1 do
      res += sqr(y[i]);
    

  print('Ответ:', res);
end.