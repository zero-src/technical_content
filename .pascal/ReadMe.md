### Contents 🚀
  - [General information](#general-information)
      - [Program structure](#program-structure)
      - [Operations](#operations)


## General information

### Program structure
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

### Operations
```pascal
var a, b, c: real;

begin
    c := a + b;
    c := a - b;
    c := a / b; {(a div b) if a, b: integer}
    c := a * b;
end.
```

### Variable's types

#### Integer types

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

#### Float types

Тип	| Диапазон | Значащих цифр | Байтов
----|----------|---------------|-------
Real | зависит от платформы	| ??? | 4 or 8
Double | 5.0E-324 .. 1.7E308 | 15-16 | 8
