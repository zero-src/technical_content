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


## Cycles

### While
```pascal
    // Sintax
    while {true condition} do
        {your code}
```

> Example:
```pascal
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

### Repeat
> Sintax
```pascal
    repeat
        {your code}
    until {false condition};
```

> Example
```pascal
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

### Loop
> Sintax
```pascal
    loop {execution count} do
        {your code}
```

> Example
```pascal
var i, sum: integer;

begin
    sum := 0;
    i := 0;

    loop 100 do
    begin
        sum += 1;
        i += 1;
    end;

    print(sum); // Outputs: 100
end.
```




