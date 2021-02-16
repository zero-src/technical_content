const o_n = 20;
      o_m = 20;
      
var a: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, cnt, sum: integer;
    avr: real;

begin
  write('Размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(a[i, j]);
    
  cnt := 0;
  sum := 0;
  
  for i := 1 to n do
    for j := 1 to m do
      if a[i, j] > 0 then begin
        sum += a[i, j];
        cnt += 1;
      end;
  
  if cnt > 0 then
    avr := avr / cnt
  else 
    avr := 0;
  
  write('Ответ: ', avr:5:2);
end.