uses math;

var r: real;

begin
  r := readreal('r:');
  
  println('Circle length:', math.c_length(r));
  println('Circle square:', math.c_square(r));
end.