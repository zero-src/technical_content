var flag: boolean := false;
    st, res: string;
    i: byte;
    
begin
  st := readstring('ФИО:');
  
  for i := 1 to st.length - 1 do begin
    if st[i] = ' ' then begin
      res += flag ? '' : ' ';
      flag := true;
    end;
    
    if (st[i] <> ' ') and (not flag) then
      res += st[i];
  
    if (st[i] = ' ') and flag then
      res += upcase(st[i+1]) + '.';
  end;
  
  write(res);
end.

(*
begin
  var (f, i, o) := readlnstring3('ФИО:');
  
  print($'{f} {i[1].upcase}. {o[1].upcase}.');
end.
*)