var str, key: string;
    m, i, cnt: byte;
    
begin
   str := 'he he  hehe';
   key := 'he';
   cnt := 0;
   
   m := length(key);
   while pos(key, str) <> 0 do begin
        delete(str, pos(key, str), m);
        cnt += 1;
   end;
   
   writeln(cnt)
end.