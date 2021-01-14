const last = 20;
var arr: array [1..last] of integer;
    i, n, max: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  max := arr[1];
  for i := 2 to n do 
    if max < arr[i] then 
       max := arr[i];    
    
  writeln('Максимальное значение: ', max);
end.