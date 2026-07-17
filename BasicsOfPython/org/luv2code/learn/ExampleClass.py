
from BasicsOfPython.org.luv2code.learn.main import Main
from BasicsOfPython.org.luv2code.learn import First

class ExampleClass:
    def __init__(self):
        print('ExampleClass constructor called')
        self.main = Main()  # Initialize main object
        self.greet()

    def greet(self):
        print('Hello world')
        self.main.print_hi('Example')

if __name__ == '__main__':
    print('ExampleClass is being executed')
    e = ExampleClass()
