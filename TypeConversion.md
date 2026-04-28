# Type Conversion Methods in Python

## Overview
Type conversion methods allow converting values between different data types in Python. This document covers key conversion functions based on Python's built-in methods, drawn from educational resources like "25.+Type+Conversion.pdf" and practice notebooks. The intention is to provide a clear, reviseable guide for developers to understand and apply type conversions effectively in Python code.

### Purpose
- Understand how to convert between basic data types (int, float, str, bool, complex).
- Learn base conversions (binary, octal, hexadecimal).
- Avoid common errors and handle exceptions.
- Serve as a reference for Confluence documentation, easily updateable with new examples or notes.

## Binary, Octal, and Hexadecimal Conversions
These methods convert integers to their string representations in different bases. Useful for low-level programming, debugging, or displaying numbers in non-decimal formats.

```python
a = 10
s1 = bin(a)  # Binary: '0b1010'
s2 = oct(a)  # Octal: '0o12'
s3 = hex(a)  # Hexadecimal: '0xa'
print(a, "-", s1, "-", s2, "-", s3)  # Output: 10 - 0b1010 - 0o12 - 0xa
```

**Note:** These methods only accept integers as input. Attempting to pass a float (e.g., `bin(10.5)`) raises a `TypeError`. They return strings prefixed with the base indicator (0b, 0o, 0x).

They also accept boolean values:
```python
binBool = bin(True)   # '0b1'
octBool = oct(False)  # '0o0'
hexBool = hex(True)   # '0x1'
print(binBool, "-", octBool, "-", hexBool)  # Output: 0b1 - 0o0 - 0x1
```

### Common Use Cases
- Displaying memory addresses or bitwise operations.
- Converting for hardware interfaces or network protocols.

### Pitfalls
- Output is a string, not an integer—use `int(s, base)` to convert back.
- No direct float support; convert float to int first.

## Integer Conversion (`int()`)
Converts a value to an integer. Essential for arithmetic operations requiring whole numbers.

- Accepts: float, boolean, string (if valid integer), and base-specified strings.
- Does not accept: complex numbers.
- For strings with different bases, provide the base as the second argument.

```python
# From float (truncates decimal)
floatNumber = 10.5
intNumber = int(floatNumber)  # 10

# From boolean
print(int(True))  # 1
print(int(False))  # 0

# From string
print(int("1"))  # 1
# print(int("10.5"))  # ValueError: invalid literal for int()

# With base (for string representations)
print(int("1010", 2))  # 10 (binary to int)
print(int("12", 8))    # 10 (octal to int)
print(int("A", 16))    # 10 (hexadecimal to int)
```

### Common Use Cases
- Parsing user input from forms or files.
- Converting base strings back to integers.

### Pitfalls
- Strings must represent valid integers; no implicit float handling.
- Base must be between 2 and 36; invalid base raises `ValueError`.

## Float Conversion (`float()`)
Converts a value to a float. Used for decimal arithmetic.

- Accepts: integer, boolean, string (if valid float).
- Does not accept: complex numbers.
- No base conversion support.

```python
i = 10
f = float(i)  # 10.0

print(float(True))   # 1.0
print(float(False))  # 0.0

print(float("10.5"))  # 10.5
print(float("1e2"))   # 100.0 (scientific notation)
# print(float("abc"))  # ValueError
```

### Common Use Cases
- Scientific calculations or financial data.

### Pitfalls
- No complex number support; attempting raises `TypeError`.
- Strings must be valid float literals.

## Boolean Conversion (`bool()`)
Converts any value to a boolean. Crucial for conditional logic.

- Returns `True` for most values.
- Returns `False` for: `False`, `None`, `0`, `0.0`, `""` (empty string), `0j` (zero complex).

```python
# Falsy values
print("0 ->", bool(0))        # False
print("False ->", bool(False)) # False
print("None ->", bool(None))   # False
print("0.0 ->", bool(0.0))     # False
print('"" ->', bool(""))       # False
print("0j ->", bool(0j))       # False

# Truthy values
print("1 ->", bool(1))         # True
print("True ->", bool(True))   # True
print("5.2 ->", bool(5.2))     # True
print("abc ->", bool("abc"))   # True
```

### Common Use Cases
- Checking if variables are set or non-zero.

### Pitfalls
- Empty containers (lists, dicts) are truthy; only empty strings/lists are falsy.

## Complex Conversion (`complex()`)
Converts a value to a complex number. For mathematical computations involving imaginary parts.

- Accepts any value; imaginary part defaults to 0.
- For strings, must be in "a+bj" or "a-bj" format.

```python
i = 10
c = complex(i)  # (10+0j)

print(complex(True))     # (1+0j)
print(complex(10.5))     # (10.5+0j)
print(complex("5+6j"))   # (5+6j)
# print(complex("abc"))  # ValueError
```

### Common Use Cases
- Engineering or physics simulations.

### Pitfalls
- String format must include 'j' for imaginary; no spaces allowed.

## String Conversion (`str()`)
Converts any value to its string representation. For output or serialization.

- Accepts all types.
- No base conversion, but can display base strings.

```python
i = 10
s = str(i)  # '10'

print(str(True))      # 'True'
print(str(10.5))      # '10.5'
print(str(5+6j))      # '(5+6j)'

# Displaying base conversions
print(str(bin(2)))   # '0b10'
print(str(oct(2)))   # '0o2'
print(str(hex(2)))   # '0x2'
```

### Common Use Cases
- Logging, printing, or JSON serialization.

### Pitfalls
- Complex numbers display with parentheses; ensure formatting if needed.

## Key Notes
- Only `int()` supports base conversions.
- Complex numbers cannot be converted to int or float.
- Boolean conversion is straightforward but important for conditional logic.
- Always handle potential `ValueError` or `TypeError` exceptions in production code.

## Best Practices
- Use try-except for conversions from user input.
- Prefer explicit conversions over implicit ones for clarity.
- Test edge cases (e.g., empty strings, zero values).

## References
- Python official documentation: https://docs.python.org/3/library/functions.html
