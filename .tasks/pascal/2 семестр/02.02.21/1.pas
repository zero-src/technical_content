///Perimetr
procedure _P(var res: real; x, y, z: real) := res := x + y + 2 * sqrt(((x - y) / 2)*((x - y) / 2) + z*z);

///Square
procedure _S(var res: real; x, y, z: real) := res := z*((x + y) / 2);

var res: array [1..2] of real;
    a, b, c: real;

begin
  ///Description & Input
  println('[a, b] - основания; c - высота.');
  (a, b, c) := readreal3('[a, b, c]:');
  
  ///Math part
  _P(res[1], a, b, c);
  _S(res[2], a, b, c);
  
  ///Output
  println('Perimetr:', res[1]);
  println('Square:', res[2]);
end.