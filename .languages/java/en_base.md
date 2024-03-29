<p align="center">
  <img width="180" src="./attachments/Images/java.ico" alt="java.ico">
  <h1 align="center">Essentials</h1>
  <p align="center">This section contains details about some of the common structures and features</p>
</p>

# 📝Contents
- [Exam](#%EF%B8%8F-exam)
  - [Exam Questions](#exam-questions)
- [Java](#-java-)
  - [Literals and the Underscore Character](#literals-and-the-underscore-character)
  - [Reserved words](#reserved-words)
  - [Destroying Objects](#destroying-objects)
  - [Interfaces](#interfaces)

# 🖊️ Exam

## Exam Questions

The 1Z0-815 exam consists of multiple-choice questions. There are
between four and seven possible answers. If a question has more than
one answer, the question specifically states exactly how many correct
answers there are. This book does not do that. We say “Choose all that
apply” to make the questions harder. This means the questions in this
book are generally harder than those on the exam. The idea is to give
you more practice so you can spot the correct answer more easily on
the real exam.

---

### 1. Identify benefits of Java

> Benefits of Java include `object-oriented`
design, `encapsulation`, `platform independence`, robustness, simplicity,
security, multithreading, and `backward compatibility`.

### 2. Define common acronyms. 

> The `JDK` stands for `Java Development
Kit` and contains the `compiler` and `JVM` launcher. The `JVM` stands for
`Java Virtual Machine`, and it runs bytecode. `API` is an `application
programming interface`, which is code that you can call.

### 3. Be able to write code using a main() method. 
> A `main()` method
is usually written as `public static void main(String[] args)`.
Arguments are referenced starting with `args[0]`. Accessing an
argument that wasn’t passed in will cause the code to throw an
exception.

### 4. Understand the effect of using packages and imports.
> Packages contain Java classes. Classes can be imported by `class name`
or `wildcard`. Wildcards **do not** look at **subdirectories**. In the event of a
conflict, class name imports take precedence.

### 5. Be able to recognize misplaced statements in a class. 
> Package and import statements are `optional`. If present, both go before the class
declaration in that order. Fields and methods are also `optional` and are
allowed in any order within the class declaration

### 6. Understand if and else decision control statements. 
The if and else statements come up frequently throughout the exam in
questions unrelated to decision control, so make sure you fully
understand these basic building blocks of Java.

### 7. Understand switch statements and their proper usage. 
You should be able to spot a poorly formed switch statement on the exam.
The switch value and data type should be compatible with the case
statements, and the values for the case statements must evaluate to
compile-time constants. Finally, at runtime a switch statement
branches to the first matching case, or default if there is no match, or
exits entirely if there is no match and no default branch. The process
then continues into any proceeding case or default statements until a
break or return statement is reached.

### 8. Understand `while` loops. 
Know the syntactical structure of all while
and do/while loops. In particular, know when to use one versus the
other.

### 9. Be able to use `for` loops. 
You should be familiar with for and foreach loops and know how to write and evaluate them. Each loop has
its own special properties and structures. You should know how to use
for-each loops to iterate over lists and arrays.

### 10. Understand how `break`, `continue`, and `return` can change flow control.
Know how to change the flow control within a statement by
applying a break, continue, or return statement. Also know which
control statements can accept break statements and which can accept
continue statements. Finally, you should understand how these
statements work inside embedded loops or switch statements.

---

# 🐾 Java 🐾

## Literals and the Underscore Character

```java
int million1 = 1000000; // GOOD
int million2 = 1_000_000; // GOOD

double annoyingButLegal = 1_00_0.0_0; // Ugly, but compiles
double reallyUgly = 1__________2; // Also compiles

double notAtStart = _1000.00; // DOES NOT COMPILE
double notAtEnd = 1000.00_; // DOES NOT COMPILE
double notByDecimal = 1000_.00; // DOES NOT COMPILE
```

---

## Reserved words
|  | | | | |
|  --- | --- | --- | --- | --- |
|  abstract | assert | boolean | break | byte |
|  case | catch | char | class | const`*` |
|  continue | default | do | double | else |
|  enum | extends | false`**` | final | finally |
|  float | for | goto`*` | if | implements |
|  import | instanceof | int | interface long |
|  native | new | null`**` | package | private |
|  protected | public | return | Short | static |
|  strictfp | super | switch | synchronized | this |
|  throw | throws | transient | true`**` | try |
|  void | volatile | while | _ (underscore) | |

`*` The reserved words const and goto **aren’t actually used in Java**. They are `reserved` so that
people coming from other programming languages don’t use them by accident—and in theory,
in case Java wants to use them one day.

`**` true/false/null are not actually reserved words, but `literal values`. Since they cannot be
used as identifier names, we include them in this table.

---

## Destroying Objects

## Checking for Unperformed Side Effects
Be wary of short-circuit behavior on the exam, as questions are known
to alter a variable on the right side of the expression that may never be
reached. This is referred to as an unperformed side ef ect. For
example, what is the output of the following code?

```java
int rabbit = 6;
boolean bunny = (rabbit >= 6) || (++rabbit <= 7);
System.out.println(rabbit); // 6
```

Because rabbit >= 6 is true, the increment operator on the right side
of the expression is never evaluated, so the output is 6.

## Interfaces

Predicate, Consumer, Supplier, and Comparator.
