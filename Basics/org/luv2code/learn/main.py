# This is a sample Python script.
import self

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.

a = 20
b=20
print(a + b)


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press ⌘F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print('main.py is being executed')
    print_hi('PyCharm')


class Main:
    def print_hi(self, name):
        # Use a breakpoint in the code line below to debug your script.
        print(f'Hi2, {name}')
    # Press ⌘F8 to toggle the breakpoint.
    def __init__(self):
        self.print_hi('PyCharm2')

    if __name__ == '__main__':
        print('main.py2 is being executed')
        print_hi(self, 'PyCharm3')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
