## blog-11 ReFourBitNibblizing modulatorValue

May 17, 2020 at 1:50 am#118457

### damien

So, I can right now send sysex messages to the Ensoniq DP4, but the format of the Parameter Index and the Parameter need to be adjusted to the specs.

It has to be `ReFourBitNibblized` (once again)

This is my script method to send parameter value changes entitled `AlgoParamValueSend`

```lua
AlgoParamValueSend = function(mod, value)

EnsoniqDP4Header = "F0 0F 40 00" -- Ensoniq DP4 Header
ID = "00" -- Midi Device ID
MsgType = "01" -- For Command Message
Cmd = "00 01"- For Parameter Change Command
Unit = mod:getProperty("modulatorCustomIndexGroup")
-- Format 00 0U [stored in the modulatorCustomIndexGroup Field]

Param = mod:getProperty("modulatorCustomIndex"):ReFourBitNybblize()
-- Format 0p 0P [stored in the modulatorCustomIndex Field]

ParamValue = ReFourBitNybblize(value)		
-- Format 0v 0v 0V 0V [Value calculated with ReFourBitNybblization function :) ]

EOX = "F7" -- End of SySex Message is always F7

msg = table.concat({EnsoniqDP4Header, ID, MsgType, Cmd, Unit, Param, ParamValue, EOX}, ' ')

panel:sendMidiMessageNow(CtrlrMidiMessage(msg))

end
```

This is the Correct format according to the manual :

```
Message format – 8 bit data bytes must be transmitted and received using the 7 bit data format of MIDI, where the MSB of these data bytes must always be zero, so each of the 8 bit data byte is converted to two 4 bit nybbles for transmission. These nybbles each sent as bytes whose upper four bits are all zero. This is a description of the format of all nybblized data bytes within the packet frame as they are transmitted or received via MIDI.
0000HHHH with H = Hi 4 bits of data byte – transmitted first
0000LLLL with L = Lo 4 bits of data byte
```

This represents how the 8 bit byte HHHHLLLL would be transmitted.
And for this particular type of Parameter Value Change TX transfer:

#### Parameter Change Command
This message allows any effect parameter to be edited under remote control.
When this message is received, the system will automatically be put into Edit (or System) mode and the specified unit will become active.
The unit number in the message (specified using the following codes) indicates which logical group contains the parameter to be edited.
The parameter number must be legal within the specified group, with unit parameters based on effect type and config parameters based on Input Config.
The new parameter value is always transmitted as a 16 bit word.
If the parameter only uses an 8 bit value, then the MSByte should be transmitted as zero.

##### [header ] DP/4 SysEx Header
```
00000001 : Command Message code Note: the following 5 bytes must each be transmitted as nybbles!
00000001 : Parameter Change command code
00000uuu : uuu = unit number (0..4)
0ppppppp ppppppp = parameter number (0..127)
mmmnnm : muummmmmm = parameter value MSByte
llllllll : llllllll = parameter value LSByte
11110111 End of Exclusive status byte
```

Example (in hexadecimal notation, assuming MIDI Device ID = 01 transmitted as 00):
```
F0 0F 40 00 00(ID) 01(Msg) 00 01(Cmd) 00 02(Unit) 00 03(Param) 00 00 07 0F(Value) F7
```

To change UnitC : Param 03 Value 127 (7F)

That would so helpful if you someone could give me the ReFourBitNybblize(value) function script so that I can send the good values to the DP4.

Parameter Index must be 2 bytes and Parameter Value must be 4 bytes long.

Thanks a lot in advance for your support


Edit
(to avoid ghost posts) :

I assigned the dedicated Parameter Index for each knobs in the ModulatorCustomIndex Field. This value is in Decimal (ex: 08) So it has to be converted from decimal to hex within 2 FourBitNibblized bytes 🙂

Cheers

May 17, 2020 at 3:59 am#118459


### dnaldoog
‘Ghost Posts’! — the story of my life:

Try this as a suggestion:
```lua
splitInteger2Nybble=function(int) -- integer input
local t={}
local msb=bit.rshift(bit.band(int,240),4)
local lsb = bit.band(int,15)
table.insert(t,string.format("%.2x",msb))
table.insert(t,string.format("%.2x",lsb))
return t
end -- function

AlgoParamValueSend = function(mod, value)
local m=MemoryBlock()
local EnsoniqDP4Header = "F0 0F 40 00" -- Ensoniq DP4 Header
local ID = "00" -- Midi Device ID
local MsgType = "01" -- For Command Message
local Cmd = "00 01"-- For Parameter Change Command
local Unit = "0"..mod:getProperty("modulatorCustomIndexGroup")
-- Format 00 0U [stored in the modulatorCustomIndexGroup Field]
local EOX = "F7" -- End of SySex Message is always F7

local Param =splitInteger2Nybble(mod:getProperty("modulatorCustomIndex"))
local ParamValue = splitInteger2Nybble(value)
Param = table.concat(Param ," ")
ParamValue=table.concat(ParamValue ," ")

local strcat=string.format("%s %s %s %s %s %s %s %s",EnsoniqDP4Header,ID,MsgType,Cmd,Unit,Param,ParamValue,EOX)
m:loadFromHexString(strcat)

panel:sendMidiMessageNow(CtrlrMidiMessage(m:toHexString(1)))

end --function
```

