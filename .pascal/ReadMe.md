# Contents 🚀
  - [General information](#general-information)
      - [Program structure](#program-structure)
      - [Operations](#operations)
      - [Variable' types](#variable-types)
      - [if else operators](#if--else-operators)
      - [Cycles](#cycles)
          - [While](#while)
          - [Repeat](#repeat)
          - [Loop](#loop)
          - [For](#for)
      - [Subprograms](#subprograms)
          - [Procedure](#procedures)
          - [Function](#functions)
      - [Bitwise operators](#bitwise-operators)


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

## Cycles

### While
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

    print(sum); // Outputs: 100
end.
```
[Back to TOC](#contents-)

### Repeat
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

    print(sum); // Outputs: 100
end.
```
[Back to TOC](#contents-)

### Loop
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

    print(sum); // Outputs: 100
end.
```
[Back to TOC](#contents-)

### For
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

    print(sum); // Outputs: 100
end.
```
[Back to TOC](#contents-)


## Subprograms

### Procedures

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

### Functions

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

## Bitwise operators

```pascal
    x, y, p, q, r: byte;

    // not
    x := 4;     // x =  0000000 00000100 (binary)
    x := not 4; // x = 11111111 11111011 (binary)
```

### 'and' operator

// and
x := 42;    // 00101010 (binary)
y := 166;   // 10100110 (binary)

    // And operator
    00101010
    10100110
    --------
    00100010

p := x and y; {34}   // 00100010


q := x or y;  {174}  // 10101110
r := x xor y; {140}  // 10001100