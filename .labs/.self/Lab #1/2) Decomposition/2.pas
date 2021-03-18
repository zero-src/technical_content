var x, y: integer;

begin
  x := readinteger('x:');
  
  if x <= -2 then 
    y := -2 
  else 
    if x <= 0 then 
       y := x
    else
      if x <= 2 then 
         y := 0
      else
         y := x - 2;  
  
  write('y: ', y);
end.