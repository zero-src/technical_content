<p align="center">
  <img width="180" src="./attachments/Images/java.ico" alt="java.ico">
  <h1 align="center">Essentials</h1>
  <p align="center">This section contains details about some of the common structures and features</p>
</p>

# 📝Contents
- [Exam](#%EF%B8%8F-exam)
  - [Exam Questions](#exam-questions)
- [Java](#-java-)

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

## Local variables

```java
public void eatMore(boolean hungry, int amountOfFood) {
  int roomInBelly = 5;
  
  if (hungry) {
    var timeToEat = true;
    
    while (amountOfFood > 0) {
      int amountEaten = 2;
      roomInBelly = roomInBelly - amountEaten;
      amountOfFood = amountOfFood - amountEaten;
    }
  }
  
  System.out.println(amountOfFood);
}
```
