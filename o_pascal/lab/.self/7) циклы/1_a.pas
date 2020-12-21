var sl, res: double;
    x, eps: real;
    i: integer;
    
begin
  print('(eps, x):');
  read(eps, x);
  
  (res, sl, i) := (0, x, 1);
  while (abs(sl / i) >= eps) do begin
    res += sl / i;
    sl *= x*x * i / (i+1);
    i += 2;
  end;
  
  writeln('Ответ : ', res:0:6);
  writeln('Arcsin: ', arcsin(x):0:6);
end.