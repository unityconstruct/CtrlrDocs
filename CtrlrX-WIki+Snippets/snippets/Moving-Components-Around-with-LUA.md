# Moving Components Around with LUA
>Godlike Productions edited this page on Jan 7, 2022 · 1 revision
If you need to move a component with LUA this code works.
```lua
mainText = panel:getModulatorByName("mainText")

mainText:getComponent():setTopLeftPosition(193, 35)
```

More information available at https://ctrlr.org/forums/topic/using-lua-to-layout-stuff-repost/



<hr/>

### ### Aprint 16, 2020 at 9:39 pm#117794

shooking
Hi not sure if something went wrong with my post – trying again
I found a nifty technique that not sure if this is documented anywhere.
I want to create 32 LCDs that do “stuff” when double clicked.
I created a group
Then I created a single LCD and add methods until it was doing roughly what I want.
So now I needed to create another 31 and lay them out etc – normally something I find nasty.
But well I discovered I can use the console in conjunction with Customer modulator index / modulator list.
ALGORITHM
```
cut and paste first button … you have two in non ideal placement.
cut and paste those two -> 4
4 -> 8
8 -> 16
16 -> 32
```

and wow what a mess. Dont panic
In the Panel -> Modulator List
find the duplicates (in my case uLCDLabel’s)
And edit their modulatorCustomIndex 1, 2, 3, 4, … 32.
Now the SUPER kinky part
Consult the Utility (tab on right under General/Resource)
This tells you if your properties is a modulator or component …
This you now do 🙂
```lua
local i
local x
local y
local name
local basename="multi"
local m
local sName
local rect
local labname
local multiLetter="ABCD"
for i=1, 32 do
	name=basename..string.format("%02d", i)
-- 1000+i
	m = panel:getModulatorWithProperty("modulatorCustomIndex",1000+i)
	sName = m:getName()
	console(sName)
	m:setPropertyString("name", name)
	m:getComponent():setPropertyString("componentVisibleName", name)
        -- need floor as not integer ops otherwise
	x = math.floor((i - 1) % 8)
	y = math.floor((i - 1) / 8)
	rect = string.format("%d %d %d %d", x*100, 16 + y*16, 96, 16)
	console(rect)
	m:getComponent():setPropertyString("componentRectangle",rect)
	labname = string.format("Load I%s-%d", string.sub(multiLetter, y + 1, y + 1), x)
	m:getComponent():setPropertyString("uiLabelText", labname)
	sName = m:getName()
	console(sName)
end
```
And you should have 32 buttons laid out in a 8 x 4 array.
Each LCD has a consistent name.
They can all call the same “processor” on double click.
How does it know what called them??
Simple (well one day of messing around!)
```lua
--
-- Called when a double-click event occurs on this component
--

requestMultiPatch = function(--[[ CtrlrComponent --]] comp, --[[ MouseEvent --]] event)
    console("In requestMultiPatch")
    local sName = comp:getOwner():getName()
    console("Name: "..L(sName))

--	console(tostring(comp))
--    console(tostring(event))
    comp:setPropertyString("uiLabelText", "Loading...")

    local patchNoDec = tonumber( string.sub (L(sName), 6, 7) ) - 1
    local sysex = string.format("F0 40 00 00 00 03 00 %02x F7",patchNoDec)
    console(sysex)
    panel:sendMidiMessageNow(CtrlrMidiMessage(sysex))
    console("Do I ever get here?")
end
```
Enjoy – and if there is a simpler way please let me know.

### ### Aprint 17, 2020 at 5:00 pm#117801

shooking
whats best way to achieve that – can they just be included in one of these threads?
The panel would only show the output – the LUA was run from console and stored in a Notepad++
You see from the capture repeated “stuff”.
Each row (and 8 x 4 matrix of LCDs at top) are given unique sequential custom ids
Then I simply write LUA to position them where I want.
If I dont like it, no problem – write another deployment algorith,
Before I did this by editing XML.

