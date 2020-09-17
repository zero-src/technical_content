--[[https://unicode-table.com/ru/sets/superscript-and-subscript-numbers/]]--
--------------------------------------------------------------------------------
-- Lesson #007 | Home task | 17.09.2020 
--------------------------------------------------------------------------------
// Task #1
program s_remover;
var x, d:real;

begin
    x := 24.41201;
    writeln('D: ', x - trunc(x));
end.
--------------------------------------------------------------------------------
// Task #4
var k, i, sum:longint;

begin
    // input
    readln(k);
    
    // vars
    sum := 0;
    i := 1;
    
    // check for valid number
    if (k < 100) then begin
        write('num is lower than 100', #13#10); 
        exit;
    end;
    
    // addition function
    repeat
    sum := sum + k mod 10;
        writeln(' ', k mod 10, ' | ', sum);
            k := k div 10;
        inc(i, 1);
    until k = 0;
    
    // output
    writeln(#13#10, 'sum: ', sum);
end.
--------------------------------------------------------------------------------
// Task #5
program s_counter;

type hour = 0..23;
     min  = 0..59;
     sec  = 0..86400;

    // time manip
    lib = record
        h: hour;
        m: min;
        s: sec;
    end;
var p: lib; ch: char;

begin
    // input
    readln(p.s);
    
    // main chunk
    p.h := p.s div sqr(60);
        p.s := p.s mod sqr(60);
    
    p.m := p.s div 60;
        p.s := p.s mod 60;
    
    // output
    write('Your time: ');
        if ( p.h < 10 ) then write('0', p.h, ':') else write(p.h, ':');
        if ( p.m < 10 ) then write('0', p.m, ':') else write(p.m, ':');
        if ( p.s < 10 ) then write('0', p.s, ':') else write(p.s, ' ');
    write(#13#10, '-------------------');
end.

--------------------------------------------------------------------------------
-- Lesson #005 | Home task | 11.09.2020 
--------------------------------------------------------------------------------
// Task #1 | a and b are real (use '+', '-', '*' operators)
program s_counter;

var a, b:real;
begin
    // input 
    read(a, b);
    
    // output
    writeln('a + b = ', a + b, #13#10, 'a - b = ', a - b, #13#10, 'a * b = ', a * b);
end.
--------------------------------------------------------------------------------
// Task #2 | x and y are integer. Find ( |x| - |y| ) / ( 1 + |x * y| )
program s_equation;

var x, y:integer; res:real;
begin
    // input 
    read(x, y);
    
    // math part 
    res := ( abs(x) - abs(y) ) / ( 1 + abs(x*y) );
    
    // output
    writeln('Result: ', res);
end.
--------------------------------------------------------------------------------
//Task #3 | l has known length. Find S and V of coub
program s_V;

var l, S, V:integer;
begin
    // input 
    read(l);
    
    // math part 
    S := 4 * sqr(l);
    V := sqr(l) * l;
    
    // output
    writeln('S: ', S, #13#10, 'V: ', V);
end.
--------------------------------------------------------------------------------
//Task #4 | Legs a and b are known. Find hypotenuse and S
program o_triangle;

var a, b, c, S:real; 
begin
    // input 
    read(a, b);
    
    // math part 
    S := (a*b)/2;
    c := sqrt(a*a + b*b); 
    
    // output
    writeln('Hypotenuse: ', c, #13#10, 'S: ', S);
end.
--------------------------------------------------------------------------------
//Task #5 | Leg a is known. Find S of equilateral triangle
program s_triangle;

var a, S:real; 
begin
    // input 
    read(a);
    
    // math part 
    S := ( sqrt(3) / 4 )*sqr(a);
    
    // output
    writeln('S: ', S);
end.

--------------------------------------------------------------------------------
-- Lesson #003 | Home task | 09.09.2020 
--------------------------------------------------------------------------------

-- Part #1
1. 0 < x < 1         ["equals to"]   (0 < x) and (x < 1)
2. x = max(x, y, z)  ["equals to"]   (x > y) and (x > z)
3. x ≠ max(x, y, z)  ["equals to"]   ( (x > y) and (x < z) ) or ( (x < y) and (x > z) )
4. .. a или b ..     ["equals to"]   a or b
5. .. a и b ..       ["equals to"]   a and b

-- Part #2
1. uses math; var x:real; begin readln(x); writeln( power((power(x, 8) + power(8, x)), 1/8) ) end.
2. uses math; var x, y, z:real; begin readln(x, y, z); writeln( (x*y*z - 3.3*abs(x + power(y, 1/4))) / (power(10, 7) + power(ln(4)/ln(10), 1/2)) ) end.
3. uses math; begin writeln( ( Beta + sqr( sin( power(π, 4))) ) / (cos(2) + abs(cos(Gamma) / sin(Gamma))) ) end.

--------------------------------------------------------------------------------
-- Lesson #002 | Home task | 03.09.2020 
--------------------------------------------------------------------------------

-- Part #1
Записать на языке Pascal в дробной части до 4х цифр: 
1) 5!           ["equals to"]   1 * 2 * 3 * 4 * 5
2) 6,38         ["equals to"]   6.38
3) -0,7         ["equals to"]   -7E-5
4) 11⁄4         ["equals to"]   11/4
5) -(1⁄6)       ["equals to"]   -(1/6)
6) √2           ["equals to"]   sqrt(2)
7) π            ["equals to"]   3.1415926535897932385
8) 5*10⁶        ["equals to"]   5E6
9) -24,8 * 10⁻⁷ ["equals to"]   -24.8E-07
10) 10⁶         ["equals to"]   1E6
11) 1⁄100000    ["equals to"]   1/100000

-- Part #2
1) trunc(6.9) = 6  | round(6.9) = 7
2) trunc(6.2) = 6  | round(6.2) = 6
3) round(0.5) = 1

