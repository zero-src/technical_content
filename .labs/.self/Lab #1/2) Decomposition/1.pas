var res: array [1..3] of real = (0, 0, 0);
    x, y, z: real;
    
begin
  (x, y, z) := readreal3('(x, y, z):');
  
  res[1] := x-y > y-z ? x-y : y-z;
  
  res[2] := x;
  if (y < res[2]) then
      res[2] := y;
  
  if (z < res[2]) then
      res[2] := z;
    
  res[3] := x*y+z < x+y*z ? x*y+z : x+y*z;
  writeformat('max(x-y, y-z): {0}{1}min(x, y, z): {2}{3}min(x*y+z, x+y*z): {4}',
               res[1], #13, res[2], #13, res[3]);               
end.