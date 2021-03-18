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
    if arr[i] mod 7 <> 0 then {если элемент не кратен 7 (остаток не 0)}
       arr[i] += 10  {прибавляем 10}
    else
       arr[i] -= 10; {иначе отнимаем 10}
    
  write('Ответ: '); 
  for i := 1 to n do
    write(arr[i], ' ');
end.