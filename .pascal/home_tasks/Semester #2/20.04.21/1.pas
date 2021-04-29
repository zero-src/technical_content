var s: string;
    f: text;
    
begin
  assign(f, '1.txt');
  append(f);
  
  s := readstring('string:');
  print(f, s);
  
  close(f);
end.