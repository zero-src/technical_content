const ln = 20;
var a: array [1..ln] of integer;
    n, i, n_count: integer;
    avr: real;
    
begin
  write('Количество элементов: ');
  read(n);
  
  n_count := 0;
  avr := 0;
  
  for i := 1 to n do
    read(a[i]);
  
  for i := 1 to n do
    if a[i] > 0 then begin
      n_count += 1;
      avr += a[i];
    end;
  
  if n_count > 0 then
    avr := avr / n_count
  else 
    avr := 0;
  
  write('Ответ: ', avr);
end.