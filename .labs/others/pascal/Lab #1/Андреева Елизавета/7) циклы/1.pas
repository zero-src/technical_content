var i, n:integer;
    x,t,s,e:real;
    
begin
  write('(n, x): ');
  readln(n, x);

  t:=1;
  s:=t;

  for i := 1 to n do begin
    t:=-t*x*x/(2*i-1)/(2*i);
    s:=s+t;
  end;
    
  writeln('S = ',s:8:6);
  write('cos(x) = ',cos(x):8:6);
end.