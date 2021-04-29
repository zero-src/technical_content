var saved: array [1..256] of string;
    k, cnt: integer;
    f: text;
    
begin
  assign(f, '3.txt');
  reset(f);
  
  cnt := 0;
  
  while not eof(f) do
  begin
    cnt += 1;
    readln(f, saved[cnt]);
  end;
  close(f);
  
  k := readinteger('string to del:');
  
  if k > cnt then
  begin
    print('Error: string not found.');
    exit;
  end;
  
  rewrite(f);
  
  for var i := 1 to cnt do
    if k <> i then
      println(f, saved[i]);

  close(f);
end.