begin
  var str := readstring('Unsorted:');
  var n := str.length;
  
  for var i:=1 to n-1 do
    for var j:=i+1 to n do
      if str[i]>str[j] then 
        (str[i], str[j]) := (str[j], str[i]);
      
  print('Sorted:', str);
end.