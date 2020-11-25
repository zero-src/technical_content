///Бахтуров Максим | ТМП-15 | Вариант 4 | Задание 1
var st, c_ans, w_ans, res: string;
    cnt, m, i: byte;
    
begin
   st := readstring('string:');
   w_ans := 'abc';
   
   m := length(w_ans);
   while pos(w_ans, st) <> 0 do begin
        delete(st, pos(w_ans, st), m);
        cnt += 1;
   end;
   
   writeln('abc count: ', cnt); 
end.