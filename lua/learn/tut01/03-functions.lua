#!/usr/bin/lua

--- print a value
--- @param value string
--- @return string
function printName(value)
    print(value)
    return value
end

printName("TheBoss")


--- print a value and integer
--- @param valueString string
--- @param valueInt integer
--- @return string
function printNameAge(valueString, valueInt)
    local message = "I am " .. valueString .. ". My IQ is " .. valueInt
    print(message)
    return message
end

printNameAge("TheBoss", 155)
print(message) -- message is nil because defined as local in function