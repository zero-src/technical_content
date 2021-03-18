var x, y, z, t: integer;

begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  t := x;
  x := y;
  y := z;
  z := t;
  
  write('Ответ: ', x, ' ', y, ' ', z);
end.