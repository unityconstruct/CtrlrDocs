--­­
--­­ Called when the panel has finished loading
--­­
--­­ @type the type of instance beeing started, types available in the CtrlrPanel
--­­ class as enum
--­­
--­­ InstanceSingle
--­­ InstanceMulti
--­­ InstanceSingleRestriced
--­­ InstanceSingleEngine
--­­ InstanceMultiEngine
--­­ InstanceSingleRestrictedEngine
--­­
myInit = function(--[[ CtrlrInstance --]] type)
    local dump_request = L(panel:getLabel("LSYSEXREQ"):getText())
    if string.len(dump_request) == 0 then
        panel:getLabel("LSYSEXREQ"):setText("Enter in sysex command for dump request")
    end

    _globVar =
        setmetatable(
        {},
        {
            __index = function(t, k)
                local value = 0
                if k == "startrecording" then
                    value = false
                end

                t[k] = value
                return t[k]
            end
        }
        )
    panel:getComponent("RECORD"):setProperty("uiButtonTextColourOn","ff000000",true)
    panel:getComponent("RECORD"):setProperty("uiButtonTextColourOff","ff000000",true)
end


function myGetGlobalVariable(var)
    return _globVar[var]
end -- ­­function

function mySetGlobalVariable(var,value)
    _globVar[var]=value
end -- ­­function


--­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
--­­ Called when a mouse is down on this component
--­­
start_recording = function(--[[ CtrlrComponent ­­--]] comp, --[[ MouseEvent ­­--]] event)
    if (panel:getBootstrapState() ) then
        return
    end
    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return
    end

    mySetGlobalVariable("startrecording",true)
    comp:setProperty("uiButtonTextColourOn","ffff0000",true)
    comp:setProperty("uiButtonTextColourOff","ffff0000",true)
    panel:getLabel("LSTATUSBAR"):setText("Waiting....")
end

--­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
-- Called when a mouse is down on this component
--
save_to_computer = function(--[[ CtrlrComponent ­­--]] comp, --[[ MouseEvent --]] event)
    if panel:getBootstrapState() then
        return
    end
    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return
    end

    if m:getSize() > 0 then
        saveToFile(m)
    else
        panel:getLabel("LSTATUSBAR"):setText("Nothing to save!")
    end
end

-- save memoryBlock to .syx file
function saveToFile(dataToSave) 
    if panel:getBootstrapState() then
        return
    end
    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return
    end

    file = utils.saveFileWindow("Save file",File.getSpecialLocation(File.userDesktopDirectory), "*.syx", true)
    if file:hasWriteAccess() then
        file:replaceWithData(dataToSave)
        panel:getLabel("LSTATUSBAR"):setText("Saved \187 " .. m:getSize() .. " bytes to sysex file ")
    end
end -- ­­function
--­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
--­­ Called when the panel is created, no modulators will exist
--at this point
--­­ consider this the panels constructor
constructor = function()
    m = MemoryBlock() -- failsafe initialization should be overridden in Loadstate
end

-- Called when data is restored
load_state = function(--[[ ValueTree ­­--]] stateData)
    savedHexString = stateData:getProperty("saveHexStringData")

    if savedHexString ~= nil and savedHexString ~= "" then
        m = MemoryBlock()
        m:loadFromHexString(savedHexString)
        panel:getLabel("LIN"):setText(savedHexString)
        panel:getLabel("LSTATUSBAR"):setText("Initialised bufer ".. m:getSize() .. "bytes")
        panel:getLabel("LBUFF"):setText(m:getSize() .. " bytes")
    else
        m = MemoryBlock()
        panel:getLabel("LBUFF"):setText(m:getSize() .. " bytes")
        panel:getLabel("LSTATUSBAR"):setText("No data saved. Initialised buffer")
    end
end

-- Called when data needs saving
save_state = function(--[[ ValueTree --]] stateData)
    if m:getSize() > 0 then
        stateData:setProperty("saveHexStringData",
        m:toHexString(1), nil)
    end
end


-- Called when a mouse is down on this component
stop_recording = function(--[[ CtrlrComponenT --]] comp, --[[ MouseEvent --]] event)
    if panel:getBootstrapState() then
        return
    end

    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return 
    end
    mySetGlobalVariable("startrecording",false)
    panel:getComponent("RECORD"):setProperty("uiButtonTextColourOn","ff000000",true)
    panel:getComponent("RECORD"):setProperty("uiButtonTextColourOff","ff000000",true)
    panel:getLabel("LSTATUSBAR"):setText("recording MIDI stopped")
end



-- Called when a panel receives a midi message (does not need to match any modulator mask)
-- @midi CtrlrMidiMessage object
myMidiReceived = function((--[[ CtrlrMidiMessage --]] midi)
    if panel:getBootstrapState() then
        return
    end
    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return
    end

    if (midi:getType() == 5) then -- it is a sysex message 
        if myGetGlobalVariable("startrecording") == true then
            m:append(midi:getLuaData())
            panel:getLabel("LBUFF"):setText(m:getSize() .. " bytes")
            panel:getLabel("LIN"):setText(m:toHexString(1))
            panel:getLabel("LSTATUSBAR"):setText("Received \187 " .. m:getSize() .. " bytes")
        end
    end
end

-- Called when a mouse is down on this component
clear_buffer = function( --[[ CtrlrComponent --]] comp, --[[ MouseEvent --]] event)
    if panel:getBootstrapState() then
        return
    end
    if panel:getRestoreState() == true or panel:getProgramState() == true then
        return
    end
    m = MemoryBlock() -- clear the MemoryBlock
    panel:getLabel("LBUFF"):setText("0 bytes")
    panel:getLabel("LIN"):setText("")
    panel:getLabel("LSTATUSBAR"):setText("Initialised buffer to 0 bytes")
end













