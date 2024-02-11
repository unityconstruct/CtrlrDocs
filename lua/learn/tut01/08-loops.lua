#!/usr/bin/lua

function printy(value)
    print("counter: "..tostring(value))
end

counter = 1
max = 5

--- while loop
---@param counter number start value
---@param max number stop value
function whileLoop(counter, max)
    while counter < max do
        printy("whileTrueLoop: "..counter)
        counter = counter + 1
        
    end
end





--- repeat loop
---@param counter number start value
---@param max number stop value
function repeatLoop(counter, max)
    repeat
        printy("repeatLoop: "..counter)
        counter = counter + 1
    until counter < max
end




--- for loop
---@param counter number start value
---@param max number stop value
---@param increment number
function forLoop(counter, max, increment)
    for counter = counter, max, increment do
        printy("for loop counter: [" .. counter .. "]: max: [" .. max .. "]: increment: [" .. increment .. "]")
    end
end


--- infinite while true loop
--- runs infinitely
---@param counter number start value
---@param max number stop value
function whileTrueLoop(counter, max)
    while true do
        printy("whileTrueLoop: "..counter)
        counter = counter + 1
    end
end

--- not infinite until true loop
--- runs only once
---@param counter number start value
---@param max number stop value
function whileTrueLoop(counter, max)
    repeat
        printy(counter)
        counter = counter + 1
    until true
end

whileLoop(1,5)
repeatLoop(1,5)
forLoop(1,5,1)