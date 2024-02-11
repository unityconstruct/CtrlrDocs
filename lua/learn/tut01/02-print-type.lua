#!/usr/bin/lua

apple = 5
banana = "5"
print(apple)
print(type(apple))
print(banana)
print(type(banana))

print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string
print(type(type(a)))        --> string

