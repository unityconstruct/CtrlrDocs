#!/usr/bin/lua

apple = 5
banana = 10

if apple == 8 then
    print("apple = 8? " .. "true")
else
    print("apple = 8? " .. "false")
end


--- test value is equal
---@param value number actual value
---@param valueTest number test value
function testEquality(value, valueTest)

    if value == valueTest then
        print(value .. " = " .. valueTest .. " : true")
    else
        print(value .. " = " .. valueTest .. " : false")
    end
end

--- test value is not equal
---@param value number actual value
---@param valueTest number test value
function testInEquality(value, valueTest)

    if value ~= valueTest then
        print(value .. " ~= " .. valueTest .. " : true")
    else
        print(value .. " ~= " .. valueTest .. " : false")
    end
end

--- test value is greater than
---@param value number actual value
---@param valueTest number test value
function testGreaterThanOrEqual(value, valueTest)

    if value >= valueTest then
        print(value .. " >= " .. valueTest .. " : true")
    else
        print(value .. " >= " .. valueTest .. " : false")
    end
end

--- test value is less than
---@param value number actual value
---@param valueTest number test value
function testLessThanOrEqual(value, valueTest)

    if value <= valueTest then
        print(value .. " <= " .. valueTest .. " : true")
    else
        print(value .. " <= " .. valueTest .. " : false")
    end
end

--- test boolean equality
--- @param value boolean actual boolean
--- @param valueTest boolean test boolean
function testBoolean(value, valueTest)

    if value == valueTest then
        print(tostring(value) .. " is " .. tostring(valueTest) .. " : true")
    else
        print(tostring(value) .. " is " .. tostring(valueTest) .. " : false")
    end
end


testEquality(5,5)
testEquality(5,6)
testInEquality(5,5)
testInEquality(5,6)
testGreaterThanOrEqual(5,5)
testGreaterThanOrEqual(5,6)
testLessThanOrEqual(5,5)
testLessThanOrEqual(6,5)
testBoolean(true,true)
testBoolean(true,false)


--[[

]]--

apple = 5
banana = 6

--- test AND
function testAND()
    flag = false
    if apple == 5 and banana == 6 then
        flag = true
    end
    print("AND: " .. tostring(flag))
end

--- test OR
function testOR()
    flag = false
    if apple == 5 or banana == 6 then
        flag = true
    end
    print("OR: " .. tostring(flag))
end

--- test ANDNOT
function testANDNOT()
    flag = false
    if apple == 5 and not banana == 6 then
        flag = true
    end
    print("ANDNOT: " .. tostring(flag))
end

testAND()
testOR()
testANDNOT()