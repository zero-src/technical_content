{ Any unauthorised broadcasting, public performance, copying or re-recording will constitute an infringement of copyright. }
unit o_access;

interface
type lib = record
     category: string[25];
     login: string[25];
     pass: string[25];
end;

procedure o_database();

implementation uses o_users, crt;

/// Accounts base
procedure o_database(); label 1, 2, 3; begin
  
  /// Scanning for ban
  if ( b.ban or b.verify ) then begin
    print('Access denied.');
    
    var a := readkey;
    if ( a <> '' ) then s_menu() else s_menu();
  end;
  
    var f: file of lib;
    var answer: char;
    var dat: lib;
        
    assign(f,'o_access');
    
    /// Scan for files
    if not fileexists('o_access') then rewrite(f);
    f.Elements; 
    
    /// Main menu
  2: clrscr;
     header;
     
     answer := readlnchar('Search for your categories? [Y for yes] or [1 to back home]:');
      if ( upcase(answer) = 'Y' ) then goto 1
      else if ( answer = '1' ) then s_menu() else goto 3;
    
    /// Adding new accounts
  3: var n := readlninteger('Accounts to add:');
    for var i := 1 to n do begin
      println($'[{i} account]'); 
      
      /// Input
      with dat do begin
        
        category := readlnstring('Category:');
        login := readlnstring('Login:');   
        pass := readlnstring('Password:'); 
        
      end;
      
      write(f, dat);
      if (i = n) then goto 2;
    end;
    
    /// End of main part
    close(f);
    clrscr;
    
    /// Search for categories 
   1: repeat
       var c := readstring('Find by category name:');
       var i := false; f.Elements;
       
       /// Displays 
       while not eof(f) do begin
         read(f, dat); 
         if ( dat.category.ToUpper = c.ToUpper ) then begin 
           i := true;
           
           println('-' *9);
           println($'Login: {dat.login} | Password: {dat.pass}');
           println('-' *9);
         end;
       end;
       
       /// Check for wrong category
       if not i then print('Wrong category.');
       answer := readlnchar('Continue searching? [Y for yes]:');
       
       /// End of search func
       if ( upcase(answer) <> 'Y' ) then begin
         println('Search canceled');
         close(f); 
       end else goto 2;
       
     until readkey <> 'Y';
  end;
end.
{ Copyright (c) 2018-2020 Death#4932 }