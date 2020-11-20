var str, c_ans, w_ans: string;
    m, i: byte;
    
begin
   str := 'he he  abhe';
   w_ans := 'he';
   c_ans := 'she';
   
   m := length(w_ans);
   while pos(w_ans, str) <> 0 do begin
        insert(c_ans, str, pos(w_ans, str));
        delete(str, pos(w_ans, str), m);
   end;
   
   writeln(str)
end.