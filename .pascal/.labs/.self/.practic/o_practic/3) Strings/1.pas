var count, idx: byte;
    st: string;
    
begin
  st := readstring('String input:');
  idx := st.Length;
  
  for var i := st.Length downto 1 do
    if i = idx then
      if st[i].ToLower = 'я' then
      begin
        idx := i;
        while (st[idx] <> ' ') do
        begin
          if st[idx].ToLower = 'а' then
            count += 1;
          idx -= idx >= 2 ? 1 : 0;
        end;
      end;
    
  print('Answer:', count);
end.