### ### Aprint 17, 2020 at 6:15 pm#117805
shooking
and see I found an excellent novation panel with image buttons.
So I have borrowed the knobs.
Imported the resource.
Dang I want to change all my transpose knobs … wont that be a tedious set of clicking or XML editing.
Screw that
```lua
local i
local x
local y
local name
local basename="Tran"
local m
local sName
local rect
for i=1, 8 do
	name=basename..string.format("%02d", i)
-- 1000+i
	m = panel:getModulatorWithProperty("modulatorCustomIndex",9000+i)
	sName = m:getName()
	m:setPropertyString("name", name)
	m:getComponent():setPropertyString("componentVisibleName", name)
	x = math.floor((i - 1) % 8)
	y = math.floor((i - 1) / 8)
	rect = string.format("%d %d %d %d", x*100, 264 + y*16, 48, 40)
	console(rect)
	m:getComponent():setPropertyString("componentRectangle",rect)
	m:getComponent():setPropertyString("uiImageSliderResource","xstation_bidirect_64x64")
	m:getComponent():setPropertyString("resourceImageWidth", "64")
	m:getComponent():setPropertyString("resourceImageHeight", "64")
	m:getComponent():setPropertyString("resourceImagePaintMode", "36")
	m:getComponent():setPropertyString("resourceImageOrientation", "1")
	m:getComponent():setPropertyString("uiType", "uiImageSlider")
	m:getComponent():setPropertyString("uiSliderStyle", "RotaryVerticalDrag")
	m:getComponent():setPropertyString("componentLabelPosition", "top")
	m:getComponent():setPropertyString("componentLabelJustification", "centred")
	sName = m:getName()
	console(sName)
end
```
here’s the effect .. repeat for the others, just modify my coords, my base name.
Notice I am changing the component type .. recall to save your original to one side incase you foobar.
And recall to close and reopen the panel to see the effects.
Notice I moved the position of the labels – just look at the Utility, cut and paste into a notepad
Examine the fields you want to change … do it.

### ### Aprint 17, 2020 at 6:33 pm#117808

human fly
honestly i think knobs won’t be the best display. i can’t think of the novation panel you mean. but i did give these sorts of things a lot of thought. knobs, you’re – sometimes, depending on what it is – straining to get the value you want, if it needs to be precise. it’s ok for things like synth parameters.
i tried a thing with a pair of horizontal sliders (top/bottom range) – or vertical sliders, depending on your layout – if you only have 8 parts, you could do all this horizontally? just a thought. although we like to align things vertically for channels. but it doesn’t have to be like that… ??
if you want some ideas, in general, browsing, please feel free to peruse my D-110 effort as i suggested. go toward the end of the topic and there’s a last/latest file there. it is chaotic on load, you have to hit the ‘init view’ (‘developer’) button i made, that reloads all the defaults.
donaldoog also helped me with other little side projects, experimenting with creating random names, stuff like that – i’ll have to see what those threads were, or if they still exist. my current computer isn’t set up at all but i still have the files.
i don’t get what the multiple LCD stack is at the top – showing ‘loading’. can you give a quick runthrough of what’s going on there? i can see what the rest is, pretty much.
ps: i thought the horizontal layout was good for representing position on a keyboard, that was it 😉
This reply was modified 3 years, 10 months ago by human fly.

### ### Aprint 17, 2020 at 7:15 pm#117810

shooking
the 32 LCDs on top (IA1 – IA8, IB1, …, ID1 ID8) represents the 32 available multi slots.
The idea is to bulk load, populate (the Updating button is there to do that). I am just looking for how to pre-allocate space for them on load.
Then double clicking on either of them will bring up the “display” of that Multi (it is 8 horizontal channels). Alas the K1r doesnt allow sysex param manipulation of the multi – you have to modify it and upload.
I _think_ I hear the multi change if I edit an individual Single patch on the correct channel – more as I find it.
Then I want to “Mouse over” to update display based on “in memory” value of the given multi.

So
1] bulk load
2] double click individual multi to request from K1r and “see it”
3] move over to see that one from cache

the sysex to the K1r is, on mine at least, suspect.
I can trigger from the K1r direct and I see the result in the panel.
I can see sysex is being send via midi monitor – K1r refused to reliably talk to me – I can understand that.

