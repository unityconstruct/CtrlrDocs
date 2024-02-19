# Variables for the "source" argument in LUA scripts
> Damien S edited this page on Nov 10, 2023 · 8 revisions
As a reminder when using the source filter in LUA script :
```lua
value(“initialValue”, 0) 
value(“changedByHost”, 1) 
value(“changedByMidiIn”, 2) 
value(“changedByMidiController”, 3) 
value(“changedByGUI”, 4) 
value(“changedByLua”, 5) 
value(“changedByProgram”, 6) 
value(“changedByLink”, 7) 
value(“changeByUnknown”, 8)
```

Here is an exemple
```lua
yourFilteredScriptByOperationSource = function(mod,value,source) if source == 4 then -- 4 is for changedByGUI which is an action of the user on the panel GUI -- your script end end -- end of function
```

https://github.com/RomanKubiak/ctrlr/blob/8aa00d82127acda42ad9ac9b7b479461e9436aa4/Source/Lua/CtrlrLuaManager.cpp#L1142

