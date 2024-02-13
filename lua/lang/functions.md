# lua functions



### Typing parameters to help with intellisense & knowing what arguments are needed without lookat the method signature
```lua
--- method signature can have comments, but they have no syntactical importance
--- to type the parameters, use param, don't think they are enforced
--- @param var1 integer
--- @param var2 integer
--- @param var3 integer
function(--[[required]]var1, --[[optional]]var2,  --[[optional]]var3)
    var2 = var2 or 6 --default value
    var3 = var3 or 0 --default value
    --Do something with the inputs
end
```


### Ctrlr UI -> Lua Calls likely use modules, so if there are multiple public methods, they should only be overloaded methods
- overloading methods with different types provides flexibity from the UI & reduces the need for a new 'module'/'file'
- Not 100% whether each node on the Ctrlr ValueTree is an actually module, 
  - or is simply a UI convention to provide Panel Developer with a cleaner IDE workspace
  - It also allows for nesting things visually to keep organized when line count is high
- also not sure if functions specified as local are truly local
  - if Ctlr simply concatenates all lua code (that's really stored in the XML file), then using `local` with functions theoretically doesn nothing
  - this also means that one can put functions anywhere in the Lue Editor ValueTree
    - and can cross-pollinate a 'Tree Node' with any number of functions for any purpose
    - BUT also could invited confusion if method names are reused in different `Tree Nodes`
      - as there's no way to anticipate which is called and can't identify them without manually traversing the entire Value Tree
```lua

--- start timer with specified seconds
--- @param seconds integer
function sendStartTimer(seconds)
    imaFakeVar = seconds
end

--- start timer with specified seconds as a string
--- @param seconds string
function sendStartTimer(seconds)
    imaFakeVar = tonumber(seconds)
end

```

### Object Oriented Programming is possible, but it isn't technically OOP

1. Create tables with propertes
2. use `setmetatable({}, ClassName)` to form a MetaTable that offers something like a 'Super Named Array'
3. BaseClass(`function`) Should use `ClassName:new()` as the instantion function name
4. ChildClass() then instantiates the Class using `objectname = ClassName:new()`
5. Implementing statements should follow the following conventions:
  - instate Object from Class as: object = `ClassName:new()`
  - access object property with: `object.property = "a value"`
  - call object method using: `objectname:calling()`
  
  
```lua
-- Faux Object Oriented Programming

--- declare table
Animal = {height = 0, weight = 0, name = "No Name"}

--- extend with function
function Animal:new(height, weight, name)
    setmetatable({}, Animal)

    self.height = height
    self.weight = weight
    self.name = name

    return self
end

--- colon in function signature
function Animal:toString()
    animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall",self.name, self.weight, self.height)
    print(animalStr)
end

-- object instantiation with ':'
monkey = Animal:new(60,100,"Monkey") -- instantiate with ':'
-- object property access wth "."
Animal.toString(monkey)  -- calling methods using classname.methodname(instantiated object)
-- object method called with ':'
print(monkey:toString()) -- calling method using ':'
-- object method can alco be called with '.'
print(monkey.name)       -- accessing property with '.'

--- declare table
Cat = Animal:new()

--- extend with function with additional properties
function Cat:new(height, weight, name, color)
    setmetatable({}, Cat)

    self.height = height
    self.weight = weight
    self.name = name
    self.color = color

    return self
end

--- extend with function
function Cat:toString()
    animalStr = string.format("%s is %s and weighs %.1f lbs, is %.1f in tall", self.name, self.color, self.weight, self.height)
    print(animalStr)
end

--- instantiate with ':'
cookie = Cat:new(12, 6, "CookieMonster", "Black" )
--- call method using ':'
print(cookie:toString())
--- access property using '.'
cookie.weight = 50
--- call method by passing table to 'Class' also syntatically the same(there might be nuances between the two)
print(Cat.toString(cookie))

```


```lua
--- a means to implement optional parameters
function(--[[required]]var1, --[[optional]]var2,  --[[optional]]var3)
    var2 = var2 or 6 --default value
    var3 = var3 or 0 --default value
    --Do something with the inputs
end

--- not as succinct, but does the same thing
function(--[[required]]var1, --[[optional]]var2,  --[[optional]]var3)
    if not var2 then
       var2 = 6--default value
    end
    if not var3 then
       var3 = 0 --default value
    end
    --Do something with the inputs
end
```

- In your code you can assign default values using the or logical operator like in Ragnar’s example. A lot of Lua libraries use LDoc 196 to write and automatically generate documentation, and optional arguments are documented like this:
```lua
--- Three dashes indicate the beginning of a function or field documented
-- using the LDoc format
-- @param var1 The first argument
-- @param[opt=6] var2 The second argument
-- @param[opt=0] var3 The third argument
-- @return Max The maximum value of var1 and var2
-- @return Min The minimum value of var2 and var3
function foobar(var1, var2, var3)
	var2 = var2 or 6
	var3 = var3 or 0
	return math.max(var1, var2), math.min(var2, var3)
end
```