Ultimately I want to rework my K1r Single panel and do a similar thing to visualize any of the 64 singles.

### Aprint 17, 2020 at 7:57 pm#117811

human fly
how about if you collect each parameter set to a table? you can then refresh a single LCD display with each one as you select it, fetching the values from a table? i did something like this with my RX7 panel (also uncompleted, and have now sold the rx7…) where, instead of an LCD, i have a single set of modulators – controls, knobs etc. – to which i assigned ‘Keys’ – the equivalent of presets, but imagine a
drum machine, with 240 individual keys – and it was working quite well. the project is stopped at the point where i began to deal with Yamaha’s ‘multi’ thing (different concept: here’s it’s a drum voice that is selected to be mapped across an octave rather than singly).

search out that thread too, could have something to look at. lol beware: main methods depend on a library of methods, so you have to trace back a bit at times 🙂 i was trying to be an organised coder, a bit ahead of myself. but that version works – at least the UI does, there’s no sysex in it.

(d*mn, and then came that car insurance thing, and i just couldn’t sit in front of the PC figuring out stuff anymore, had to fight for my van… and lost, and also lost the momentum to carry on, at that point. bad bad bad, get even more p*ssed off at what they did to my coding ! )

### Aprint 17, 2020 at 9:44 pm#117812

shooking
thats what I am doing now.

```lua
function processMulti(--[[ CtrlrMidiMessage --]] midiMessage,
        --[[ bool --]] singlePatch )
    console("in processMulti")
-- single and multiple transfers have similar initial header
-- CHECK ... 
    if validateSysexHeader(midiMessage, singlePatch) == false then
        console("invalid sysex header")
        return
    end

    if singlePatch == true then
        local size = midiMessage:getSize()
        local patch = midiMessage:getData():getByte(7)
        -- so patch - 64 is the multi we want to update LCD
        patch = patch - 64
        local d = midiMessage:getData()
        local lp
        -- skip the F0 -- first 8 bytes and we dont and the F7
        for lp=0, size - 8 - 1 do
            g_multiPatch[patch]:setByte(lp, d:getByte(lp+8))
        end

        console(string.format("Single %d", size))
        -- we dont want the trailing F7
        process_one_multi( patch, g_multiPatch[patch], g_multiPatch[patch]:getSize() )
    else
        console("BULK")
        -- so we know we have a validSysex
        -- then 32 blocks of patch data.
        -- finally a checksum
        -- check because it ISNT 32 full single size sysex
        -- one sysex head, 32 blocks, one checksum on end byte
        local i, lp
        local singleSize=76
        for i=0, 31 do
            local d = midiMessage:getData():getRange(8 + 
                        i*(singleSize), 8 + (i+1)*(singleSize))
            for lp=0, singleSize do
                g_multiPatch:setByte(lp, d:getByte(lp))
                -- we dont want the trailing F7
            end
            process_one_multi( i, g_multiPatch,  singleSize )
        end 
    end
```
I was a PITA to work out

```lua
  g_multiPatch = {}
    -- let store it as 32
    -- note 76 data -- strip of Sysex Header and F7
    for i = 0, 31 do
        g_multiPatch = CtrlrLuaMemoryBlock(76, true)
    end
```
these “blocks” start a 0 🙂
I not managed to the CopyTo working consistently
```lua
x = CtrlrLuaMemoryBlock(85, true)
console(string.format("%d", x:getSize()))
for i=1,85 do y:setByte(i, i) end
CtrlrLuaMemoryBlock::getByte position: 85 is beyond bounds of this memory block with size: 85

-- ok so 0, n-1
for i=0,84 do y:setByte(i, i) end
y:copyTo(x, 0, 85) -- works
-- but midiMessage isnt behaving like a y :-(
I will check out your panels.
I find as I get older if I cannot see it on the screen I’ve already forgot.
```

The main point of my post was “Is anyone else using the CustomIndex to allow LUA to manipulate positioning / morphing”. As you saw I took a uiSlider and changed it into a uiImageSlider … all with a few lines of LUA … I love gvim and macros but what I did takes this to a new level of lazy 🙂