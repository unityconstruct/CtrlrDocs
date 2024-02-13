# LUA

## 5.6.23

### Callback Methods in OSX

- I did compile the latest build (v5.6.23) on Mac, but when trying to use existing panels I get always the same error when using callBack methods:
- OK, doing some more searching, the error windows seem to get created here.
  - https://github.com/RomanKubiak/ctrlr/blob/7fab6623d3a2b26b1bcc583568028552936fd487/Source/Lua/Methods/CtrlrLuaMethodManagerCalls.cpp
  - This might be a good place to start to narrow down this error. I'll keep searching for other potential places.
  - Out of curiosity, does this only happen with panels that are imported from other versions, or does it still happen if panels are created from scratch in this version?
- I did a panel from scratch with one simple function sending only one Midi message and got the same kind of error(s). All imported panels from older versions also give the error on every function which is called when clicking on a button. At least that is what my experience is. I did not test it with other kind of functions which involve calling "something".
- I think I found the reason for the errors. In older versions assigning a variable to and formatting a sysex message like this: syxProgram = {0xF0, 0x07, 0x00, 0x78, 0x14, 0x09, 0x40, 0x08, 0xF7} was no problem. In this latest version (5.6.23) this is apparently a problem and causes the overload mismatch. The solution is to format the message explicitly as a string, like this: "F0 07 00 78 14 09 40 08 F7". Other ways also are OK, as long as (I think) the outcome is a string. I hope I'm right, but at least my panel does now run without issues so far in this version.
- I think the bug must he in this file, though the only change has been to remove the luabind overload. As far as I can see it should still accept an array, but I'm definately no C++ guru.
  - It's weird because it seems to work fine in Windows.
  - https://github.com/RomanKubiak/ctrlr/blob/master/Source/MIDI/CtrlrMidiMessage.cpp

<hr/>

- Looking at this, I'm wondering is line 118 should be
```lua
MemoryBlock possibleMidiData = luaArrayToMemoryBlock(luaArray.getObject());
```
- and not
```lua
MemoryBlock possibleMidiData = luaArrayTomemoryBlock(luaArray.getObject());
```
- Normally all the ctrlr stuff is strictly lowerCamelCase.
- This function is only referenced 4 times in this repo, though it looks like it still relies on luaBind.
- https://github.com/RomanKubiak/ctrlr/search?q=luaArrayToMemoryBlock

<hr/>

- We've confirmed that it's just midi messages formatted as a table that cause the issue. MIDI messages in a memory block or string work fine. MemoryBlocks are probably the easiest conversion to make by using this code snippet.
```lua
requestMessage = {0xf0, 0x00, 0x00, 0x2f, 0x03, 0x01, 0x02, 0x00, 0xf7}
requestMessageMB = MemoryBlock()
requestMessageMB:createFromTable(requestMessage)
midi = CtrlrMidiMessage(requestMessageMB)
panel: sendMidiMessageNow (midi)
```
<hr>

- Sorry Roman, but I only found a kind of workaround and Godlike-Productions (aka the Puppeteer) did elaborate on this. See his comments. My guess is in this version (5.6.23) Lua does not accept a sysex message formatted as a table.

<hr/>

- Hi Roman. Basically this works.
```lua
requestMessage = {0xf0, 0x00, 0x00, 0x2f, 0x03, 0x01, 0x02, 0x00, 0xf7}
requestMessageMB = MemoryBlock()
requestMessageMB:createFromTable(requestMessage)
midi = CtrlrMidiMessage(requestMessageMB)
panel: sendMidiMessageNow (midi)
```
- This also works
```lua
requestMessage = {0xf0, 0x00, 0x00, 0x2f, 0x03, 0x01, 0x02, 0x00, 0xf7}
requestMessageMB = MemoryBlock()
requestMessageMB:createFromTable(requestMessage)
midi = CtrlrMidiMessage(requestMessageMB:toHexString(1))
panel: sendMidiMessageNow (midi)
```
- This does NOT work
```lua
requestMessage = {0xf0, 0x00, 0x00, 0x2f, 0x03, 0x01, 0x02, 0x00, 0xf7}
midi = CtrlrMidiMessage(requestMessage)
panel: sendMidiMessageNow (midi)
```
- This is only an issue with OSX. They all work fine in Windows.

<hr/>

- It is only an issue with Ctrlr v5.6.23 for Mac. Older versions, in particular the 5.3.xxx versions, work OK.

<hr/>

- @Godlike-Productions You don't need all those lines to create a memoryblock:
- just replace :
```lua
panel:sendMidiMessageNow(CtrlrMidiMessage({x, y, z }))
```
- with
```lua
panel:sendMidiMessageNow(CtrlrMidiMessage(MemoryBlock({x, y, z}))) 
```
- where t={x, y, z } is already a table.
- since you can create a MB from a table you can get a volatile MB with just : MemoryBlock({x, y, z})
- This way you can update all your "sendMidiMessageNow" instructions to the 5.5.0 version without to much hassle by just wrapping your table with MemoryBlock(t)
- Thank you, this is a great solution: 
```lua
panel:sendMidiMessageNow(CtrlrMidiMessage(MemoryBlock({x, y, z})))
```

<hr/>

- I don't suppose firing panel:getCanvas():repaint() would work, but how about trying:
```lua
panel:getModulatorByName("knobOsc2Semitone"):getMidiMessage():setProperty("midiMessageSysExFormula", "F0 42 3y 58 41 4F 00 LS MS F7",true)
```
-  but I have no idea actually.

<hr/>

- Unfortanutaly it made no difference.
- But I completely forgot about the internal "what" lua method. I managed to find a function that did the trick - 
```lua
panel:getInputComparator():rehashComparator()
```
- I inserted it at the end of the sysex formula replacement function and now it recognizes all incoming messages fine. I don't know if it's correct way to do it, but it works to me :)


### SysEx formula from Lua

- Is anybody have an idea on how to properly change modulator sysex formula from Lua?
- I have tried the most obvious approach like:
- panel:getModulatorByName("knobOsc2Semitone"):getMidiMessage():setPropertyString("midiMessageSysExFormula", "F0 42 3y 58 41 4F 00 LS MS F7")
- It works pretty well - modulator become to send values using new formula. But the panel cannot recognize and display incoming values from synthesizer using this new formula until I enter and exit "panel mode" (even though I make no changes there).
- Is there any chance to get it to work? Really want to avoid doubling the whole knob collection on the panel to send slightly different data.


# Panel Name and Author Name (Ctrlr|Instigator) don't change while exported as VST2 & VST3 [CtrlrManagerInstance.cpp] #395
## VST3 Generation Workflow
- @denosys no problem, The best way is to start from scratch with downloading github desktop app then you search for ctrl, download from the app the source files from the master branch to your PC.
- you need to install xcode for mac or Visual studio for PC and follow @bijlevel tutorial that you can download there
- Go to Juce.com and download the whole install and sign up for a free account. You will need to run Projucer 6.0.8 later while logged in.
- Then you go to your Ctrlr source folder and look for ctrlr/Ctrlr.jucer
- Duplicate it under yourpluginname.jucer, this is the one you need to Customize your "intermediate".
- Next up is to open yourpluginname.jucer and replace the values I talked about in the discussion #394 with your own manufacturer ID, plugin ID etc #394 (reply in thread) . It's very important to keep the one you had generated when you designed your panel. Check and adjust the VS2019 options as well on the left menu (main,debug, release).
- In projucer still, save your .jucer file and follow @bijlevel process with VS2019. Let us know if you succeed or where it failed.



