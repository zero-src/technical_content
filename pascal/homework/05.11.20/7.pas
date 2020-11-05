begin
  var arr: array of integer;
  
  var n := readinteger('n:');
  arr := new integer[n];
  
  for var i := 0 to n - 1 do
    read(arr[i]);
  
  var tmp := arr.First;
  arr.First := arr[1];
  arr[1] := tmp;
end.