uses math;

var a, b, c: real;

begin
  (a, b) := readreal2('[a, b]:');
  c := sqrt(sqr(a) + sqr(b));
  
  println('Triangle perimeter:', math.t_perimeter(a, b, c));
  println('Triangle square:', math.t_square(a, b));
end.