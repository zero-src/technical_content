type point = record
  x, y, z: real;
end;

var A, B: point;
    res: real;
    
begin
  write('Введите точку А: ');
  readln(A.x, A.y, A.z);
  
  write('Введите точку B: ');
  read(B.x, B.y, B.z);
  
  
end.