### Damien

Thanks dnldoog,

I tried your method but it’s not working and I don’t know where the error is coming from this is the adjusted method
```lua
--
-- Called when a modulator value changes
-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html
-- @value    new numeric value of the modulator
--

splitInteger2Nybble = function(int)  -- integer input
local t={}
local msb=bit.rshift(bit.band(int,240),4)
local lsb = bit.band(int,15)
table.insert(t,string.format("%.2x",msb))
table.insert(t,string.format("%.2x",lsb))
return t
end -- function

AlgoParamValueSend = function(mod, value)

local EnsoniqDP4Header = "F0 0F 40 00"  -- Ensoniq DP4 Header
local MidiID = "00"  -- Midi Device ID
local MsgType = "01" -- For Command Message
local Cmd = "00 01"  -- For Parameter Change Command
local Unit = mod:getProperty("modulatorCustomIndexGroup") -- Format 00 0U [stored in the modulatorCustomIndexGroup Field]
local ParamId = mod:getProperty("modulatorCustomIndex") -- Format 0p 0P [stored in the modulatorCustomIndex Field]
local EOX = "F7" -- End of SySex Message is always F7

local Param = splitInteger2Nybble(ParamId)
local ParamValue = splitInteger2Nybble(value)

Param = table.concat(Param ," ")
ParamValue = table.concat(ParamValue ," ")

local strcat = string.format("%s %s %s %s %s %s %s %s", EnsoniqDP4Header, ID, MsgType, Cmd, Unit, Param, ParamValue, EOX)
m:loadFromHexString(strcat)

panel:sendMidiMessageNow(CtrlrMidiMessage(m:toHexString(1)))

end --function
```
I get an error while moving a slider 🙁
```
36: bad argument #3 to ‘format’ (string expected, got nil)
```

I’m really stuck. If only it could be regular cc value changes 🙂
Can you please help with that?

Thanks a lot! Have a nice weekend


### dnaldoog

It looks like I didn’t declare 
```lua
local m=MemoryBlock().
```

Does that fix it?

May 17, 2020 at 7:42 pm#118471

### damien

Hi Dnalddoog,

We are getting close!
I struggled to make it work. The “strcat” formula never worked.

The only way to send messages was to forget about the memoryblock and go straight with a basic concat formula.
The Format for Param is alright (0p 0p) but the format for the ParamValue is not good since I only send this format (0v 0v) and I need a 16bit word (0v 0v 0v 0v) that allows to send values above the 128 range.
For exemple if I move the delay time parameter whose max value is 3668 I only send 05h 04h.

So It would require another type of nybblization with 0v 0v 0v 0v format as required by the specs.
If the value is just a 8bit field 00 00 are required before.

This is what I have :
```lua
--
-- Called when a modulator value changes
-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html
-- @value    new numeric value of the modulator
--

AlgoParamValueSend = function(mod, value)

EnsoniqDP4Header = "F0 0F 40 00" 						-- Ensoniq DP4 Header
MidiID = "00" 											-- Midi Device ID
MsgType = "01" 											-- For Command Message
Cmd = "00 01"											-- For Parameter Change Command
Unit = mod:getProperty("modulatorCustomIndexGroup") 	-- Format 00 0U [stored in the modulatorCustomIndexGroup Field]
ParamId = mod:getProperty("modulatorCustomIndex") 		-- Format 0p 0P [stored in the modulatorCustomIndex Field]
EOX = "F7" 												-- Tail of SySex Message is always F7
NameID = mod:getProperty("Name")

console ("Check the Mod value : " .. tostring(value))
console ("Check the Mod Unit : " .. tostring(Unit))

Param = splitInteger2Nybble(ParamId)
ParamValue = splitInteger4Nybble(value)

Param = table.concat(Param ," ")
console("Check the Param String : ".. tostring(Param))

ParamValue = table.concat(ParamValue ," ")
console("Check the ParamValue String : ".. tostring(ParamValue))

msg = table.concat({EnsoniqDP4Header, MidiID, MsgType, Cmd, Unit, Param, ParamValue, EOX}, ' ')
panel:sendMidiMessageNow(CtrlrMidiMessage(msg))

console("Check the sent message : ".. tostring(msg))

panel:sendMidiMessageNow(CtrlrMidiMessage(m:toHexString(1)))

end --function

splitInteger2Nybble = function(int)  -- integer input
local t={}
local msb=bit.rshift(bit.band(int,240),4)
local lsb = bit.band(int,15)
table.insert(t,string.format("%.2x",msb))
table.insert(t,string.format("%.2x",lsb))
return t
end -- function

splitInteger4Nybble = function(int)  -- integer input
local t={}
local msb=bit.rshift(bit.band(int,240),4)
local lsb = bit.band(int,15)
table.insert(t,string.format("%.2x",msb))
table.insert(t,string.format("%.2x",lsb))
return t
end -- function'
```

