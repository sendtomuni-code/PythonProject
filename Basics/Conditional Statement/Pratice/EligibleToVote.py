#!/usr/bin/env python3
a = int(input("Enter Your age:"))

if a >= 18:
    print("You are eligible to vote")
    print("You are casting your vote from " + str(a-18) + " Years" )
else:
    print("You are not eligible to vote")
    print("You can cast your vote in " + str(18-a) + " Years" )
