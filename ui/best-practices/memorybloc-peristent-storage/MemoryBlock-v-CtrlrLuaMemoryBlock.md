# MemoryBlock v CtrlrLuaMemoryBlock

- Is this related to v5.3 cf v6.x?
- In 5.x

```lua
>>> myB = CtrlrLuaMemoryBlock(SINGLE_SYSEX_STORAGE_SIZE, true)
>>> myB[1] = 10
>>> myB[2] = 20
>>> myB[3] = 30
>>> console(""..tonumber(myB[1]))
10
>>> console(""..tonumber(myB[2]))
20
>>> console(""..tonumber(myB[3]))
30
>>> myB1 = MemoryBlock(SINGLE_SYSEX_STORAGE_SIZE, true)
ERROR: No matching overload found, candidates:
void __init(luabind::argument const&,String const&)
void __init(luabind::argument const&,luabind::object const&)
void __init(luabind::argument const&,JMemoryBlock const&)
void __init(luabind::argument const&,custom [unsigned __int64] const,bool)
void __init(luabind::argument const&)
```

 What is the proper way to create a memory block on 5.3 please?

# May 8, 2020 at 4:20 am#118259

dnaldoog
Here are a few constructors:

```lua
HexString
empty *two examples
Lua table
mB=MemoryBlock(“0a 14 1e”)
console(String(mB:getSize()))
console(String(“tohex”..mB:toHexString(1)))

mB=MemoryBlock()
mB:loadFromHexString(string.format(“%.2X”,10))
mB:append(MemoryBlock(“14”))
mB:append(MemoryBlock({0x1e}))
console(String(mB:getSize()))
console(String(mB:toHexString(1)))

t={10,20,30}
mB=MemoryBlock()
mB:createFromTable(t)
console(String(mB:getSize()))
console(String(mB:toHexString(1)))

mB=MemoryBlock({10,20,30})
console(String(mB:getSize()))
console(String(mB:toHexString(1)))
```

# May 9, 2020 at 9:47 am#118269

goodweather

- Interesting about CtrlrLuaMemoryBlock(). Was not aware of that one but I’m only using 5.3.201
- You will find the available functions in the Juce API documentation at
- https://docs.juce.com/master/classes.html
- Btw, this is valid for many objects used in Ctrlr. First look in Juce API then pray if they have been implemented (bound) in Ctrlr. Most are.
- My most used commands are:

```lua
-- memory block creation
ProgramFileData = MemoryBlock()
-- memory block copy to a new one
mbName = MemoryBlock(mbNameEmpty)
-- copy a memory block into another one
LoadedProgramData:copyFrom (mbName, 465, 11)
-- size check
ProgramFileData:getSize()
-- Filling amemory block from a file
file:loadFileAsData(ProgramFileData)
-- extracting single byte
LoadedProgramData:getByte(6)
-- extracting range of bytes
LoadedProgramData:getRange(440,15)
-- setting a byte
LoadedProgramData:setByte(6, modOsc1Tune:getModulatorValue())
```

- What is not working (bad implementation?) is to create a memory block containing predefined data (by default a memory block is empty).
- So, to achieve this, I pre-define memory blocks like

```lua
mbNameEmpty = MemoryBlock ({0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00})
```

- Then I use it to fill the memory block I’m using

```lua
mbName = MemoryBlock(mbNameEmpty)
```

They are really great and easy to use for all your file manipulations

# May 10, 2020 at 5:39 pm#118300

shooking

- thanks so this is what I did to convert from what appeared to work in 6.x to 5.3.201
- I really appreciate your assistance -- I was finally able to create bpanelz based on my K1r editor and upload it to my Sourceforge site, and downloaded to new PC, with 5.3.201 installed it unpacked and all the images etc plus importantly the LUA code was there!!!
- Now to sort out the means channel in Ctrlr — sure I think you realize I know what a midi channel is but more like how the Ctrlr is wired internally 
- I already created a post on that and once I find out I will repost.

Best regards
Steve

```lua
function dumpSingleBlockIndividually(ch, bias)
    -- here we have read a multiBlock into our local buffers
    -- if you send the whole block to the K1r it chokes.
    -- so instead we create the sysex necessary to send as individuals.
    for i = 0, 31 do
        addDelayMS(125)
		console("i "..i)
        
--[[
	this worked on 6.x but not on 5.3
        local sysex = string.format("F0 40 %02x 20 00 03 00 %02x ",ch, i + bias)
        sysex=sysex..g_singlePatch:getRange(0, g_singlePatch:getSize() - 1):toHexString(1)
        
        local checksum = 0xA5
        for j=0, g_singlePatch:getSize()-1 do
            checksum = checksum + g_singlePatch:getByte(j)
        end

--        console("checksum"..checksum)
        checksum = BitAND(checksum, 127)
        console("checksum"..checksum)
        sysex = sysex..string.format(" %02x F7",checksum)
--        console(""..sysex)
--]]
		mb =MemoryBlock()
		mb:loadFromHexString( string.format("F0 40 %02x 20 00 03 00 %02x ",ch, i + bias) )
-- notice kinky { } around your value to make it into valid tuple for MemoryBlock

		for z = 0, g_singlePatch:getSize() - 1 do
			mb:append(MemoryBlock( { g_singlePatch[z] } ) )
		end
        local checksum = 0xA5
        for j=0, g_singlePatch:getSize()-1 do
            checksum = checksum + g_singlePatch[j]
        end
        checksum = BitAND(checksum, 127)
		mb:append(MemoryBlock( { checksum } ) )
		mb:append(MemoryBlock( { 0xF7 } ) )

        panel:sendMidiMessageNow(CtrlrMidiMessage(String(mb:toHexString(1))))
    end
end
```


# May 10, 2020 at 5:44 pm#118301

shooking

- curse of the darned code blocks!! As you once mentioned [ followed by i followed by ] seems to go to /dev/null.
- In the above it did say mb:append(MemoryBlock( { g_singlePatch\[i\][z] } ) ) where I added \[ \] … remove them!!
- Why is there no “preview” in this wordpress??

# May 10, 2020 at 6:55 pm#118305

goodweather

- For the correct syntax of functions, always look in Juce API
- Then realize that not everything has been ported to Ctrlr.
- Then also realize that some things are changing in Lua.
- For example, the bitwise operations have changed between Lua 5.1/5.2 and 5.3
- And indeed, I sometimes see strange characters in posts… Don’t know why…