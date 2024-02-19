# Classes for Patch Storage
 >Godlike Productions edited this page on Jan 6, 2022 · 1 revision

- This is the method that I've pretty much standardized for storing patches with associated information and banks of patches.
- I use these for librarians, for example.
```lua
-- Intialize Classes
defaultSysex = {0xf0,0x00,0x00,0x2f,0x03,0x02,0x00,0x00,0x00,0x00,0x00,0x09,0x00,0x0c,0x00,0x00,0x00,0x00,0x0b,0x02,0x06,0x02,0x0f,0x0f,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0f,0x0f,0x00,0x00,0x09,0x0c,0x00,0x00,0x00,0x00,0x08,0x08,0x00,0x00,0x02,0x0c,0x01,0x07,0x0f,0x07,0xf7} -- This particular patch is for a Jupiter 8
defaultSysexMB = MemoryBlock()
defaultSysexMB:createFromTable(defaultSysex)
-- Initialize table structure. Category only allows a single value currently.  Maybe redefine as a table. This is difficult to implement. In practice pulling a value from a table, of a table, of a table, doesn't work.
patch = {
    name = "No Name", 
    author = "Default Author", 
    category = "None", 
    sysex = defaultSysexMB
    }

function patch:new (o)
    o = o or {} -- create object if user does not provide one
    setmetatable(o, self) -- define prototype
    self.__index = self
    return o
end

patchBank = {} -- each index is the patch ID. As we add patches we should call them as patchBank[1] = patch:new(). We can then access data by patchBank[1].name etc.
function patchBank:new(o)
    o = o or {} -- create object if user does not provide one
    setmetatable(o,self) -- define prototype
    self.__index = self
    return o
end

synthBank = patchBank:new() -- create the Synth Bank.
```
- Elements within the patchbank can be accessed and copied like this
```lua
synthBank[i] = synthBank2[j]
```

- You have full access to elements like
```lua
tempName = synthBank[i].name
tempAuthor = synthBank[i].author
tempCategory = synthBank[i].category
tempSysex = synthBank[i].sysex
```
- I strip sysex headers off during import and only store the data segment of the sysex. I rebuild the header when I send it to the synth. The reason for this is because the header normally contains the destination bank and program number, and we want that to be dynamically assigned.
- To put a patch into patchbank use
```
patchBank[1] = patch:new()
```
You can also go 
```lua
patchBank[q] = patch:new({name = "whatever name", author = "something here"}) 
```
to overwrite the prototype.

- If you don't supply name, author, category or sysex, it will use whatever you define in the prototype.
- Basically patchbank is a class containing patches. Patch is a class with name, category, author and sysex.
- The purpose of doing this is to keep the large structures organized, so patchBank[i] automatically refers to all of the associated names, authors etc, rather than having to maintain multiple tables.
- It also makes moving patches between banks trivial.