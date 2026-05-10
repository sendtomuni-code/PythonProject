# Conditional Statements

## Introduction

Conditional statements allow you to execute different blocks of code based on certain conditions. In Python, the primary conditional statement is the `if...else` construct.

![Conditional Statements](Resource/Conditional%20Statements.png)

## Basic if...else Statement

The `if` statement evaluates a condition. If the condition is true, the code block under `if` is executed. Otherwise, the code under `else` is executed.

### Example: Voting Eligibility

```python
a = int(input("Enter Your age:"))

if a >= 18:
    print("You are eligible to vote")
    print("You are casting your vote from " + str(a-18) + " Years")
else:
    print("You are not eligible to vote")
    print("You can cast your vote in " + str(18-a) + " Years")
```

This program checks if the user is 18 or older to determine voting eligibility.

## Importance of Indentation

Python uses indentation to define code blocks. Incorrect indentation will lead to syntax errors.

### Incorrect Example 1

```python
a = int(input("Enter Your age:"))

if a >= 18:
    print("You are eligible to vote")
        print("You are casting your vote from " + str(a-18) + " Years")  # Incorrect indentation
else:
    print("You are not eligible to vote")
    print("You can cast your vote in " + str(18-a) + " Years")
```

This will raise an `IndentationError` because the second print statement is not properly indented under the `if`.

### Incorrect Example 2

```python
a = int(input("Enter Your age:"))

if a >= 18:
print("You are eligible to vote")  # Incorrect indentation
    print("You are casting your vote from " + str(a-18) + " Years")
else:
    print("You are not eligible to vote")
    print("You can cast your vote in " + str(18-a) + " Years")
```

This will also raise an `IndentationError` as the print statement is not indented under the `if`.

## Compound Conditional Statements

You can combine multiple conditions using logical operators like `and`, `or`, and `not`.
![Compound Statement](Resource/Compound%20Statement.png)