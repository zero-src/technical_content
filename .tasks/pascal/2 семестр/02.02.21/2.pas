///Solution for defaulf equations
procedure __equation(a, b, c: real);
begin
  var d := (b*b) - (4*a*c);
  var key := d < 0 ? 1 : d = 0 ? 2 : 3;
  
  case key of
    1: print('Immaterial roots.');
    2: print($'x = {(-b + sqrt(d)) / (2*a)}');
    3: print($'x1 = {(-b+sqrt(d)) / (2*a)}; {#13}x2 = {(-b-sqrt(d)) / (2*a)};');
  end;
end;

var a, b, c: real;

begin
  println('Equation type: ax² + bx + c = 0');
  (a, b, c) := readreal3('[a, b, c]:');
  
  __equation(a, b, c);
end.