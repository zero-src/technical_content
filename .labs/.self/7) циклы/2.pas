var num, cnt: integer;

begin
  cnt := 0;
  
  repeat
    read(num);
    
    if num <> 99 then
     if (num mod 7 = 1) or (num mod 7 = 2) or (num mod 7 = 5) then
      cnt += 1;
    
  until num = 99;
    
  print(cnt);
end.