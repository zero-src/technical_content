var st, key: string;
    s_pos: byte;
    
begin
   st := readstring('String:');   
   key := ',';
   
   s_pos := pos(key, st);
   
   print('Позиция первой запятой:', s_pos);
end.