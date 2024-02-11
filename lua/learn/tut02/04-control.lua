#!/usr/bin/lua
value = true
if value then
    print(true)
elseif value ~= true then
    print(false)
else 
    print("nil")
end