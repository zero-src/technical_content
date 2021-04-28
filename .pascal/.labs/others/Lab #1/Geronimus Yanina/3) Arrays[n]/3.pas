const last = 20;
var arr: array [1..last] of integer;
    i, n, min: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  min := arr[1]; 
  for i := 2 to n do 
    if min > arr[i] then 
       min := arr[i];    
    
  writeln('Ответ: ', min);
end.