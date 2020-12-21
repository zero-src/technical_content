///Бахтуров Максим | ТМП-15 | Вариант 4 | Задание 2
const ln = 10;
var a: array [1..ln] of integer;
    n, i: integer;

begin
  n := readinteger('n:');
  print('Введите элементы массива:');
  
  for i := 1 to n do
    a[i] := readinteger;
  

  for i := 1 to n do
    if a[i] mod 5 = 0 then a[i] *= 2 else
       a[i] += 5;
    
  print('ответ:'); 
  for i := 1 to n do
    print(a[i]);
end.