var x, y, z, max, max2, min: real;

begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  max := x+y+z;
  if max < x-y+z then
    max := x-y+z;
  
  max2 := x+y;
  if max2 < y+z then
    max2 := y+z;
  
  if max2 < x+z then
    max2 := x+z;
  max2 := sqr(max2);
  
  min := x;
  if min > y then
    min := y;
  
  if min > z then
    min := z;
  
  writeln('max(x+y+z, x-y+z): ', max);
  writeln('max^2(x+y, y+z, x+z): ', max2);
  writeln('max(x, y, z): ', min);
end.