procedure __length(var res: real; x1, x2, y1, y2: real);
begin
  var l1 := power(x2-x1, 2);
  var l2 := power(y2-y1, 2);
  
  res := sqrt(l1+l2);
end;

///Variables' initialization
var x, y, res: array [1..3] of real;
    num: word := 1;
    P, S, H: real;

begin
  ///Default value
  P := 0;
  
  ///Getting coordinats
  for var i := 1 to 3 do
    (x[i], y[i]) := readreal2($'x[{i}], y[{i}]:');
  
  ///Simple loop
  for var i := 1 to 2 do
      for var j := i+1 to 3 do begin
        __length(res[num], x[i], x[j], y[i], y[j]);
        P += res[num];
        inc(num);
      end;
      
  ///Variables' definition
  H := P / 2;
  S := H;
  
  ///Heron equation
  for var i := 1 to 3 do
    S *= H - res[i];
  
  ///Output
  println('Perimetr:', P);
  println('Square:', S);
end.