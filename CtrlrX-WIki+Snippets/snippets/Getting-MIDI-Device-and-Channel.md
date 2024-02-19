# Getting MIDI Device and Channel
> Godlike Productions edited this page on Aug 4, 2022 · 2 revisions
By Proton - source https://ctrlr.org/forums/topic/lua-how-do-i-get-current-midi-outout-channel/#post-117820

Simple LUA script where you check for those parameters in question, create 2 variables and assing the resulting values to them like so:
```lua
outDevice = panel:getProperty(“panelMidiOutputDevice”)
outChannel = panel:getProperty(“panelMidiOutputChannelDevice”)
outChannelNum = tonumber(panel:getProperty(“panelMidiOutputChannelDevice”))

console(“currentOutDevice = “..outDevice)
console(“currentOutChannel = “..outChannel)
```
if you use console to see what the results are you should see something like this:
```
LUA>> currentOutDevice = YAMAHA-CS80-OUT
LUA>> currentOutChannel = 1
```
Note that these return strings. To get the MIDI channel to do anything programatically, you'll need to convert it to a number with the tonumber() function.