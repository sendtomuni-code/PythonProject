#!/usr/bin/env python3
"""
Program to convert a number to month name
"""

# Method 1: Using a list
def number_to_month_list(num):
    """Convert number (1-12) to month name using a list"""
    months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]

    if 1 <= num <= 12:
        return months[num - 1]
    else:
        return "Invalid month number"

# Method 2: Using a dictionary
def number_to_month_dict(num):
    """Convert number (1-12) to month name using a dictionary"""
    months = {
        1: "January", 2: "February", 3: "March", 4: "April",
        5: "May", 6: "June", 7: "July", 8: "August",
        9: "September", 10: "October", 11: "November", 12: "December"
    }

    return months.get(num, "Invalid month number")

# Method 3: Using the calendar module
import calendar

def number_to_month_calendar(num):
    """Convert number (1-12) to month name using calendar module"""
    if 1 <= num <= 12:
        return calendar.month_name[num]
    else:
        return "Invalid month number"

# Main program
if __name__ == "__main__":
    print("=== Convert Number to Month Name ===\n")

    # Get input from user
    try:
        month_num = int(input("Enter a number (1-12): "))

        # Using Method 1 (List)
        result = number_to_month_list(month_num)
        print(f"Using List: {month_num} → {result}")

        # Using Method 2 (Dictionary)
        result = number_to_month_dict(month_num)
        print(f"Using Dictionary: {month_num} → {result}")

        # Using Method 3 (Calendar module)
        result = number_to_month_calendar(month_num)
        print(f"Using Calendar module: {month_num} → {result}")

    except ValueError:
        print("Error: Please enter a valid number")

