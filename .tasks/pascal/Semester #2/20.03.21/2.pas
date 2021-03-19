var n, inp: integer;
    f: text;
    
begin
  assign(f, 'file_2');
  rewrite(f);
  
  n := readinteger('n:');
  
  print('numbers:');
  for var i := 1 to n do 
    print(f, readinteger);
  
  close(f);
  reset(f);
  
  print('Even numbers:');
  for var i := 1 to n do
  begin
    read(f, inp);
    
    if inp mod 2 = 0 then
       print(inp);
  end;
  
  close(f);
end.