var x1,x2,x3,y1,y2,y3, maxx, maxy:integer;
    r: real;
    
begin
  write('x1, x2, x3: ');
  read(x1, x2, x3);
  
  write('y1, y2, y3: ');
  read(y1, y2, y3);
  
  maxx := x1;
  if x2 > maxx then 
    maxx:=x2
  else 
    maxx:=x3;

  maxy := y1;
  if y2 > maxy then 
    maxy:=y2 
  else
    maxy:=y3;
  
  r:= sqrt(sqr(maxx) + sqr(maxy));
  
  writeln('радиус наименьшего круга равен ', r:8:6);
end.