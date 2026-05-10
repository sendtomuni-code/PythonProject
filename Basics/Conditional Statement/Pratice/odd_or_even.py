#!/usr/bin/env python3
"""
Program to check if a number is odd or even
"""

# Get input from user
num = int(input("Enter a number: "))

# Check if the number is even or odd
if num % 2 == 0:
    print(f"{num} is an even number")
else:
    print(f"{num} is an odd number")

