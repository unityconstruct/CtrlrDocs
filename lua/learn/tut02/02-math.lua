#!/usr/bin/lua

print("math.floor(2.345) : " .. math.floor(2.345))
print("math.ceil(2.345) : " .. math.ceil(2.345))
print("math.max(2,3) : " .. math.max(2,3))
print("math.min(2,3) : " .. math.min(2,3))
print("math.pow(2,3) : " .. math.pow(2,3))
print("math.sqrt(64) : " .. math.sqrt(64))


print("math.random() : " .. math.random() )
print("math.random(10) : " .. math.random(10) )
print("math.random(100) : " .. math.random(100) )
print("math.random(55,100) : " .. math.random(55,100) )
--print("math.randomseed(os.time()) : " .. math.randomseed(os.time()) )
print(os.time())

value = os.time()
print("time: " .. value)
valueRandom = math.randomseed(value)
-- print("math.randomseed: " .. valueRandom )

print(math.randomseed())

-- value = math.randomseed(tonumber(os.time()),0)
-- print ("asdf" .. value)
-- print("ostime: " .. math.randomseed(os.time()) )



--print("asdf: " .. tostring(math.randomseed(os.time())))
--print(math.randomseed())

print(string.format("Pi = %.10f", math.pi))

