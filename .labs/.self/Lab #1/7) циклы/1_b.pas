var x: real;
    n: integer;

function _arcsin(x: real; n: integer): real; begin
  result := 0;
  var res := x;
 
  for var i := 1 to n do begin
    result += res / (2*i-1);
    res *= x*x * (2*i-1) / (2*i);
  end;
end;

begin
  print('(n, x):');
  read(n, x);
  
  while (abs(x) < 1) do begin
    x := _arcsin(x, n);
  end;
    
  writeln('Ответ : ', res:0:6);
  writeln('Arcsin: ', arcsin(x):0:6);
end.