and the console shows for 2 value change above 128 :
```
LUA>> Check the Mod value : 2614
LUA>> Check the Mod Unit : 00 02
LUA>> Check the Param String : 00 03
LUA>> Check the ParamValue String : 03 06
LUA>> Check the sent message : F0 0F 40 00 00 01 00 01 00 02 00 03 03 06 F7
LUA>> Check the Mod value : 3668
LUA>> Check the Mod Unit : 00 02
LUA>> Check the Param String : 00 03
LUA>> Check the ParamValue String : 05 04
LUA>> Check the sent message : F0 0F 40 00 00 01 00 01 00 02 00 03 05 04 F7
```

We are close to the end 🙂 The function splitInteger4Nybble needs to be adjusted.

Next I’ll work on the algorhythm change via a click on the LCDs and shows a menu with all FX and presets available.

Thanks in advance for the help.

May 17, 2020 at 7:47 pm#118479

edit (to avoid ghost posts)

I removed
```lua
panel:sendMidiMessageNow(CtrlrMidiMessage(m:toHexString(1)))
```
obviously 🙂

May 18, 2020 at 12:25 am#118487

### dnaldoog

Hi Damien,

Try this. I tried looking up the manual, but I couldn’t see any MIDI sysex implementation so I am flying in the dark.

```lua
splitInteger4Nybble=function(int) -- integer input
local t={}
local msb16=bit.rshift(bit.band(int,0xf000),12)
local lsb16=bit.rshift(bit.band(int,0xf00),8)
local msb8=bit.rshift(bit.band(int,0xf0),4)
local lsb8 = bit.band(int,0xf)
table.insert(t,string.format("%.2x",msb16))
table.insert(t,string.format("%.2x",lsb16))
table.insert(t,string.format("%.2x",msb8))
table.insert(t,string.format("%.2x",lsb8))
console(String(table.concat(t,"|")))
return t
end
```
May 18, 2020 at 12:37 am#118488

###  dnaldoog
… or you can also use JUCE BigInteger() class instead of lua bitwise operations:

```lua
splitInteger4Nybble2=function(int) -- integer input
local t={}
local bv=BigInteger(int)
local msb16=bv:getBitRangeAsInt(16,4)
local lsb16=bv:getBitRangeAsInt(8,4)
local msb8=bv:getBitRangeAsInt(4,4)
local lsb8 = bv:getBitRangeAsInt(0,4)
table.insert(t,string.format("%.2x",msb16))
table.insert(t,string.format("%.2x",lsb16))
table.insert(t,string.format("%.2x",msb8))
table.insert(t,string.format("%.2x",lsb8))
console(String(table.concat(t,"|")))
return t
end
```

### damien

There you go! We have it. it’s working for every parameter value from 0 to 65535

I don’t understand exactly the arguments and functions of the script you wrote but it’s working 100% this time.
Negative value from decimal signed 2’s complement are working as well.
A+ mister Dnaldoog. You’re the boss 🙂

ex:
```
Unit B (00 02) Decay time (param #3) Param value 3668 :
F0 0F 40 00 00 01 00 01 00 02 00 03 00 0E 05 04 F7

>>> E54h
```

Thank you ever so much

May 18, 2020 at 1:18 am#118490

### dnaldoog

I think this is a much faster and more efficient implementation;

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

May 18, 2020 at 1:37 am#118492

### dnaldoog

Didn’t read your comment! Thank you :✨ just discovered (by accident) the windows key and colon : opens up an emojis menu!

Just a quick explanation:

The value `3668` in binary is:
```
0000 1110 0101 0100
```

That’s a 16 bit unsigned integer, which in HEX is represented as `0x0e54`

Each Block in HEX is
```
0000 00
1110 0E
0101 05
0100 04
```

so programmatically you have to find a way to extract the values 00 0E 05 04 and send as sysex.

The class BigInteger does that. BigInteger() comes from the JUCE libraries.

Also you can do it with bit masking and shifting bit.band and bit.rshift. These are lua implementations. I don’t know which is faster. Probably about the same, but I imagine doing table.concat() would be very slow in comparison with loading everything into MemoryBlocks.

see attached panel with new code from last post
Don’t want last post to get ghosted!

### damien
Thank for the explanation. The Juce function is lighter on the cpu, Knobs were slow to move with the table concat function and without using memoryblock, you were absolutely right.
Your last script is on point. It’s working great I must say. Thanks so much. Have a nice week!

This reply was modified 16 hours, 8 minutes ago by damien. Reason: typo
May 18, 2020 at 5:06 am#118497

### dnaldoog

Great to hear it’s working and interesting that BigInteger is faster (must remember that).

So, to implement BigInteger() in the first function you could change it thus:

```lua
splitInteger2NybbleX=function(int) -- integer input
return bit.rshift(bit.band(int,0xf0),4),bit.band(int,0xf)
end
```

… becomes:

```lua
splitInteger2NybbleX=function(int) -- integer input
local bv=BigInteger(tonumber(int))
return bv:getBitRangeAsInt(4,4),bv:getBitRangeAsInt(0,4)
end
```
† Note the incoming function parameter needs to be recast with tonumber()
