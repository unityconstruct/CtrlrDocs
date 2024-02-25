# Save and Load MIDI settings to ValueTree
> Godlike Productions edited this page on Jan 20, 2022 · 3 revisions
I've just built a method to save and restore all of the MIDI parameters in the MIDI settings box. To save everyone a bunch of time (and so I can find it later) here's the methods.

Note: I've included the last path that I saved files to here as well. Just delete this line if you don't need it.

Save to Value Tree
```lua
--
-- Called when data needs saving
--
saveStateData = function(--[[ ValueTree --]] stateData)

saveAllBanks()

-- Update ValueTree
savePath = tostring(panel:getLabelComponent("filePathLabel"):getProperty("uiLabelText"))
--savePath = "Testing"
sessionMidiInDevice = panel:getProperty("panelMidiInputDevice")
sessionMidiOutDevice = panel:getProperty("panelMidiOutputDevice")
sessionMidiControlDevice = panel:getProperty("panelMidiControllerDevice")
sessionMidiInDeviceChannel = panel:getProperty("panelMidiInputChannelDevice")
sessionMidiOutDeviceChannel = panel:getProperty("panelMidiOutputChannelDevice")
sessionMidiControlDeviceChannel = panel:getProperty("panelMidiControllerChannelDevice")
sessionMidiInputFromHost = panel:getProperty("panelMidiInputFromHost")
sessionMidiInputFromHostChannel = panel:getProperty("panelMidiInputChannelHost")
sessionMidiOutputToHost = panel:getProperty("panelMidiOutputToHost")
sessionMidiOutputToHostChannel = panel:getProperty("panelMidiOutputChannelHost")
sessionMidiThruH2H = panel:getProperty("panelMidiThruH2H")
sessionMidiThruH2HChannel = panel:getProperty("panelMidiThruH2HChannelize")
sessionMidiThruH2D = panel:getProperty("panelMidiThruH2D")
sessionMidiThruH2DChannel = panel:getProperty("panelMidiThruH2DChannelize")
sessionMidiThruD2D = panel:getProperty("panelMidiThruD2D")
sessionMidiThruD2DChannel = panel:getProperty("panelMidiThruD2DChannelize")
sessionMidiThruD2H = panel:getProperty("panelMidiThruD2H")
sessionMidiThruD2HChannel = panel:getProperty("panelMidiThruD2HChannelize")

--vtTest = ValueTree("stateData2")

stateData:setProperty("lastPath", savePath, nil)
--stateData:addChild(vtTest, -1, nil)
stateData:setProperty("lastPath", savePath, nil)
stateData:setProperty("midiInDevice", sessionMidiInDevice, nil)
stateData:setProperty("midiOutDevice", sessionMidiOutDevice, nil)
stateData:setProperty("midiControlDevice", sessionMidiControlDevice, nil)
stateData:setProperty("midiInDeviceChannel", sessionMidiInDeviceChannel, nil)
stateData:setProperty("midiOutDeviceChannel", sessionMidiOutDeviceChannel, nil)
stateData:setProperty("midiControlDeviceChannel", sessionMidiControlDeviceChannel, nil)
stateData:setProperty("midiInputFromHost", sessionMidiInputFromHost, nil)
stateData:setProperty("midiInputFromHostChannel", sessionMidiInputFromHostChannel, nil)
stateData:setProperty("midiOutputToHost", sessionMidiOutputToHost, nil)
stateData:setProperty("midiOutputToHostChannel", sessionMidiOutputToHostChannel, nil)
stateData:setProperty("midiThruH2H", sessionmidiThruH2H, nil)
stateData:setProperty("midiThruH2HChannel", sessionmidiThruH2HChannel, nil)
stateData:setProperty("midiThruH2D", sessionmidiThruH2D, nil)
stateData:setProperty("midiThruH2DChannel", sessionmidiThruH2DChannel, nil)
stateData:setProperty("midiThruD2D", sessionmidiThruD2D, nil)
stateData:setProperty("midiThruD2DChannel", sessionmidiThruD2DChannel, nil)
stateData:setProperty("midiThruD2H", sessionmidiThruD2H, nil)
stateData:setProperty("midiThruD2HChannel", sessionmidiThruD2HChannel, nil)


end
Load From ValueTree
--
-- Called when data is restored
--
loadStateData = function(--[[ ValueTree --]] stateData)

-- Read From ValueTree

if stateData:hasProperty("lastPath") then
    savePath = stateData:getProperty("lastPath")
    panel:getLabelComponent("filePathLabel"):setText(savePath)
else
    savePath = L(File.getSpecialLocation(File.userDocumentsDirectory):getFullPathName())
             if (savePath:sub(-1) ~= '/' and savePath:sub(-1) ~= '\\') then
                savePath = savePath..'/'
            end --if
    panel:getLabelComponent("filePathLabel"):setText (savePath)
end --if

if stateData:hasProperty("midiInDevice") then
    sessionMidiInDevice = stateData:getProperty("midiInDevice")
    panel:setProperty("panelMidiInputDevice",sessionMidiInDevice)
end --if

if stateData:hasProperty("midiOutDevice") then
    sessionMidiOutDevice = stateData:getProperty("midiOutDevice")
    panel:setProperty("panelMidiOutputDevice",sessionMidiOutDevice)
end --if

if stateData:hasProperty("midiControlDevice") then
    sessionMidiControlDevice = stateData:getProperty("midiControlDevice")
    panel:setProperty("panelMidiControllerDevice",sessionMidiControlDevice)
end --if


if stateData:hasProperty("midiInDeviceChannel") then
    sessionMidiInDeviceChannel = stateData:getProperty("midiInDeviceChannel")
    panel:setProperty("panelMidiInputChannelDevice",sessionMidiInDeviceChannel)
end --if

if stateData:hasProperty("midiOutDeviceChannel") then
    sessionMidiOutDeviceChannel = stateData:getProperty("midiOutDeviceChannel")
    panel:setProperty("panelMidiOutputChannelDevice",sessionMidiOutDeviceChannel)
end --if

if stateData:hasProperty("midiControlDeviceChannel") then
    sessionMidiControlDeviceChannel = stateData:getProperty("midiControlDeviceChannel")
    panel:setProperty("panelMidiControllerChannelDevice",sessionMidiControlDeviceChannel)
end --if

if stateData:hasProperty("midiInputFromHost") then
    sessionMidiInputFromHost = stateData:getProperty("midiInputFromHost")
    panel:setProperty("panelMidiInputFromHost",sessionMidiInputFromHost)
end --if

if stateData:hasProperty("midiInputFromHostChannel") then
    sessionMidiInputFromHostChannel = stateData:getProperty("midiInputFromHostChannel")
    panel:setProperty("panelMidiInputChannelHost",sessionMidiInputFromHostChannel)
end --if

if stateData:hasProperty("midiOutputToHost") then
    sessionMidiOutputToHost = stateData:getProperty("midiOutputToHost")
    panel:setProperty("panelMidiOutputToHost",sessionMidiOutputToHost)
end --if

if stateData:hasProperty("midiOutputToHostChannel") then
    sessionMidiOutputToHostChannel = stateData:getProperty("midiOutputToHostChannel")
    panel:setProperty("panelMidiOutputChannelHost",sessionMidiOutputToHostChannel)
end --if

if stateData:hasProperty("midiThruH2H") then
    sessionMidiThruH2H = stateData:getProperty("midiThruH2H")
    panel:setProperty("panelMidiThruH2H",sessionMidiThruH2H)
end --if

if stateData:hasProperty("midiThruH2HChannel") then
    sessionMidiThruH2HChannel = stateData:getProperty("midiThruH2HChannel")
    panel:setProperty("panelMidiThruH2HChannelize",sessionMidiThruH2HChannel)
end --if

if stateData:hasProperty("midiThruH2D") then
    sessionMidiThruH2D = stateData:getProperty("midiThruH2D")
    panel:setProperty("panelMidiThruH2D",sessionMidiThruH2D)
end --if

if stateData:hasProperty("midiThruH2DChannel") then
    sessionMidiThruH2DChannel = stateData:getProperty("midiThruH2DChannel")
    panel:setProperty("panelMidiThruH2DChannelize",sessionMidiThruH2DChannel)
end --if

if stateData:hasProperty("midiThruD2D") then
    sessionMidiThruD2D = stateData:getProperty("midiThruD2D")
    panel:setProperty("panelMidiThruD2D",sessionMidiThruD2D)
end --if

if stateData:hasProperty("midiThruD2DChannel") then
    sessionMidiThruD2DChannel = stateData:getProperty("midiThruD2DChannel")
    panel:setProperty("panelMidiThruD2DChannelize",sessionMidiThruD2DChannel)
end --if

if stateData:hasProperty("midiThruD2H") then
    sessionMidiThruD2H = stateData:getProperty("midiThruD2H")
    panel:setProperty("panelMidiThruD2H",sessionMidiThruD2H)
end --if

if stateData:hasProperty("midiThruD2HChannel") then
    sessionMidiThruD2HChannel = stateData:getProperty("midiThruD2HChannel")
    panel:setProperty("panelMidiThruD2HChannelize",sessionMidiThruD2HChannel)
end --if


loadAllBanks()

end
```