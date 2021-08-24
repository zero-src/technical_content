{ Any unauthorised broadcasting, public performance, copying or re-recording will constitute an infringement of copyright. }
uses o_access, o_users, crt;

begin
  /// Console configuration
  SetWindowTitle('Account manager');
  setwindowsize(81, 20);
  
  /// Input
  u_login(); { Login: Death | Password: Root }
  
  /// Really important part of program
  s_menu();
end.
{ Copyright (c) 2018-2020 Death#4932 }
