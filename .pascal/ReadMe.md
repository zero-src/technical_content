# Contents 🚀
  - [General information](#general-information)
      - [Program structure](#program-structure)
      - [Operations](#operations)
      - [Variable types](#variable-types)
      - [if else operators](#if--else-operators)
- [Loops](#loops)
    - [While](#while)
    - [Repeat](#repeat)
    - [Loop](#loop)
    - [For](#for)
- [Subprograms](#subprograms)
    - [Procedure](#procedures)
    - [Function](#functions)
- [Bitwise operators](#bitwise-operators)
    - [not](#operator-not)
    - [and](#operator-and)
    - [or](#operator-or)
    - [xor](#operator-xor)
- [Constants](#constants)
    - [Compile-time constants](#compile-time-constants)
    - [Runtime constants](#runtime-constants)
- [Different way of numbers recording](#different-way-of-numbers-recording)
- [More operators](#more-operators)
    - [Exit](#exit)
    - [Goto](#goto)
    - [Break](#break)
    - [Continue](#continue)

# General information

## Program structure
```pascal
// Optional for PascalABC.Net
// Example: program sum;
program {program name};

// Example: uses math, vectors;
uses {moduls you want to use}; 

// Example: label OUTPUT, 1, input;
label {labels you want to use};

// Example: const minimum: integer = 10; {variable constant}
//                maximum = 10; {unchangeable constant}
const {your variable with defenition};

// Example: type int = integer;
type {TypeName};

// Example: var a, b, c: integer;
var {variables you want to use};

// Example: procedure sum(var a, b: integer);
procedure {name}(params);

// Example: function sum(a, b: integer): integer;
function {name}(params): {return type};

begin
    {code here}
end.
```
[Back to TOC](#contents-)

## Operations
```pascal
var a, b, c: real;

begin
    c := a + b;
    c := a - b;
    c := a / b; {(a div b) if a, b: integer}
    c := a * b;
end.
```
[Back to TOC](#contents-)

## Variable types

### Integer types

Тип	| Диапазон | Байтов
----|----------|-------
Byte| 0 .. 255 | 1
Shortint | -128 .. 127 | 1
Smallint | -32768 .. 32767 | 2
Word | 0 .. 65535 | 2
Longint | -2147483648 .. 2147483647 | 4
Longword | 0..4294967295 | 4
Int64 | -9223372036854775808 .. 9223372036854775807	| 8
QWord | 0 .. 18446744073709551615 | 8

### Float types

Тип	| Диапазон | Значащих цифр | Байтов
----|----------|---------------|-------
Real | dependinng on platform | ??? | 4 or 8
Double | 5.0E-324 .. 1.7E308 | 15-16 | 8

[Back to TOC](#contents-)

## if | else operators
>'if' operator without 'else' will execute only true condition.
```pascal
if condition then
    {do something}
```

>'if' operator with 'else' will check all specified conditions.
```pascal
if condition then
    {do something}
else
    {do something};
```
[Back to TOC](#contents-)

# Loops

## While
```pascal
{ Sintax }
while {true condition} do
    {your code}
```

```pascal
{ Example }
var i, sum: integer;

begin
    sum := 0;
    i := 0;

    while i < 100 do
    begin
        sum += 1;
        i += 1;
    end;

    print(sum); // Output: 100
end.
```
[Back to TOC](#contents-)

## Repeat
```pascal
{ Sintax }
repeat
    {your code}
until {false condition};
```

```pascal
{ Example }
var i, sum: integer;

begin
    sum := 0;
    i := 0;

    repeat
        sum += 1;
        i += 1;
    until i = 100;

    print(sum); // Output: 100
end.
```
[Back to TOC](#contents-)

## Loop
```pascal
{ Sintax }
loop {execution count} do
    {your code}
```

```pascal
{ Example }
var sum: integer;

begin
    sum := 0;
    loop 100 do
        sum += 1;

    print(sum); // Output: 100
end.
```
[Back to TOC](#contents-)

## For
```pascal
{ Sintax }
for {start point} to {last point} do
    {your code}

for {last point} downto {start point} do
    {your code}
```

```pascal
{ Example }
var sum: integer;

begin
    sum := 0;
    
    for var i := 1 to 100 do
      sum += 1;

    print(sum); // Output: 100
end.
```
[Back to TOC](#contents-)


# Subprograms

## Procedures

```pascal
{ Sintax }

// Default procedure
procedure {name}(params);
begin
    {your code}
end;

// New abilities 
procedure {name}(params) := {your code};

// Overloaded procedure
procedure {name}(self: type); extensionmethod;
begin
    {your code}
end;

// Overloaded procedure
procedure {name}(self: type); extensionmethod := {your code};
```

```pascal
{ Example }

// Default procedure
procedure message;
begin
    println('1: Hello');
end;

// New abilities 
procedure increment(var x: integer) := x := x + 1;

// Overloaded procedure
procedure show(self: integer); extensionmethod;
begin
    println('3:', self);
end;

// Overloaded procedure
procedure o_increment(self: integer); extensionmethod := self += 1;

begin
    var x := 2;

    // procedure message
    message; //Output: 1: Hello

    // procedure increment
    increment(x);
    println('2:', x); //Output: 2: 3

    // procedure show
    x.show; //Output: 3: 3

    // procedure o_increment
    x.o_increment; 
    println('4:', x); //Output: 4: 3
end.
```
[Back to TOC](#contents-)

## Functions

```pascal
{ Sintax }

// Default function
function {name}(params): {type};
begin
    {your code}
end;

// New abilities 
function {name}(params): {type} := {your code};

// Overloaded function
function {type}.{name}(params): {type};
begin
    {your code}
end;

// Overloaded function
function {type}.{name}(params): {type} := {your code};
```

```pascal
// result := ... equivalent to {func name} := ...

// Default function
function message: string;
begin
    result := 'Hello';
end;

// New abilities 
function increment(x: integer): integer := x+1;

// Overloaded function
function integer.more: integer;
begin
    result := self + 1;
end;

// Overloaded function
function integer.more1: integer := self + 1;

// Overloaded operator
function operator not (variable: integer): integer; extensionmethod := 0;

begin
 var x := 0;
  
 // function message
 println('1:', message); //Output: 1: Hello
 
 // function increment
 println('2:', increment(x)); //Output: 2: 1
 
 // function integer.more
 println('3:', x.more); //Output: 3: 1
 
 // function integer.more1
 println('4:', x.more1); //Output: 4: 1
 
 // Without overloaded operator it will output -11
 println('5:', not 10); //Output: 5: 0
end.
```
[Back to TOC](#contents-)

# Bitwise operators
```pascal
var x, y, p, q, r: byte;

x := 42;  // 00101010 (binary)
y := 166; // 10100110 (binary)
```

## Operator: not
```pascal
var x: integer;

x := 4;     // x =  0000000 00000100 (binary)
x := not 4; // x = 11111111 11111011 (binary)
```
[Back to TOC](#contents-)

## Operator: and
```pascal
p := x and y; {34} // 0010 0010 (binary)

0010 1010
1010 0110
---------
0010 0010 {34 in decimal}
```
[Back to TOC](#contents-)

## Operator: or
```pascal
q := x or y; {174}  // 1010 1110 (binary)

0010 1010
1010 0110
---------
1010 1110 {174 in decimal}
```
[Back to TOC](#contents-)

## Operator: xor
```pascal
r := x xor y; {140} // 1000 1100 (binary)

0010 1010
1010 0110
---------
1000 1100 {140 in decimal}
```
[Back to TOC](#contents-)

# Constants

## Compile-time constants
> The values of these constants are determined at compile-time.
```pascal
const message = 'hello';
```
[Back to TOC](#contents-)

## Runtime constants
> The values of these constants are determined at runtime.
```pascal
const hello = 'Hello';
      part = copy(hello, 2, 2); {here it is!}
```
[Back to TOC](#contents-)


# Different way of numbers recording
> '$' allows you to use HexaDecimal numbers.
```pascal
var x: byte;

begin
    x := $1A7;
    print(x); // Output: 423
end.
```
[Back to TOC](#contents-)

# More operators

## Exit
> Exit allows you to exit from current execution location.
```pascal 
var x, y: integer; 

function calc(a: integer): integer;
begin
    a := 0;
    loop 10 do
    begin
        a += 1;
        exit;
    end;
    
    result := a;
end;

begin
    x := 1;
    x := calc(x); 
    println(x); // Output: 0;
    
    y := 1;
    loop 10 do
    begin
        y += 1;
        exit; {Force exit}
    end;

    println(y); // Will not be executed
end.
```
[Back to TOC](#contents-)

## Goto
> Goto allows you to jump across the code
```pascal
label place;
begin
    goto place;
    println(1);

    place:
        println(2);
    // Output: 2;
end.
```
[Back to TOC](#contents-)

## Break
> Break allows you exit from current loop.
```pascal
var x: integer;
begin
    x := 0;

    for var i := 1 to 10 do
    begin
        if i = 5 then
            break;
        
        x += 1;
    end;

    print(x); // Output: 4
end.
```
[Back to TOC](#contents-)

## Continue
> Continue allows you to skip current iteration
```pascal
var x: integer;
begin
    x := 0;

    for var i := 1 to 10 do
    begin
        if i = 5 then
            continue;
        
        x += 1;
    end;

    print(x); // Output: 9
end.
```
[Back to TOC](#contents-)

# ASKII table

  |.0 |.1 |.2 |.3 |.4 |.5 |.6 |.7 |.8 |.9 |.A |.B |.C |.D |.E |.F
  |---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---
2.|   |  !|  "|  #|  $|  %|  &|  '|  (|  )|  *|  +|  ,|  -|  .|  /
3.|  0|  1|  2|  3|  4|  5|  6|  7|  8|  9|  :|  ;|  <|  =|  >|  ?
4.|  @|  A|  B|  C|  D|  E|  F|  G|  H|  I|  J|  K|  L|  M|  N|  O
5.|  P|  Q|  R|  S|  T|  U|  V|  W|  X|  Y|  Z|  [|  \|  ]|  ^|  _
6.|  `|  a|  b|  c|  d|  e|  f|  g|  h|  i|  j|  k|  l|  m|  n|  o
7.|  p|  q|  r|  s|  t|  u|  v|  w|  x|  y|  z|  {|  ||  }|  ~|  
