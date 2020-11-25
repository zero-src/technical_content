var st, c_ans, w_ans, res: string;
    m, i: byte;
    
begin
   st := readstring('string:');
   res := 'New string: ';
   
   w_ans := 'she';
   c_ans := 'he';
   
   m := length(w_ans);
   while pos(w_ans, st) <> 0 do begin
        insert(c_ans, st, pos(w_ans, st));
        delete(st, pos(w_ans, st), m);
   end;
   
   writeln('-' * (length(st) + length(res)));
   writeln(res, st);
end.