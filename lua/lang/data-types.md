# data types

- luaconf.h MIGHT provde a means to define an integer in lua
If you want to only deal with integers you could always #define LUA_NUMBER int in luaconf.h.

DataTypes
- number
- string
- table
- metatable
- __M
- __?


- lua_number2int : convert lua_Number to int.
- lua_number2integer : lua_Number to lua-Integer


### tables


```
Your issue is not with self.colour not being a table, it's with this line

prevColor = love.graphics.getColor()
When you do that, prevColor is only getting one of the four returned values. The solution to this is to enclose the function call in a table, so that all 4 values are kept. (Like what @EgorSkriptunoff said)

prevColor = {love.graphics.getColor()}
As for your question: Use assert and type to check the variable type

assert(type(colour)=="table", "-Error message goes here-")
Do note however, assert will throw an error which will bring up the blue love2d screen and stop your program from running.
```