# Initialize MemoryBlock
>Damien S edited this page on Mar 14, 2023 · 4 revisions
Here is a method added to the class MemoryBlock() for initialising a MemoryBlock (usually with zeroes). The overloaded JUCE function m=MemoryBlock(20) is not implemented or bound to lua (at least in version 5.3.201), so normally one would write something like : m=MemoryBlock("00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00") which is a bit cumbersome or use createFromTable
```lua
local t={}
for i=1,20 do
t[i]=0
end
m:createFromTable(t)
```
but this following way is maybe a bit more convenient;

### Edit: 03/14/2023

Newer compilations of Ctrlr now support various MemoryBlock() constructors, so this new code accounts for that:
```lua
 function MemoryBlock:initialise(size) -- initialise a Memory Block with data if necessary
    --[[ 
    Versions 5.3.* do not support initialisation of MemoryBlock() with JUCE constructor:
    MemoryBlock (const size_t initialSize, bool initialiseToZero=false)
    ]]
        local major, minor = utils.getVersionMajor(), utils.getVersionMinor()
        major = tonumber(major)
        minor = tonumber(minor)
        if major > 4 then
            if minor > 3 then
                local tmp = MemoryBlock(size, true) -- use luabind JUCE constructor
                self:loadFromHexString(tmp:toHexString(1))
            else
                local t = {}
                for i = 1, size do
                    t[i] = 0
                end
                self:createFromTable(t) -- make our own constructor in lua
            end
        end -- minor looking for 5.3.201/5.3.198
    end -- major > = 5
end
```
SRC : https://github.com/RomanKubiak/ctrlr/discussions/483

