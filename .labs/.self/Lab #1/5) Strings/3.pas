var st, key: string;
    i: byte;
    
begin
   st := readstring('string:');
   key := '/';
   
   while (pos(key, st) < pos('*', st)) and (pos(key, st) <> 0 ) do 
     delete(st, pos('/', st), 1);
   
   print('Corrected:', st);
end.