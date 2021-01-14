var arr: array [1..5] of integer;
    sum, cnt, i: integer;
    
begin
  write('Введите массив а: ');
  for i := 1 to 5 do
    read(arr[i]);
  
  ///Условие а
  sum := 0;
  for i := 2 to 5 do
    if arr[i] > arr[1] then
      sum += arr[i];
  
  ///Условие б
  cnt := 0;
  for i := 1 to 5 do
    
end.