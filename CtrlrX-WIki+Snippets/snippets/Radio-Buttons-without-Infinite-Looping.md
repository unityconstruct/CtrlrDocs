# Radio Buttons without Infinite Looping
>John Goodland edited this page on Sep 2, 2022 · 2 revisions
Here is code for radio buttons using source to avoid infinite loops.

Table t{} contains the names of the buttons in the radio group:

```lua
ProgramSelect = function(mod,value,source)
    if source == 4 then
        local sName = L(mod:getName())
        local t = {"PROGRAM01", "PROGRAM02", "PROGRAM03", "PROGRAM04"} -- local table of 4 radio buttons
        for i, v in ipairs(t) do
            if sName == v then
                local sysMess = string.format("F0 00 00 23 01 43 C1 00 %.2X F7", i - 1)
                panel:sendMidiMessageNow(CtrlrMidiMessage(sysMess))
            else
                _G[v]:setValue(0, true) 
               -- don't use panel:getComponent(v) // use panel:getModulatorByName(v)
            end
        end
    end
end -- source == 4 (user clicked on a button - not lua generated - that would be 5 or 6) end

--[[ 
*NOTE: Where PROGRAM01 etc are initialised in an init script
"Called when the panel has finished loading"
PROGRAM01=panel:getModulatorByName("PROGRAM01")
PROGRAM02=panel:getModulatorByName("PROGRAM02")
PROGRAM03=panel:getModulatorByName("PROGRAM03")
PROGRAM04=panel:getModulatorByName("PROGRAM04")
--]]
```

<hr/>


### Radio Button Code Generator
https://ctrlr.org/radio-button-code-generator/
>October 22, 2020 by dnaldoog
Version 1.0
10/20/2020
This panel is for developers wishing to add radio buttons using png images to a panel.
uiComponent and mouse detection functions are generated to console for cutting and pasting into a project.
```
First initialise images (and text) Click on areas [1] [2] [3]
Images must be loaded as resources.
 If you use custom fonts, another user may not have the same fonts on their system.
	On Windows 10 any fonts installed in c:WINDOWSFonts should load, but custom fonts seem not to.
	You can include the font as a resource in a panel you release, but I am not sure if that works on 
	every platform.
(1) First import image/font resources into this panel.
(2) Import one image for 'off state' and a separate image for 'on state' with same dimensions.
(3) Generate code by clicking on "print code to console"
(Open the `console` window first and clear any previous messages)
In your panel:
(A) Create a  uiComponent** add a function with any name to 'Paint callback' field e.g.myPaintCallback"
(B) Create a mouseDown function in the uiComponent** in  'Mouse down callback' 
(C) Create a mouseMove function in the uiComponent** in  'Mouse move callback' 
(D) In 'Resources' add 2 png images of the same size, one for "off state" and one for "on state"
	*Load the exact same images (and custom fonts) used in this program.
```

![img](https://ctrlr.org/wp-content/uploads/2020/10/rbcg.png)

~[img](http://ctrlr.org/wp-content/uploads/2020/10/buttongeneratorcodeexamplep.png)

### Creating Radio Buttons separate to this program
Radio Buttons can also be created using code such as below, where the lua table t{} contains the names of the buttons in the radio group
```lua
ProgramSelect = function(--[[ CtrlrModulator --]] mod --[[ number --]], value --[[ number --]], source)
    if source == 4 then
        local sName = L(mod:getName())
        local t = {"PROGRAM01", "PROGRAM02", "PROGRAM03", "PROGRAM04"} -- local table of 4 radio buttons
        for i, v in pairs(t) do
            if sName == v then
                local sysMess = string.format("F0 00 00 23 01 43 C1 00 %.2X F7", i - 1)
                panel:sendMidiMessageNow(CtrlrMidiMessage(sysMess))
            else
                _G[v]:setValue(0, true) 
               -- don't use panel:getComponent(v) // use panel:getModulatorByName(v)
            end
        end
    end
end -- source == 4 (user clicked on a button - not lua generated - that would be 5 or 6) end
--[[ 
*NOTE: Where PROGRAM01 etc are initialised in an init script
"Called when the panel has finished loading"
PROGRAM01=panel:getModulatorByName("PROGRAM01")
PROGRAM02=panel:getModulatorByName("PROGRAM02")
PROGRAM03=panel:getModulatorByName("PROGRAM03")
PROGRAM04=panel:getModulatorByName("PROGRAM04")
--]]
```
With thanks to Tedjuh for assistance and comments in the development of this panel.
Version 1.0 ※ 10/22/2020

Download:  https://sourceforge.net/projects/ctrlr-utilities/