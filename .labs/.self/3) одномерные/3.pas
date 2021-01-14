///Бахтуров Максим | ТМП-15 | Вариант 4 | Задание 3
const ln = 10;
var a: array [1..ln] of integer;
    min, n, i: integer;

begin
  n := readinteger('n:');
  
  print('Введите элементы массива:');
  for i := 1 to n do
    a[i] := readinteger;
  
  min := a[1];
  for i := 1 to n do
    if a[i] < min then 
       min := a[i];
       
   print('min:', min);
end.