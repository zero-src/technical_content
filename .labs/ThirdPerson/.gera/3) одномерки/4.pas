﻿const last = 20;
var arr: array [1..last] of integer;
    i, j, n, x: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  for i := n-1 downto 1 do
    for j := 1 to i do
      if arr[j] > arr[j+1] then begin
       x := arr[j];
       arr[j] := arr[j+1];
       arr[j+1] := x;
      end;
      
  write('Новый массив: ');
  for i := 1 to n do
    write(arr[i], ' ');
end.