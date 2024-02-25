# Toggle Menu
> Godlike Productions edited this page on Jan 18, 2022 · 1 revision
Create a modulator (button or uiImageButton)
```lua
--
-- Called when a modulator value changes
-- @mod http://ctrlr.org/api/class_ctrlr_modulator.html
-- @value new numeric value of the modulator
--
myMethod = function(--[[ CtrlrModulator --]] mod, --[[ number --]] value, --[[ number --]] source)
    if value == 1 then
        panel:getPanelEditor():setProperty("uiPanelMenuBarVisible", 1, false)
    else
        panel:getPanelEditor():setProperty("uiPanelMenuBarVisible", 0, false)
    end
end
```
Source: https://ctrlr.org/forums/topic/hidingshowing-menu-bar/