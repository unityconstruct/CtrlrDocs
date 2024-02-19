# Calling Protected Functions
> Damien S edited this page on Jan 18 · 4 revisions
Here is a very handy link to allow us to make our panels less likely to crash and more importantly less likely to crash the host.

https://www.tutorialspoint.com/lua/lua_error_handling.htm

I think we should use assert and pcall a lot more often in our code. LUA doesn't seem to do everything in protected mode by default, and VST's don't seem to run in protected mode within VST hosts. So an error in our code can crash our host.

pcall allows any LUA function to run in protected mode and allows us to throw custom errors, so as a worst case, it should just stop the function from running without crashing your LUA instance and more importantly the host.

In you LUA editor just run the PCALL function like this:
```lua
doSomething = function()
    if pcall(doSomethingTry) then
        `console("Success")`
    else
        console("Fail")
    end
end

doSomethingTry = function()
-- something smart
end
```

