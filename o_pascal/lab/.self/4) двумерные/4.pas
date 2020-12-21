const o_n = 20;
      o_m = 20;
 
var arr: array [1..o_n, 1..o_m] of integer;
    avr: array [1..o_n] of real;
    i, j, n, m: integer;
 
begin
  (n, m) := readinteger2('(n, m):');
 
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
 
  for i := 1 to n do begin
    avr[i] := 0;
    for j := 1 to m do
      avr[i] += arr[i, j]; 
  avr[i] := avr[i] / m;
  end;
 
   for i := 1 to n do
     writeln('str[', i, ']: ', avr[i], ' ');
end.