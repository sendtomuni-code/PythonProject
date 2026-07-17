# Utility functions
def validate_input(data):
    """Validate input data."""
    return data is not None and len(data) > 0
def format_output(result):
    """Format output result."""
    return f"Result: {result}"
