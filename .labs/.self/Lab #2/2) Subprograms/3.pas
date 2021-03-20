const c_n = 20;
type vec = array [0..c_n] of integer; 

var n1, n2: integer;
    arr1, arr2: vec;

function avr(var self: vec; n: integer): real;
begin  
  var n_max := self[0];
  var max_cnt := 1;
  
  var n_min := self[0];
  var min_cnt := 1;  

  result := self[0];
  for var i := 1 to n-1 do
  begin
    result += self[i];
    
    if self[i] = n_min then
      min_cnt += 1;
    
    if self[i] = n_max then
      max_cnt += 1;
    
    if n_min > self[i] then
    begin
      n_min := self[i];
      min_cnt := 1
    end;
    
    if n_max < self[i] then
    begin
      n_max := self[i];
      max_cnt := 1;
    end;
  end;
  
  var cnt := n - (min_cnt + max_cnt);
  
  result := ((cnt <> 0) and (n_max <> n_min)) ? (result - (n_min * min_cnt + n_max * max_cnt)) / cnt : 0;;
end;

procedure input(var arr: vec; var n: integer);
begin
  n := readinteger('n:');

  print('Введите массив:');
  for var i := 0 to n-1 do
    arr[i] := readinteger;
end;

begin
  /// First array
  input(arr1, n1);
  
  /// Second array 
  input(arr2, n2);
  
  println($'arr1 : {avr(arr1, n1)}');
  println($'arr2 : {avr(arr2, n2)}');
end.