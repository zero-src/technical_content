const last = 20;
var arr: array [1..last] of integer;
    c, i, n: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  c := 0;
  for i := 1 to n do
    if arr[i] > 0 then
      c += 1;
    
  write('Ответ: ', c);
end.