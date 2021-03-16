var a, b, h, x: real;

function f(x: real): real := power(sqr(x) + 2, 1/3) - sin(x);

begin
  (a, b, h) := readreal3('[a, b, h]:');
  x := a;
  
  println('|   X    |      Y     |');
  while x <= b + 0.001 do
  begin
    writeln('| ', x:5:2, '  | ', f(x):10:5, ' |');
    x += h;
  end;
end.