# Arithmetic Assignment Operators and String Operations

## Arithmetic Assignment Operators

Arithmetic assignment operators allow you to perform an arithmetic operation and assign the result to the variable in one step.

### Example

```python
a = 5
a = a + 3
print(a)  # Output: 8
a += 3
print(a)  # Output: 11
```


## String Concatenation and Repetition

Strings support concatenation using the `+` operator and repetition using the `*` operator.

### Examples

```python
print("Hello " + "World")  # Output: Hello World
```

Attempting to concatenate a string with a non-string will raise a TypeError:

```python
print("Hello " + 3)  # TypeError: can only concatenate str (not "int") to str
```

To concatenate, convert the number to string:

```python
print("Hello " + str(3))  # Output: Hello 3
```

Repetition:

```python
print("Hello " * 3)  # Output: Hello Hello Hello
print("Hello " * 3 + "World")  # Output: Hello Hello Hello World
```

Repetition with a float will raise a TypeError:

```python
print("Hello " * 3.5)  # TypeError: can't multiply sequence by non-int of type 'float'
```

## Supported Data Types for Arithmetic Operations

The following images illustrate which arithmetic operations are supported for different data types:

### Boolean
![Boolean supported Arithmetic Operation](Resource/Boolean%20supported%20Airthmetic%20Operation.png)

### Complex Numbers
![Complex number supported data type](Resource/complex%20number%20supported%20data%20type.png)

### Float
![Float supported arithmetic operator](Resource/Float%20supported%20airthmetic%20operator.png)

### String
![String Datatype supported arithmetic Operation](Resource/String%20Datatype%20supported%20airthmetic%20Operation.png)
