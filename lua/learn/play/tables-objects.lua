#!/usr/bin/lua

local user = {
    name = "myName",
    age = 20--[[,
    salutation = function (self)
        print("My name is " .. user.name .. " and I'm " .. user.age)
    }]]--
}

function user.hello()
    print("My name is " .. user.name .. " and I'm " .. user.age)
end

user.hello()