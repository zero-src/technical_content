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
- [ASKII table](#askii-table)
- [Debugging](#debugging)
- [Ranges and Enumerated types](#ranges-and-enumerated-types)
    - [Range](#range-type)
    - [Enumerated type](#enumerated-type)
        - [Cmd colors](#cmd-colors)
- [More types](#more-types)
    - [Array](#array)
    - [Record](#record)
- [Strings](#strings)
- [Files](#files)
    - [Text files](#text-files)
    - [Typed files](#typed-files)
- [addresses, pointers and dynamic memory](#addresses-pointers-and-dynamic-memory)

# General information
>**I am using PascalABC.NET 3.8 for compiling .pas files.**

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
Type | Range | Bytes
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
Type | Range | Significant numbers | Bytes
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
{ syntax }
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
{ syntax }
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
{ syntax }
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
{ syntax }
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
{ syntax }

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
{ syntax }

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

## Operator: not
```pascal
var x: integer;

x := 4;     // x =  0000000 00000100 (binary)
x := not 4; // x = 11111111 11111011 (binary)
```
[Back to TOC](#contents-)

```pascal
var x, y, p, q, r: byte;

x := 42;  // 00101010 (binary)
y := 166; // 10100110 (binary)
```

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

| |.0 |.1 |.2 |.3 |.4 |.5 |.6 |.7 |.8 |.9 |.A |.B |.C |.D |.E |.F 
--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---
2.|   |  !|  "|  #|  $|  %|  &|  '|  (|  )|  *|  +|  ,|  -|  .|  /
3.|  0|  1|  2|  3|  4|  5|  6|  7|  8|  9|  :|  ;|  <|  =|  >|  ?
4.|  @|  A|  B|  C|  D|  E|  F|  G|  H|  I|  J|  K|  L|  M|  N|  O
5.|  P|  Q|  R|  S|  T|  U|  V|  W|  X|  Y|  Z|  [| \ |  ]|  ^|  _
6.|  `|  a|  b|  c|  d|  e|  f|  g|  h|  i|  j|  k|  l|  m|  n|  o
7.|  p|  q|  r|  s|  t|  u|  v|  w|  x|  y|  z|  {| \| |  }| ~|  

```pascal
{ ASKII Table }
var i, j: integer;
    c: char;

begin
    write('  |');
    for c := '0' to '9' do
        write(' .', c);

    for c := 'A' to 'F' do
        write(' .', c);
    writeln;

    write('  |');
    for i := 1 to 16 do
        write('---');
    writeln;

    for i := 2 to 7 do
    begin
        write(i, '.|');
        for j := 0 to 15 do
            write('  ', chr(i * 16 + j));
        writeln
    end
end.
```
[Back to TOC](#contents-)


# Debugging 
> **{$I-} where 'I' from Input and '-' for disabling error messages**
> - **If (IOResult <> 0) it means that error was found**
```pascal
var x, y: integer;
begin
    {$I-}
    read(x, y);
    if IOResult = 0 then
        println(x * y)
    else
        println('Incorrect input');
end.
```
[Back to TOC](#contents-)

# Ranges and Enumerable types

## Range type
> Useless and dead type... Forget abot this type please
```pascal
{ Syntax }
type {Type name} = {range};
var {variable}: {Type name};
```

```pascal
{ Example }
type R = 1..10;
var range: R;

begin
    {No example coz type is dead}
end.
```
[Back to TOC](#contents-)

## Enumerated type
```pascal
{ Syntax }
type {name} = ({params});
```

```pascal
{ Example }
type weekday = (Monday, Tuesday, Wednesday, Thursday, Friday,
		Saturday, Sunday);

var startOfWeek: weekday;
begin
	startOfWeek := Sunday;
    print(startOfWeek); // Output: Sunday
end.
```
[Back to TOC](#contents-)

### Cmd colors
> **Output preview**

![**Output preview**](https://media.discordapp.net/attachments/753901770522230894/824585847252713492/unknown.png?width=881&height=331)
> **Code preview**

```pascal
{ ColorsDemo }
uses crt;

const
    ColorCount = 16;
    BGColCount = 8;
var
    AllColors: array [1..ColorCount] of word =
    (
        Black, Blue, Green, Cyan,
        Red, Magenta, Brown, LightGray,
        DarkGray, LightBlue, LightGreen, LightCyan,
        LightRed, LightMagenta, Yellow, White
    );

procedure MakeLine(line, fgcolor: integer);
var i, j, w: integer;
begin
    w := WindowWidth div BGColCount;
    for i := 1 to BGColCount do
    begin
        GotoXY((i-1)*w + 1, line);
        TextBackground(AllColors[i]);
        for j := 1 to w do
        begin
            if j mod 2 = 0 then
                TextColor(fgcolor + 0)
            else
                TextColor(fgcolor);
            write(' ')
        end
    end 
end;

procedure MakeScreen;
var i: integer;
begin
    clrscr;
    for i := 1 to WindowHeight do
        MakeLine(i, AllColors[i mod ColorCount + 1]);
end;

begin
    MakeScreen;
end.
```
[Back to TOC](#contents-)

# More types

## Array
> Array consists of several variables with a same type
```pascal
{ Syntax }
type {Array type name} = array [{Start value}..{Last value}] of {values type};
var {name}: {Array type name};

begin
    for var i := {Start value} to {Last value} do
        print(i);

    { OR }

    for var i := {Last value} downto {Start value} do
        print(i);
end.
```

```pascal
{ Example }
type IntArr = array [1..5] of integer;
var a: IntArr;

begin
    for var i := 1 to 5 do
        print(i);

    { OR }

    for var i := 5 downto 1 do
        print(i);

    // Output: 1 2 3 4 5 5 4 3 2 1
end.
```
[Back to TOC](#contents-)

> You can also put **ranged** type into brackets: **array [integer] of integer**
```pascal
type BoolArr = array [boolean] of integer;
var a: BoolArr;

begin
    foreach var x in a do
        print(x);
    // Output: 0 0
    
    a[true] := 1; println;
    foreach var x in a do
        print(x);
    // Output: 0 1
end.
```
[Back to TOC](#contents-)

## Record
```pascal
{ Syntax }
type {Record name} = record
    {type defining}
end;
var {name}: {Record name};
```

```pascal
{ Example }
type CheckPoint = record
    hidden: boolean;
    distance: real;
end;

var point: CheckPoint;

begin
    point.hidden := false;
    point.distance := 0.72;

    print(point);
    // Output: (False, 0.72);
end.
```
[Back to TOC](#contents-)

> Also you are able to use record as a type in array
```pascal
{ Example }
type CheckPoint = record
    hidden: boolean;
    distance: real;
end;

var point: array [boolean] of CheckPoint;

begin
    point[false].hidden := true;
    point[false].distance := 0.84;

    point[true].hidden := false;
    point[true].distance := 0.72;

    print(point);
    // Output: [(True, 0.84), (False, 0.72)] ;
end.
```
[Back to TOC](#contents-)

# Strings
> String is equivalent to **array [0..255] of char**
```pascal
{ Syntax }
var {name}: string;
```
[Back to TOC](#contents-)

> Example operations with strings
```pascal
const msg1 = 'Hello World!';
      msg2 = 'Yes.';
      
var s1, s2: string;

begin
    // Logic operators
    // Uses ASKII 
    println('cat' > 'cab'); // Output: True
    
    // Concatenation
    s1 := msg1;
    s2 := msg2;
    
    println(concat(s1, s2)); // Output: Hello World!Yes.
    
    // Copy
    s1 := msg1;
    println(copy(s1, 1, 5)); // Output: Hello
    
    // Delete
    s1 := msg1;
    
    delete(s1, 1, 6);
    println(s1); // Output: World!
    
    // Insert
    s1 := msg1;
    s2 := msg2;
    
    insert(s2, s1, 1);
    println(s1); // Output: Yes.Hello World!
    
    // Length
    s2 := msg2;
    println(s2.Length); // Output: 4
    
    // Pos
    s1 := msg1;
    println(pos('!', s1)); // Output: 12
    
    // Str
    str(10.2, s1);
    println(s1); // Output: 10.2
    
    // Val
    var (x, err) := (0.0, 0);
    s1 := '12.3';
    
    val(s1, x, err);
    println(x); // Output: 12.3
    
    // SetLength
    println('Before:', s1.Length); // Output: Before: 4
    
    SetLength(s1, 10);
    println('After:', s1.Length); // Output: Before: 10
end.
```
[Back to TOC](#contents-)

# Files

## Text files
> User-friendly files

```pascal
{ Syntax }
var {name}: text;

begin
    // Connects variable with selected file
    assign({name}, {FileName});

    // Creates file if needed. Erases all information in the file then opens file for writing
    rewrite({name});

    // Opens existing file for reading
    reset({name});

    // Opens existing file for writing
    append({name});

    // Closes current operation (rewrite, reset, append, ...)
    close({name});
end.
```

> Task: Create a file from integers. Open file and output only Even numbers
```pascal
{ Solution }
var n, inp: integer;
    f: text;
    
begin
    assign(f, 'file.txt');
    rewrite(f);

    n := readinteger('n:');

    print('numbers:');
    for var i := 1 to n do 
        print(f, readinteger);
  
    close(f);
    reset(f);
  
    print('Even numbers:');
    for var i := 1 to n do
    begin
        read(f, inp);
        
        if inp mod 2 = 0 then
        print(inp);
    end;
    
    close(f);
end.
```
[Back to TOC](#contents-)

## Typed files
```pascal
{ Syntax }
var {name}: file of integer;

begin
    // Connects variable with selected file
    assign({name}, {FileName});

    // Creates file if needed. Erases all information in the file then opens file for writing
    rewrite({name});

    // Opens existing file for reading
    reset({name});

    // Changes current 'file pointer' position
    seek({name}, {position})

    // Closes current operation (rewrite, reset, append, ...)
    close({name});
end.
```

> This program opens 'typed file' and writs record data into file
```pascal
{ Example }
type n_point = record
    name: string[15];
    hide: boolean;
end;

var f: file of n_point;
    p, v: n_point;

begin
    assign(f, 'file.txt');
    rewrite(f);
    
    p.hide := true;
    p.name := 'point';
    
    seek(f, 1);
    print(f, p);
    
    close(f);
    
    reset(f);
    
    while not EOF(f) do
    begin
        read(f, v);
        print(v);
    end;
    close(f);
end.
```
[Back to TOC](#contents-)

# addresses, pointers and dynamic memory
> #### addresses
> - address identifies memory cell.
> - address of memory area is equivalent to address of the first memory cell in thes area
>
> #### Pointers
> - Pointer - variable wich keeps an address
> - "A points to B" means "A consists address of B"

[Back to TOC](#contents-)