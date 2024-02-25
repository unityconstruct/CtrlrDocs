#!/usr/bin/lua

-- example of function throwing on erro
function foo()
    local success = 1
    local fail = 0
    local result = success

    if result ~= success then
        error("Failure!",error({code=fail}))
    else
        print("Success!")
    end
end

-- example of pcall and passing function NAME
local result, err = pcall(foo)
if result then
print(result)
else
print(err.code)
end

if result then 
print("Result: Success")
else
print("Result: Fail")
end


-- example using anonymous function
local stat, er = pcall(function() error({code=121}) end)
print(er.code)

  
