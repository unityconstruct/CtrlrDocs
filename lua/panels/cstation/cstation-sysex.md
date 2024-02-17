# cstation sysex




## prodatum sysex captures

### Controllers
```
C01 74 F0 18 0F 00 55 01 02 13 07 48 00 F7
C02 71 F0 18 0F 00 55 01 02 14 07 2A 00 F7
C03 25 F0 18 0F 00 55 01 02 15 07 7F 00 F7
C04 26 F0 18 0F 00 55 01 02 16 07 00 00 F7
C05 73 F0 18 0F 00 55 01 02 17 07 7F 00 F7
C06 75 F0 18 0F 00 55 01 02 18 07 00 00 F7
C07 85 F0 18 0F 00 55 01 02 19 07 7F 00 F7
C08 72 F0 18 0F 00 55 01 02 1A 07 00 00 F7
C09 78 F0 18 0F 00 55 01 02 1C 07 00 00 F7
C10 77 F0 18 0F 00 55 01 02 1D 07 7F 00 F7
C11 27 F0 18 0F 00 55 01 02 1E 07 7F 00 F7
C12 28 F0 18 0F 00 55 01 02 1F 07 00 00 F7
C13
C14
C15
C16
```

- Layer Select: `898` (02h,07h) - `02 07` - values `00-03` [1-4]
```lua

F0180F00550102 02 07 00 00 F7
F0180F00550102 02 07 01 00 F7
F0180F00550102 02 07 02 00 F7
F0180F00550102 02 07 03 00 F7
F0180F00550102 00 00 F7
```
- Preset Select: `897` (01h,07h) min = -1; max = 255
```lua
F0180F00550102 01 07 00 00 F7
F0180F00550102 01 07 01 00 F7
F0180F00550102 01 07 02 00 F7
F0180F00550102 01 07 03 00 F7
```
- Voice Edit
```lua
--Coarse
--Fine
--S.Offset
--S.Delay
--Chorus
--C.Width
--Freq
--Q
--Glide
--G.Curve
--Pan
--BendR
F0180F00550102 11 0B 5C 7F F7 
F0180F00550102 12 0B 41 7F F7
F0180F00550102 1C 0B 00 00 F7
F0180F00550102 1B 0B 67 7F F7
F0180F00550102 13 0B 00 00 F7
F0180F00550102 14 0B 00 00 F7
F0180F00550102 02 0C 00 00 F7
F0180F00550102 03 0C 00 00 F7
F0180F00550102 18 0B 00 00 F7
F0180F00550102 19 0B 00 00 F7
F0180F00550102 03 0B 40 7F F7
F0180F00550102 17 0B 7F 7F F7
--Volume
F0180F00550102 02 0B 20 7F F7
--Filter None
F0180F00550102010C7F00F7
--Fuzzy Face
F0180F00550102010C0A01F7
```

- cstation sysex header
```lua
-- || F0 || 18 0F | 00 55 || 01 02 || F7 ||
local EMUHeader = "F0 18 0F"  -- Ensoniq DP4 Header
local MidiID = "00"  -- Midi Device ID
local SpecialDesignator = "55"
local SysExHeader = MemoryBlock(string.format('%s %s %s', EMUHeader, MidiID, SpecialDesignator))
-- m:loadFromHexString(strcat)
-- local MsgType = "01" -- For Command Message
local Cmd = "00 01"  -- For Parameter Change Command
--local Unit = mod:getProperty("modulatorCustomIndexGroup") -- Format 00 0U [stored in the modulatorCustomIndexGroup Field]
--local ParamId = mod:getProperty("modulatorCustomIndex") -- Format 0p 0P [stored in the modulatorCustomIndex Field]
local EOX = "F7" -- End of SySex Message is always F7

local m=MemoryBlock(string.format("F0 0F 40 00 00 01 00 01 0%.2X",Unit ))
```

- memoryblock for sysex
```lua
splitInteger2NybbleX=function(int) -- integer input
return bit.rshift(bit.band(int,0xf0),4),bit.band(int,0xf)
end

splitInteger4NybbleBIX=function(int) -- integer input
local bv=BigInteger(int)
return bv:getBitRangeAsInt(16,4),bv:getBitRangeAsInt(8,4),bv:getBitRangeAsInt(4,4),bv:getBitRangeAsInt(0,4)
end

AlgoParamValueSend = function(mod, value)
local t={}
local Unit = mod:getProperty("modulatorCustomIndexGroup")
local EOX = 0xF7 -- End of SySex Message is always F7
local m=MemoryBlock(string.format("F0 0F 40 00 00 01 00 01 0%.2X",Unit ))

local ParamMsb,ParamLsb = splitInteger2NybbleX(mod:getProperty("modulatorCustomIndex"))
local ParamValueA,ParamValueB,ParamValueC,ParamValueD=splitInteger4NybbleBIX(value)
table.insert(t,ParamMsb)
table.insert(t,ParamLsb)
table.insert(t,ParamValueA)
table.insert(t,ParamValueB)
table.insert(t,ParamValueC)
table.insert(t,ParamValueD)
table.insert(t,EOX)
local str=MemoryBlock()
str:createFromTable(t)
m:append(str)
--console(String(m:toHexString(1)))
panel:sendMidiMessageNow(CtrlrMidiMessage(m:toHexString(1)))
end --function
```