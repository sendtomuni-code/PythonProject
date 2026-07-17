# Python Programming - Beginner to Master
## Section: 3. Python Data Types

---

# Table of Contents
1. [Literals or Constants](#literals-or-constants)
2. [Base Conversion](#base-conversion)

---

# Literals or Constants

## Section 1: Summary

This lecture thoroughly explores the concept of **literals** in Python, explaining what literals are and their importance as direct constant values used in programs. It starts by differentiating variables that are assigned direct values (literals) from those assigned results of expressions or input. 

The lecture then dives into the **various types of literals**:
- Integer
- Float
- Boolean
- Complex
- String

New important syntax features such as the use of **underscores (_)** for readability in numeric literals are introduced and demonstrated with examples, including valid and invalid usages. The lecture also clarifies common errors linked to literals, like syntax and name errors. 

Finally, it explains string literals in single, double, and triple quotes and highlights subtle distinctions in usage. Throughout, the concepts are reinforced with practical demonstrations in Jupyter Notebook.

---

## Section 2: Key Concepts and Explanations

### What are Literals?

- **Literals** are direct constant values
- Literals are explicitly written in code
- Variables may hold literals, results of computations, or input data
- Literals are synonymous with constants
- **Example**: `a = 10` (10 is literal), vs `c = a + b` (c receives a computed value, not a literal)

### Types of Literals

#### 1. Integer Literals

- Direct integer values like `201`
- Can be very large numbers
- **Use underscores (_) as digit separators** for readability (e.g., `13_52_46_198`)
- Cannot include commas for digit grouping in code
- **Important**: Underscores must only be between digits, not at the start or end
- **Examples of invalid uses**: `358_`, `_125` (will raise SyntaxError or NameError)

**Valid Examples:**
```python
a = 201
b = 13_52_46_198
print(a, b)  # Output: 201 135246198
```

**Invalid Examples:**
```python
c = 358_  # SyntaxError: invalid decimal literal
d = _125  # NameError: name '_125' is not defined
```

#### 2. Float Literals

- Numbers with decimals like `9.75`
- Can be in scientific notation like `12E2` or `12.5e-2`
- Can use underscores between digits and decimals for readability (e.g., `125.67` or `12_5.6_7`)
- **Important**: Underscores cannot be placed directly before or after a decimal point
- Use `type()` function to check type - demonstrates literals with decimal points are floats

**Examples:**
```python
a = 9.75
b = 15.0
print(a, b)  # Output: 9.75 15.0
print(type(b))  # Output: <class 'float'>

# Scientific notation
c = 12E2    # Equivalent to 12*10^2 = 1200.0
d = 12.5e-2 # 0.125
print(c, d)  # Output: 1200.0 0.125

# Float literals with underscores
e = 125.67
f = 12_5.6_7
print(e, f)  # Output: 125.67 125.67
```

#### 3. Boolean Literals

- Only two values: `True` and `False`
- **Must be capitalized**; all lowercase `true` or `false` is invalid and raises errors
- Integers like `1` are NOT boolean literals

**Correct Usage:**
```python
a = True
b = False
print(a, b)  # Output: True False
```

**Incorrect Usage:**
```python
c = false  # NameError: name 'false' is not defined
```

#### 4. Complex Literals

- Complex numbers with real and imaginary parts, e.g., `4+5j`, `12+14j`
- Both real and imaginary parts can be integers or floats (e.g., `1.4+2.5j`)
- Underscores can be used within parts for readability
- The letter **`j`** denotes the imaginary unit

**Examples:**
```python
a = 4 + 5j
b = 12 + 14j
print(a, b)  # Output: (4+5j) (12+14j)

# Complex literals with floats
c = 1.4 + 2.5j
d = 1_2 + 1_4j
print(c, d)  # Output: (1.4+2.5j) (12+14j)
```

#### 5. String Literals

- Represent text, such as words or sentences
- Can be enclosed in **single quotes** `'Alexa'`, **double quotes** `"Alexa"`, or **triple quotes** `'''Alexa'''`
- **Double and single quotes can be nested**: e.g., `'"Alexa"'` produces a string including double quotes inside
- **Triple quotes** allow multi-line strings or strings containing both single and double quotes

**Examples:**
```python
name = 'Alexa'
name1 = "Alexa"
name2 = '"Alexa"'
print(name, name1, name2)  # Output: Alexa Alexa "Alexa"

# Triple quotes for multi-line strings
long_string = '''This is a multi-line
string with "double" and 'single' quotes'''
```

---

### Common Errors with Literals

**SyntaxError** 
- Occurs when literals are malformed (e.g., trailing underscores)
- Example: `c = 358_` → `SyntaxError: invalid decimal literal`

**NameError**
- Occurs when incorrect capitalization is used for booleans
- Example: `c = false` → `NameError: name 'false' is not defined`

**Understanding error messages** helps in debugging and avoiding these common mistakes.

---

## Section 3: Example Code and Use Cases

### Complete Code Examples

```python
# ============ Integer Literals ============
a = 201
b = 13_52_46_198
print(a, b)  # Output: 201 135246198

# ============ Float Literals ============
a = 9.75
b = 15.0
print(a, b)  # Output: 9.75 15.0
print(type(b))  # Output: <class 'float'>

# Scientific notation float literals
c = 12E2     # Equivalent to 12*10^2 = 1200.0
d = 12.5e-2  # 0.125
print(c, d)  # Output: 1200.0 0.125

# Float literals with underscores
e = 125.67
f = 12_5.6_7
print(e, f)  # Output: 125.67 125.67

# ============ Boolean Literals (correct usage) ============
a = True
b = False
print(a, b)  # Output: True False

# ============ Complex Literals ============
a = 4 + 5j
b = 12 + 14j
print(a, b)  # Output: (4+5j) (12+14j)

# Complex literals with floats and underscores
c = 1.4 + 2.5j
d = 1_2 + 1_4j
print(c, d)  # Output: (1.4+2.5j) (12+14j)

# ============ String Literals ============
name = 'Alexa'
name1 = "Alexa"
name2 = '"Alexa"'
print(name, name1, name2)  # Output: Alexa Alexa "Alexa"
```

---

## Section 4: Key Takeaways

- **Literals are hardcoded direct constant values** in a program and can be integers, floats, booleans, complex numbers, or strings

- **Use underscores (`_`) within numeric literals** (integers and floats) to improve readability, but never at the start or end

- **Float literals** support decimal points and scientific notation (`E` or `e`)

- **Boolean literals** are only `True` and `False` (case-sensitive)

- **Complex literals** combine real and imaginary parts with a `j` suffix; both parts can be floats or integers

- **Strings** can be enclosed in single, double, or triple quotes; each style has specific use cases, especially regarding embedded quote characters

- **Syntax and name errors** are common pitfalls with literals; understanding error messages helps in correcting them

- **Practice literals and their correct syntax** in environments like Jupyter Notebook to reinforce understanding and error detection

---

---

# Base Conversion

## Section 1: Summary

This lecture focuses on **base conversion functions in Python**, continuing from previous discussions on number systems. It reviews common number systems — decimal (base 10), binary (base 2), octal (base 8), and hexadecimal (base 16) — and relates them to computer systems. 

The core topic is **how Python provides built-in functions to convert decimal integers into binary, octal, and hexadecimal string representations**. The instructor explains that these functions take integer inputs and return strings with specific prefixes indicating the base. 

Practical examples using Python's `bin()`, `oct()`, and `hex()` functions are demonstrated in a Jupyter Notebook environment. The lecture clarifies acceptable input types and highlights that **these functions only accept integers** (including boolean values treated as integers), but not floats. 

Overall, students learn the purpose, usage, and output format of these base conversion functions.

---

## Section 2: Key Concepts and Explanations

### Number Systems Overview

| Number System | Base | Digits Used |
|---------------|------|------------|
| **Decimal** | 10 | 0 to 9 |
| **Binary** | 2 | 0 and 1 |
| **Octal** | 8 | 0 to 7 |
| **Hexadecimal** | 16 | 0 to 9 and letters A to F |

### Base Conversion Functions in Python

Python provides three built-in base conversion functions:

| Function | Converts To | Input Type | Output Type | Prefix in Output |
|----------|------------|-----------|------------|------------------|
| `bin()` | Binary (base 2) | Integer | String | `'0b'` |
| `oct()` | Octal (base 8) | Integer | String | `'0o'` |
| `hex()` | Hexadecimal (base 16) | Integer | String | `'0x'` |

### Important Characteristics

**Input Requirements:**
- All functions accept **only integer inputs**; passing a float raises a `TypeError`
- **Boolean values** are accepted because Python treats `True` as integer `1` and `False` as `0`

**Output Format:**
- Output of these functions is **always a string** including a prefix
- For example, `bin(10)` returns the string `"0b1010"`
- The prefixes (`0b`, `0o`, `0x`) are part of Python's notation for literals of binary, octal, and hexadecimal numbers

**Additional Notes:**
- To convert strings representing numbers in other bases to decimal integers, Python uses the `int()` function with a base parameter (not covered in detail here)
- These are **built-in functions** — ready-made functions that don't need to be defined manually

---

## Section 3: Example Code and Use Cases

### Example 1: Convert Decimal 10 to All Bases

**Code:**
```python
a = 10
s1 = bin(a)
s2 = oct(a)
s3 = hex(a)
print(s1, s2, s3)
```

**Output:** `0b1010 0o12 0xa`

**Explanation:** Converts decimal 10 to:
- Binary: `0b1010`
- Octal: `0o12`
- Hexadecimal: `0xa`
- Output is string with prefixes

### Example 2: Convert Decimal 15 to All Bases

**Code:**
```python
s1 = bin(15)
s2 = oct(15)
s3 = hex(15)
print(s1)  # Output: 0b1111
print(s2)  # Output: 0o17
print(s3)  # Output: 0xf
```

**Explanation:** Converts decimal 15 showing:
- Binary: `0b1111`
- Octal: `0o17`
- Hexadecimal: `0xf` (f represents 15 in hex)

### Example 3: Using Boolean Values as Input

**Code:**
```python
s1 = bin(True)
print(s1)  # Output: 0b1
```

**Explanation:** Boolean `True` is treated as integer 1, converted to binary string `0b1`

### Example 4: Passing a Float Value (Error Case)

**Code:**
```python
s1 = bin(1.0)
```

**Output:** `TypeError: 'float' object cannot be interpreted as an integer`

**Explanation:** Passing a float raises an error since only integers are accepted.

### Example 5: Combined Example with Variable Assignment

**Code:**
```python
a = 10
x1 = bin(a)  # Binary string of 10
x2 = oct(a)  # Octal string of 10
x3 = hex(a)  # Hexadecimal string of 10
print(x1, x2, x3)
```

**Output:** `0b1010 0o12 0xa`

**Explanation:** Assigns conversion results to variables and prints them, useful in applications where base representation is needed.

---

## Section 4: Key Takeaways

- **Python provides built-in functions** `bin()`, `oct()`, and `hex()` to convert decimal integers to binary, octal, and hexadecimal string representations respectively

- **These functions only accept integer inputs**; passing floats results in `TypeError`

- **Boolean values are accepted as integers**: `True` = 1, `False` = 0

- **Output strings** from these functions include base-specific prefixes: `'0b'`, `'0o'`, `'0x'`

- **Base conversion functions always return strings**, not integers

- **Understanding number systems and how Python represents them** is crucial for programming tasks involving different numeral bases

- **These built-in functions provide easy and reliable ways** to convert number bases without manual computation

- **Practice using these conversions** in Python environments like Jupyter Notebook to become comfortable with their syntax and output formats

---

## Conversion Examples Reference Table

| Decimal | Binary | Octal | Hexadecimal |
|---------|--------|-------|-------------|
| 0 | 0b0 | 0o0 | 0x0 |
| 1 | 0b1 | 0o1 | 0x1 |
| 2 | 0b10 | 0o2 | 0x2 |
| 5 | 0b101 | 0o5 | 0x5 |
| 10 | 0b1010 | 0o12 | 0xa |
| 15 | 0b1111 | 0o17 | 0xf |
| 16 | 0b10000 | 0o20 | 0x10 |
| 255 | 0b11111111 | 0o377 | 0xff |
| 256 | 0b100000000 | 0o400 | 0x100 |

---

## Complete Code Example

```python
# ============ Base Conversion Examples ============

# Example 1: Convert 10
print("Number 10:")
print(f"  Binary: {bin(10)}")      # 0b1010
print(f"  Octal: {oct(10)}")        # 0o12
print(f"  Hexadecimal: {hex(10)}")  # 0xa

# Example 2: Convert 15
print("\nNumber 15:")
print(f"  Binary: {bin(15)}")      # 0b1111
print(f"  Octal: {oct(15)}")        # 0o17
print(f"  Hexadecimal: {hex(15)}")  # 0xf

# Example 3: Convert 255
print("\nNumber 255:")
print(f"  Binary: {bin(255)}")      # 0b11111111
print(f"  Octal: {oct(255)}")        # 0o377
print(f"  Hexadecimal: {hex(255)}")  # 0xff

# Example 4: Using variables
num = 100
print(f"\nNumber {num}:")
binary_str = bin(num)
octal_str = oct(num)
hex_str = hex(num)
print(f"  Binary: {binary_str}")       # 0b1100100
print(f"  Octal: {octal_str}")         # 0o144
print(f"  Hexadecimal: {hex_str}")     # 0x64

# Example 5: Boolean values
print("\nBoolean Conversions:")
print(f"  True in binary: {bin(True)}")    # 0b1
print(f"  False in binary: {bin(False)}")  # 0b0
print(f"  True in hex: {hex(True)}")       # 0x1
print(f"  False in hex: {hex(False)}")     # 0x0
```
---
