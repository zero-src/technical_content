--------------------------------------------------------------------------------
-- Best of three
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
