var x, y, z: real;
    res: string;

begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  res := '';
  if (x < y+z) and (y < x+z) and (z < x+y) then
    res += 'Треугольник существует';
    if (y*y + z*z > x*x) or (z*z + x*x > y*y) or (x*x + y*y > z*z) then
      res += ', он остроугольный.';
  
  if res <> '' then
     write('Ответ: ', res)
  else
    write('Ошибка');
end.