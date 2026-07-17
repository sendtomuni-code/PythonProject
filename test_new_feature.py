# New feature implementation
def calculate_sum(numbers):
    """Calculate sum of numbers."""
    return sum(numbers)
def calculate_average(numbers):
    """Calculate average of numbers."""
    return sum(numbers) / len(numbers) if numbers else 0
if __name__ == "__main__":
    test_data = [1, 2, 3, 4, 5]
    print(f"Sum: {calculate_sum(test_data)}")
    print(f"Average: {calculate_average(test_data)}")
