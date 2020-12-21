const last = 20;
var arr: array [1..last] of integer;
    sum, i, n: integer;
    
begin
  write('Введите кол-во элементов: ');
  read(n);
  
  write('Введите массив: ');
  for i := 1 to n do
    read(arr[i]);
  
  sum := 0; {приравниваем к нулю, чтобы у переменной было конкретное значение}
  for i := 1 to n do
    if arr[i] < 0 then {если элемент в массиве меньше нуля}
       sum += arr[i];  {прибавляем его к существующей сумме}
    
  writeln('Сумма отрицательных элементов: ', sum);
end.