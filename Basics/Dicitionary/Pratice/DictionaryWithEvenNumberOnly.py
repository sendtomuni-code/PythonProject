l1 = [(1, 'ONE'), (2, 'TWO'), (3, 'THREE'), (4, 'FOUR')]

d1 = {x:y for x,y in l1 if x%2 == 0}

print(d1)