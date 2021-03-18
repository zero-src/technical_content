var x, y, z: integer;
    res: real;
    
begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  res := power(x*y*z, 1/3);
  write('Ответ: ', res:6:4);
end.