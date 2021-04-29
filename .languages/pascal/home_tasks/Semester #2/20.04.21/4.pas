var saved: array [1..256] of string;
    cnt: integer;
    f: text;

function resolver(s: string): string;
begin
  while pos('101', s) <> 0 do
    for var i := pos('101', s) to pos('101', s) + 2 do
      s[i] := '0';
    
  result := s;
end;

begin
  assign(f, '4.txt');
  reset(f);
  
  cnt := 0;
  
  while not eof(f) do
  begin
    cnt += 1;
    readln(f, saved[cnt]);
  end;
  close(f);

  rewrite(f);
  for var i := 1 to cnt do
    println(f, resolver(saved[i]));
  close(f);
end.