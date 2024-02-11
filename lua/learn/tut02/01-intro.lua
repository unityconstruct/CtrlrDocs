#!/usr/bin/lua
name = "TheBoss"


function p(value)
    io.write(value,"\n")
end

io.write("io.write stuff","\n")
io.write("Name: [" .. name .. "] length:[" .. #name .. "]","\n")

-- big integer
bigNum = 92340918234091234581234 + 1
print(bigNum)
-- floating point
floatPrecision = 1.99999999999999 + 0.000000000004
print(floatPrecision)

longSring = [[line1
line2
line3
]]
print(longSring)

-- boolean
valueBool = true
print(type(valueBool))

p("myprint fucn")