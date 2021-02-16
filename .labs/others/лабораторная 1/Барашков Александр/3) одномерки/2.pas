const last = 20;
var arr: array [1..last] of integer;
    i, n: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  for i := 1 to n do
    if arr[i] mod 5 <> 0 then 
      arr[i] := arr[i] - 1  
    else
      arr[i] := 2; 
    
  write('Новый массив: '); 
  for i := 1 to n do
    write(arr[i], ' ');
end.