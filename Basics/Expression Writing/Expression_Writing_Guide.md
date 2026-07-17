# Expression Writing in Python

## Overview

This guide covers writing and evaluating mathematical expressions in Python. Expressions are combinations of values, variables, and operators that can be evaluated to produce a result.

## Key Concepts

### What is an Expression?

An **expression** is a combination of:
- **Operands**: Variables or values (e.g., numbers, variables)
- **Operators**: Symbols that perform operations (arithmetic, logical, etc.)

Expressions evaluate to a single value when executed.

### Arithmetic Operators

The following operators are used for mathematical calculations:

| Operator | Name | Example | Result |
|----------|------|---------|--------|
| `+` | Addition | `5 + 3` | `8` |
| `-` | Subtraction | `5 - 3` | `2` |
| `*` | Multiplication | `5 * 3` | `15` |
| `/` | Division | `6 / 2` | `3.0` |
| `//` | Floor Division | `7 // 2` | `3` |
| `%` | Modulus (Remainder) | `7 % 2` | `1` |
| `**` | Exponentiation | `2 ** 3` | `8` |

### Operator Precedence

When multiple operators are used in an expression, Python follows the **BODMAS/PEMDAS** rule:

1. **B**rackets / **P**arentheses `()`
2. **O**rders/**E**xponents `**`
3. **D**ivision `/`, `//` and **M**ultiplication `*`
4. **A**ddition `+` and **S**ubtraction `-`

**Example:**
```python
result = 2 + 3 * 4  # Result is 14 (not 20)
# Because: 3 * 4 = 12, then 2 + 12 = 14
```

---

## Practical Examples

### 1. Area of a Circle

Calculate the area of a circle using the formula: **A = πr²**

```python
import math

r = int(input("Enter the radius of the circle: "))
area = math.pi * (r**2)
print("The radius of circle is", r, "and area is: ", area)
```

**Example:**
- Input: `r = 5`
- Output: `The radius of circle is 5 and area is: 78.53981633974483`

---

### 2. Area of a Trapezium

Calculate the area of a trapezium using the formula: **A = ((a + b) × h) / 2**

Where:
- `a` = shortest parallel side
- `b` = longest parallel side
- `h` = height

```python
a = int(input("Enter the shortest length of the trapezium: "))
b = int(input("Enter the longest length of the trapezium: "))
h = int(input("Enter the height of the trapezium: "))
area = (a + b) * h / 2
print("The area of the trapezium is: ", area)
```

**Example:**
- Input: `a = 3, b = 5, h = 4`
- Output: `The area of the trapezium is: 16.0`

---

### 3. Surface Area of a Cuboid

Calculate the surface area of a cuboid using the formula: **SA = 2((l×b) + (b×h) + (h×l))**

**Visual Representation of a Cuboid:**

```
        _______________ 
       /|             /|
      / |            / |
     /  |           /  |
    /___|__________/   |
    |   |         |    |
    |   |___h_____|____|
    |  /          |   /
    | /l          |  / b
    |/            | /
    |_____________|/
```

Where:
- `l` = length (width of the base)
- `b` = breadth (depth of the base)  
- `h` = height (vertical dimension)

**The 6 faces of a cuboid:**
- **2 × Top & Bottom faces** = 2 × (l × b)
- **2 × Front & Back faces** = 2 × (l × h)
- **2 × Left & Right faces** = 2 × (b × h)
- **Total Surface Area** = 2((l×b) + (l×h) + (b×h))

```python
l = 5
b = 10
h = 7
area = 2 * ((l*b) + (b*h) + (h*l))
print("The surface area of the cuboid is: ", area)
```

**Example:**
- `l = 5, b = 10, h = 7`
- Calculation: `2 × ((5×10) + (10×7) + (7×5)) = 2 × (50 + 70 + 35) = 2 × 155 = 310`
- Output: `The surface area of the cuboid is: 310`

---

### 4. Solving a Quadratic Equation

A **quadratic equation** has the form: **ax² + bx + c = 0**

The solution is found using the quadratic formula:

**x = (-b ± √(b² - 4ac)) / (2a)**

Where:
- `a`, `b`, `c` are constants
- The **discriminant** is: **b² - 4ac**
  - If discriminant > 0: Two real solutions
  - If discriminant = 0: One real solution
  - If discriminant < 0: No real solutions

```python
import math

# Solving: 2x² - 7x + 3 = 0
a = 2
b = -7
c = 3

discriminant = b**2 - 4*a*c
x1 = (-b + math.sqrt(discriminant)) / (2*a)
x2 = (-b - math.sqrt(discriminant)) / (2*a)

print("The solutions of the quadratic equation are:", x1, "and", x2)
```

**Example:**
- For `2x² - 7x + 3 = 0`
- Discriminant: `(-7)² - 4(2)(3) = 49 - 24 = 25`
- x₁ = (7 + 5) / 4 = `3.0`
- x₂ = (7 - 5) / 4 = `0.5`
- Output: `The solutions of the quadratic equation are: 3.0 and 0.5`

---

## Key Takeaways

✅ **Use parentheses** to make expressions clear and override default precedence
✅ **Follow BODMAS/PEMDAS** rule for correct evaluation
✅ **Use meaningful variable names** to improve code readability
✅ **Import modules** like `math` for advanced mathematical functions
✅ **Test your expressions** with multiple inputs to verify correctness

---

## Related Resources

- **Challenge: Expressions Using Expressions** - `30.+Challenges+using+Expression.pdf`
- **Challenge: Surface Area of Cuboid** - `32.+Challenge-Surface+area+of+Cuboid.pdf`
- **Challenge: Quadratic Equations** - `33.+Challenge-Quadratic+Equations.pdf`
- **Reference Diagrams:**
  - Arithmetic Operators
  - All Python Operators
  - Operator Precedence

---

**Last Updated:** May 9, 2026

