type int = integer;
     data = record
         fname: string[50];
         salary: real;
         uid: int;
     end;
     
var i_f, o_f: file of data;
    info, tmp: data;
    max: real;
    
begin
    assign(i_f, '1.dat');
    rewrite(i_f);
    
    seek(i_f, 0);
    
    for var i := 1 to 5 do
    begin
        info.fname := readlnstring('Full name:');
        info.uid := readinteger('Worker UID:');
        info.salary := readreal('Worker salary:');
        
        println(i_f, info);
        println('-'*14);
    end;
    close(i_f);
    
    assign(o_f, '1_1.dat');
    
    rewrite(o_f);
    reset(i_f);
    
    seek(i_f, 0);
    read(i_f, tmp);
    max := tmp.salary;
    seek(i_f, 1);
    
    for var i := 2 to 5 do
    begin
        readln(i_f, tmp);
        if tmp.salary > max then
          max := tmp.salary;
    end;
    close(i_f);
    
    write(o_f, max);
    close(o_f);
end.