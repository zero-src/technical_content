const last = 20;
var arr: array [1..last] of integer;
    i, n, maximum: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  maximum := arr[1];
  for i := 2 to n do 
    if maximum < arr[i] then 
      maximum := arr[i];    
    
  writeln('Максимум: ', maximum);
end.