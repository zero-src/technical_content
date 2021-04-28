const n = 7;
var a:array [1..n,1..n] of real;
 x:array [1..n] of real;
  i,j:integer; znam,chis,per,y:real;
begin
  
 // Задание №1
   
  per:=1;
  for i:=1 to n do
    begin
      per:=per/i;
      for j:=1 to n do
        a[i,j]:=(j-5.7)*(2-sqr(j-3))*per;
    end;
    
  println('Матрица:');
  for i:=1 to n do
    begin
      for j:=1 to n do
        write(a[i,j]:8:4,' |');
      println;
    end;
    
 // Задание №2
   
  for i:=1 to n do
    begin
      x[i]:=0;
      for j:=1 to n do
        x[i]:=x[i]+a[i,j]*a[j,i];
    end;
    
  println('Сформированный вектор:');
  for i:=1 to n do
    write(x[i]:8:4,' |');
    
 // Задание №3
   
  (chis,znam):=(0,0); 
  for i:=1 to n do
    if x[i]<=1 then
      chis+=x[i]
    else
      znam+=x[i];
  y:=chis/znam;
  
  println;
  print($'Ответ: Y = {y}');
  
 end.