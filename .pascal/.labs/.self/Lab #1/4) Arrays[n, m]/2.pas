const o_n = 20;
      o_m = 20;
      
var a: array [1..o_n, 1..o_m] of integer;
    i, j, n, m: integer;

begin
  (n, m) := readinteger2('(n, m):');
  
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(a[i, j]);
  
  for i := 1 to n do
    for j := 1 to m do
      a[i, j] := a[i, j] mod 5 = 0 ? a[i, j]*2 : a[i, j]+5;
  
  println('New array:');
  for i := 1 to n do begin
    for j := 1 to m do
      print(a[i, j]);
  println; 
  end;
end.