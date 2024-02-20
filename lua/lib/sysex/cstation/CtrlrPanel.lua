#!/usr/bin/lua
local CtrlrModulator = require "CtrlrDocs.lua.lib.sysex.cstation.CtrlrModulator"

print(tostring(CtrlrModulator:isVisible()))

CtrlrModulator.getComponentAt("id")


if false then -- For LuaDoc
    ---
    --- utilty classes for mocking Ctrlr
        module "CtrlrPanel"
end

local Modulator = {}
local Component = {}

function Modulator:new()
    setmetatable({},Modulator)
end

---comment
---@return Modulator
local getModulator = function()
    return Modulator
end
--- comment
---@return Component
local getComponent = function()
    return Component
end

--[[ CtrlrPanel ]]--
function setGlobalVariable() end
function getSlider() end
function getPropertyDouble() end
function getProperty() end
function sendMidiMessageNow() end
function getPanelEditor() end
function getProgramState() end
function getToggleButtonComponent() end
function getObjectTree() end
function setProgramState() end
-- function getModulator() end
function getCanvas() end
function setPropertyString() end
function getLabel() end
function setRestoreState() end
function getFixedSlider() end
function setPropertyColour() end
function getPropertyString() end
function getGlobalVariable() end
function getWaveformComponent() end
function getComboComponent() end
function removeProperty() end
function setPropertyInt() end
function getCombo() end
function getLabelComponent() end
function getLCDLabelComponent() end
function getRestoreState() end
function getModulatorByIndex() end
function getWaveform() end
function getCtrlrMIDILibrary() end
function getImageSliderComponent() end
function getModulatorsWithProperty() end
function getFileListBox() end
function getListBox() end
function getFileListBoxComponent() end
function getImageButtonComponent() end
function getFixedImageSlider() end
function getToggleButton() end
function getComponent() 
return CtrlrModulator
end
function getBootstrapState() end
function getSliderComponent() end
function getImageButton() end
function getPropertyInt() end
function getModulatorWithProperty() end
function dumpDebugData() end
function getModulatorByName() end
function getModulatorsWildcard() end
function getFixedImageSliderComponent() end
function setModulatorValuesFromData() end
function getNumModulators() end
function getListBoxComponent() end
function getFixedSliderComponent() end
function getModulatorValuesAsData() end
function setPropertyDouble() end
function getLCDLabel() end
function getButton() end
function setProperty() end
function getInputComparator() end
function getImageSlider() end
function getButtonComponent() end
function sendMidi() end
function isRestoring() end


return {
    -- getModulator = getModulator,
    -- getComponent = getComponent,
    setGlobalVariable = setGlobalVariable,
    getSlider = getSlider,
    getPropertyDouble = getPropertyDouble,
    getProperty = getProperty,
    sendMidiMessageNow = sendMidiMessageNow,
    getPanelEditor = getPanelEditor,
    getProgramState = getProgramState,
    getToggleButtonComponent = getToggleButtonComponent,
    getObjectTree = getObjectTree,
    setProgramState = setProgramState,
    getModulator = getModulator,
    getCanvas = getCanvas,
    setPropertyString = setPropertyString,
    getLabel = getLabel,
    setRestoreState = setRestoreState,
    getFixedSlider = getFixedSlider,
    setPropertyColour = setPropertyColour,
    getPropertyString = getPropertyString,
    getGlobalVariable = getGlobalVariable,
    getWaveformComponent = getWaveformComponent,
    getComboComponent = getComboComponent,
    removeProperty = removeProperty,
    setPropertyInt = setPropertyInt,
    getCombo = getCombo,
    getLabelComponent = getLabelComponent,
    getLCDLabelComponent = getLCDLabelComponent,
    getRestoreState = getRestoreState,
    getModulatorByIndex = getModulatorByIndex,
    getWaveform = getWaveform,
    getCtrlrMIDILibrary = getCtrlrMIDILibrary,
    getImageSliderComponent = getImageSliderComponent,
    getModulatorsWithProperty = getModulatorsWithProperty,
    getFileListBox = getFileListBox,
    getListBox = getListBox,
    getFileListBoxComponent = getFileListBoxComponent,
    getImageButtonComponent = getImageButtonComponent,
    getFixedImageSlider = getFixedImageSlider,
    getToggleButton = getToggleButton,
    getComponent = getComponent,
    getBootstrapState = getBootstrapState,
    getSliderComponent = getSliderComponent,
    getImageButton = getImageButton,
    getPropertyInt = getPropertyInt,
    getModulatorWithProperty = getModulatorWithProperty,
    dumpDebugData = dumpDebugData,
    getModulatorByName = getModulatorByName,
    getModulatorsWildcard = getModulatorsWildcard,
    getFixedImageSliderComponent = getFixedImageSliderComponent,
    setModulatorValuesFromData = setModulatorValuesFromData,
    getNumModulators = getNumModulators,
    getListBoxComponent = getListBoxComponent,
    getFixedSliderComponent = getFixedSliderComponent,
    getModulatorValuesAsData = getModulatorValuesAsData,
    setPropertyDouble = setPropertyDouble,
    getLCDLabel = getLCDLabel,
    getButton = getButton,
    setProperty = setProperty,
    getInputComparator = getInputComparator,
    getImageSlider = getImageSlider,
    getButtonComponent = getButtonComponent,
    sendMidi = sendMidi,
    isRestoring = isRestoring

}





