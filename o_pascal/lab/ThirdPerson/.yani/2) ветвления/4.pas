var x1,x2,x3,y1,y2,y3: integer;
    r1, r2, r3, min: real;
    
begin
  write('x1, x2, x3: ');
  read(x1, x2, x3);
  
  write('y1, y2, y3: ');
  read(y1, y2, y3);

  r1:= sqrt(sqr(x1) + sqr(y1));
  r2:= sqrt(sqr(x2) + sqr(y2));
  r3:= sqrt(sqr(x3) + sqr(y3));
  
  min := r1;
  if r2 < min then 
    min:=r2;
  if r3 < min then 
    min:=r3;
  
  writeln('радиус наименьшего круга равен ', min:8:6);
end.