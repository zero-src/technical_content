var x, y, z, max, min, s_max: real;

begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  max := x;
  if max < y then
     max := y;
  if max < z then
     max := z;
  
  min := x;
  if min > y then
     min := y;
  if min > z then
     min := z;
  
  s_max := z-x;
  if s_max < z+y then
     s_max := z+y;
  s_max := sqr(s_max);
  writeln('max(x, y, z): ', max);
  writeln('min(x, y, z): ', min);
  writeln('max^2(z-x, z+y): ', s_max);
end.