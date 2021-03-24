### Contents 🚀
  - [General information](#general-information)
      - [Program structure](#program-structure)
      - [Operations](#operations)


## General information

#### Program structure
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

#### Operations
```pascal
var a, b, c: real;

begin
    c := a + b;
    c := a - b;
    c := a / b; {(a div b) if a, b: integer}
    c := a * b;
end.
```



