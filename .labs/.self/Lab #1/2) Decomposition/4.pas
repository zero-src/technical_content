var x, y, z: real;
    res: string;

begin
  (x, y, z) := readreal3('(x, y, z): ');
  
  res := '';
  if (x < y+z) and (y < x+z) and (z < x+y) then begin
    res += 'Треугольник существует';
    if (x*x + y*y = z*z) or (y*y + z*z = x*x) or (z*z + x*x = y*y) then
      res += ', он прямоугольный.';
  end;
  
  write(res <> '' ? res : 'Try again.');
end.