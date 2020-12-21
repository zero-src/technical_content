const last = 20;
var arr: array [1..last] of integer;
    cnt, i, n: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  cnt := 0;
  for i := 1 to n do
    if arr[i] < 0 then
      cnt += 1;
    
  write('Ответ: ', cnt);
end.