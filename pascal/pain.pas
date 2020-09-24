--------------------------------------------------------------------------------
-- Выводит x с конца цифру
--------------------------------------------------------------------------------
type lib = record
    k : longint;
    i : shortint;
end;

var ui:lib; num:shortint;
   
procedure _math(var g_num : longint; num: shortint); begin
ui.i := 1;
if (g_num < 100) then begin print('num is lower than 100', #13#10); exit; end;
    repeat
        if (ui.i = num) then print(g_num mod 10);
            g_num := g_num div 10;
        inc(ui.i, 1);
    until g_num = 0;
end;

begin
    // input
    readln(ui.k, num);
    
    // main function
    _math(ui.k, num);   
end.

--------------------------------------------------------------------------------
-- Большее из трёх
--------------------------------------------------------------------------------
program g_machine;

// объявляем переменные
var a, b, c, m_num:integer;

// процедура поиска максимального числа
procedure max(var count : integer; a, b, c : integer ); begin
    if ( a > b ) then count := a else count := b;
    if ( c > count ) then count := c;
end;

begin
    // объявление переменных
    readln(a, b, c);
    
    // сама процедура
    // m_num будет принимать значение максимума
    max(m_num, a, b, c);
    
    // вывод максимального числа
    writeln(m_num);
end.
