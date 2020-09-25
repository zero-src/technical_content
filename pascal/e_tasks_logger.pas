--[[https://unicode-table.com/ru/sets/superscript-and-subscript-numbers/]]--
--------------------------------------------------------------------------------
-- Lesson #0XX | Home task | xx.09.2020 
--------------------------------------------------------------------------------
// Task #1
begin
  var (a, b, c) := (0.0, 0.0, 0);
  
  while not ( ( tryread(a) and tryread(b) and tryread(c) ) and ( c > 0 ) and ( c < 4 ) ) do
    println('Try again');
  
  case c of
    1: print($'{a} + {b} = {a + b}');
    2: print($'{a} * {b} = {a * b}');
    3: print($'{a}^2 + {b}^2 = {a*a + b*b}');
  end;
  
end.
--------------------------------------------------------------------------------
// Task #2
begin
  var (k, x) := (0, 0);
  
  while not ( ( tryread(k) and tryread(x) ) and ( k > 0 ) and ( k < 4 ) ) do
    println('Try again');
  
  case k of 
    1: print($'{x} + 5 = {x + 5}');
    2: print($'{x} + 10 = {x + 10}');
    3: print($'{x} + 15 = {x + 15}');
  end;
end.

--------------------------------------------------------------------------------
-- Lesson #00X | Home task | xx.09.2020 
--------------------------------------------------------------------------------
// Task #1
begin
    // input 
    var year := readinteger('Year:');
    
    // math part 
    var o_cent := year mod 10 > 0;
    var cent := o_cent ? (year div 100) + 1 : year div 100;
    
    // output
    print('Сentury:', cent);
end.

--------------------------------------------------------------------------------
-- Lesson #007 | Home task | 17.09.2020 
--------------------------------------------------------------------------------
// Task #1
begin
    var x := readreal('Enter d: ');
    writeln('D: ', frac(x));
end.
--------------------------------------------------------------------------------
// Task #2
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
// Task #4
begin
    // input
    var k := readInteger('Input:');
    
    // vars
    var (sum, i) := (0, 1);
    
    // check for valid number
    if (k < 0) then
        k := abs(k);
        
    // addition function
    repeat
    inc(sum, k mod 10);
        println(k mod 10, ' | ', sum);
            k := k div 10;
        inc(i, 1);
    until k = 0;
    
    // output
    print('sum:', sum);
end.
--------------------------------------------------------------------------------
// Task #5
type api = ^memory;
     memory = record
       h: 0..23;
       m: 0..59;
       s: 0..86400;
     end;
  
  begin
    // memory api
    var p: api;
    new(p);
    
    // input
    readln(p^.s); 
    
    // main chunk
    p^.h := p^.s div sqr(60);
        p^.s := p^.s mod sqr(60);
    
    p^.m := p^.s div 60;
        p^.s := p^.s mod 60;
    
    // output
    println('Your time:', p^);
    print('--------------------');
  end.

--------------------------------------------------------------------------------
-- Lesson #005 | Home task | 11.09.2020 
--------------------------------------------------------------------------------
// Task #1 | a and b are real (use '+', '-', '*' operators)
begin
    // input 
    var (a, b) := readreal2;
    
    // output
    println(' a + b = ', a + b, #13#10, 'a - b = ', a - b, #13#10, 'a * b = ', a * b);
end.
--------------------------------------------------------------------------------
// Task #2 | x and y are integer. Find ( |x| - |y| ) / ( 1 + |x * y| )
begin
    // input 
    var (x, y) := readinteger2;
    
    // math part 
    var res := ( abs(x) - abs(y) ) / ( 1 + abs(x*y) );
    
    // output
    print('Result: ', res);
end.
--------------------------------------------------------------------------------
//Task #3 | l has known length. Find S and V of coub
begin
    // input 
    var l := readinteger;
    
    // math part 
    var S := 4 * sqr(l);
    var V := sqr(l) * l;
    
    // output
    print(' S: ', S, #13#10, 'V: ', V);
end.
--------------------------------------------------------------------------------
//Task #4 | Legs a and b are known. Find hypotenuse and S
begin
    // input 
    var (a, b) := readreal2;
    
    // math part 
    var S := (a*b)/2;
    var c := sqrt(a*a + b*b); 
    
    // output
    write('Hypotenuse: ', c, #13#10, 'S: ', S);
end.
--------------------------------------------------------------------------------
//Task #5 | Leg a is known. Find S of equilateral triangle
begin
    // input 
    var a := readreal;
    
    // math part 
    var S := ( sqrt(3) / 4 )*sqr(a);
    
    // output
    print('S: ', S);
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

