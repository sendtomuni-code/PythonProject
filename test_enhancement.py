def calculate_total(items):
    """Calculate sum of item prices."""
    return sum(item['price'] for item in items)
def apply_discount(total, discount_percent):
    """Apply discount to total amount."""
    return total * (1 - discount_percent / 100)
def format_currency(amount):
    """Format amount as currency."""
    return f"${amount:.2f}"
if __name__ == "__main__":
    test_items = [
        {'name': 'Item1', 'price': 10.50},
        {'name': 'Item2', 'price': 25.00}
    ]
    total = calculate_total(test_items)
    print(f"Total: {format_currency(total)}")
