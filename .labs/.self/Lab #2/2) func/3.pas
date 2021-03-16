type vec = array of integer; 

var n1, n2: integer;
    arr1, arr2: vec;

function vec.avr: real;
begin 
  var n_max := self[0];
  var n_min := self[0];
  
  result := self[0];
  var min_cnt := 1;
  var max_cnt := 1;
  var cnt := 1;
  
  for var i := 1 to self.length-1 do
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
  
  cnt := self.length - (min_cnt + max_cnt);
  result := cnt <> 0 ? (result - (n_min * min_cnt + n_max * max_cnt)) / cnt : 0;;
end;

procedure input(var arr: vec; n: integer);
begin
  print('Введите массив:');
  for var i := 0 to n-1 do
    arr[i] := readinteger;
end;

begin
  /// First array
  n1 := readinteger('n:');
  arr1 := new integer[n1];  
  input(arr1, n1);
  
  /// Second array
  n2 := readinteger('n:');
  arr2 := new integer[n2];  
  input(arr2, n2);
  
  println($'arr1 : {arr1.avr}');
  println($'arr2 : {arr2.avr}');
end.