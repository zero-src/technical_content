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
--[[https://unicode-table.com/ru/sets/superscript-and-subscript-numbers/]]--

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

