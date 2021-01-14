const last = 20;
var arr: array [1..last] of integer;
    i, j, n, e: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  for i := n-1 downto 1 do
    for j := 1 to i do
      if arr[j] < arr[j+1] then begin
       e := arr[j];
       arr[j] := arr[j+1];
       arr[j+1] := e;
      end;
      
  write('Отсортированный массив: ');
  for i := 1 to n do
    write(arr[i], ' ');
end.