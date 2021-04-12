var x, y: real;

begin
  x := readreal('x:');
  
  y := (tan(x) + sin(x)) * exp(cos(x));
  
  print('Ответ:', y);
end.