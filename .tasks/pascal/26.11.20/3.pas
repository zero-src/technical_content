var st, c_ans, w_ans, t_ans, res: string;
    cnt, m, i: byte;
    
begin
   st := readstring('string:');
   res := 'New string: ';
   
   w_ans := 'he';
   c_ans := 'she';
   t_ans := '{b}';
   
   m := length(w_ans);
   while pos(w_ans, st) <> 0 do begin
        insert(t_ans, st, pos(w_ans, st));
        delete(st, pos(w_ans, st), m);
   end;
   
   while pos(t_ans, st) <> 0 do begin
        insert(c_ans, st, pos(t_ans, st));
        delete(st, pos(t_ans, st), m+1);
   end;
   
   writeln('-' * (length(st) + length(res)));
   writeln(res, st);
end.