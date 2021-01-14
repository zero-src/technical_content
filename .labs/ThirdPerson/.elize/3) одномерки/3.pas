const last = 20;
var arr: array [1..last] of integer;
    i, n, max: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  max := arr[1]; {присваиваем максимуму первое значение}
  for i := 2 to n do {i = 2 из-за того, что максимуму мы уже приравняли значение первого элемента}
    if max < arr[i] then {если max меньше элемента в массиве, то}
       max := arr[i];    {приравниваем значение этого элемента}
    
  writeln('Ответ: ', max);
end.