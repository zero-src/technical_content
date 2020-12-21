const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  write('Размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] mod 2 <> 0 then 
         arr[i, j] += 10  
      else
         arr[i, j] -= 10; 
    
  writeln('Ответ:'); 
  for i := 1 to n do begin
    for j := 1 to m do
      write(arr[i, j], ' ');
  writeln;
  end;
end.