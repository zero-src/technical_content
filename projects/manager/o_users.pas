unit o_users;

interface
type account = auto class
      /// v_user
      login : string;
      pass  : string;
      
      /// v_info
      money : integer;
      ban   : boolean;
        
      /// o_access
      verify: boolean;
 end;
 var b := new account; 
 
 
/// definition
procedure _ans(self: char; params a: array of char);
procedure s_input(var s: string);
procedure try_again();
procedure _verify();
procedure u_login();
procedure s_menu();
procedure m_menu();
procedure header();

function o_verify(self: string): boolean;

//--------------------------------------\\
            { Backend part }
//--------------------------------------\\
implementation uses crt, o_access;
/// Header
procedure header(); begin
  println(chr(9)*2, '   //--------------------------------------\\');
  println(chr(9)*2, '              { Account manager }            ');
  println(chr(9)*2, '   //--------------------------------------\\');
end;

/// Check for wrong key
procedure _ans(self: char; params a: array of char); label 1; begin  
var bool := false;

  for var i := 0 to a.Length - 1 do begin
    bool := a[i] = self;
    if ( bool ) then goto 1;
  end; 
  
1: clrscr; s_menu();
end;

/// try again meme
procedure try_again(); begin
  if ( b.verify = false ) then begin
    clrscr;
    
    println('Try again.', #13);
    u_login();
  end;
end;

/// start menu
procedure s_menu(); begin
  _verify(); try_again(); clrscr;
  
  header;  
  println($'Welcome, {b.login}.');
  println('1. Show information about my account.');
  println('2. Manage my accounts.');
  
  var a := readkey;
  repeat  
    if ( a = '1' ) then begin
      clrscr; m_menu();
    end;
    
    if ( a = '2' ) then begin
      clrscr; o_database();
    end;
    
   /// Valid numbers
  _ans(a, '1', '2');
  until a = '';
end;

/// main menu
procedure m_menu(); begin 
  _verify(); try_again();
  
  header;
  println('-' *21);
  println($'Account details:'); 
  println($'- Login: {b.login}');
  println($'- Password: {b.pass}');
  println($'- Money: {b.money + 20}$');
  println($'- Ban: {b.ban}');
  println($'- Verified: [{b.verify}]');
  println('-' *21);
  
  /// Home button
  println('1. Back to start menu.');
  
  var a := readkey;   
  repeat
    if ( a = '1' ) then begin
      clrscr;
      s_menu();
    end;
    
   /// Valid numbers
  _ans(a, '1');
  until a = '';
  
  println;
end;

/// login operation
procedure u_login(); begin
  header;
  b.login := readlnstring('Login:'); 
  print('Password:'); s_input(b.pass);
 
  _verify(); try_again();
end;

/// v_security 
procedure s_input(var s: string); var c: char; begin
  var p := '';
  s := '';
  
  repeat
    c := readkey;
    p += c;
    
    case c of
      'A'..'Z': c := '*';
      'a'..'z': c := '*';
      '1'..'9': c := '*';
      #13: break;
    end;
    
    write(c); 
    s += c;
    
  b.pass := p;
  until false;
  
  println; println;
end;

/// o_access functions
procedure _verify(); begin
  var v := b.login + b.pass; o_verify(v);
end;

function o_verify(self: string): boolean; var bool := b.verify; begin
    b.verify := self = 'DeathRoot';
end;
end.
