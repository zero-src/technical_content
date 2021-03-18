const o_n = 20;
      o_m = 20;
      
var a: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, cnt, sum: integer;
    avr: real;

begin
  (n, m) := readinteger2('(n, m):');
  
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(a[i, j]);
    
  cnt := 0;
  sum := 0;
  
  for i := 1 to n do
    for j := 1 to m do
      if a[i, j] < 0 then begin
        sum += a[i, j];
        cnt += 1;
      end;
  
  avr := cnt = 0 ? 0 : sum / cnt;
  write('average: ', avr:1:2);
end.