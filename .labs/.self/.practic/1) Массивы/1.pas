const n = 7;

type matrix  = array [1..n, 1..n] of real;
     vec     = array [1..n] of real;
     
var i, j, pow_i: integer;
    A: matrix;
    Y, res: real;
    X: vec;
    
begin
  pow_i := 1;
  
  /// Заполнение массива
  for i := 1 to n do
  begin
    pow_i *= 2;
    
    res := (i - 4.3) / pow_i;
    for j := 1 to n do
      A[i, j] := res * (abs(j - 3.7) - 2);
  end;
  
  /// Вывод матрицы
  println('Matrix output:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(A[i, j]:11:6);
  println;
  end;
  
  /// Пробел
  println;
  
  /// Заполнение вектора X
  for j := 1 to n do
  begin
    X[j] := abs(A[1, j]); 
    for i := 2 to n do
      if X[j] > abs(A[i, j]) then
         X[j] := abs(A[i, j]);
  end;
  
  /// Вывод вектора X
  writeln('Vector X:');
  for i := 1 to n do
    write(X[i]:10:6);
  
  /// Произведение
  Y := 1;
  for i := 1 to n-1 do
    Y *= 1 / (abs(X[i]) + 1) + X[i+1];
  
  /// Пробелы
  println;
  println;
  
  /// Вывод Y
  writeln('Y: ', Y:8:6);
end.