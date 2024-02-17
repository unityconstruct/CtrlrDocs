#!/usr/local/bin

-- -- || F0 || 18 0F | 00 55 || 01 02 || F7 ||
-- local EMUHeader = "F0 18 0F"  -- Ensoniq DP4 Header
-- local MidiID = "00"  -- Midi Device ID
-- local SpecialDesignator = "55"
-- local SysExHeader = string.format('%s %s %s', EMUHeader, MidiID, SpecialDesignator)

-- print(tostring(SysExHeader))
--[[
    SysEx = {
        SYSEX_SOX = "F0",
        SYSEX_EOX = "F7"
    }
    
    function SysEx:new ()
        setmetatable({},SysEx)
        self.EMUHeader = "F0 18 0F"
        self.MidiID = "00"
        self.SpecialDesignator = "55"
  self.SYSEX_PRE = "F0 18 0F 00 55"
  self.SYSEX_PARAM_SET = "01 02"
  self.SYSEX_COMMAND = "00 00 00"
  return self
end
]]--

-- global parameters class
Params = { id = "Params" }

SysexParamLayers = {
    ParamId = "898",
    Command = "02 07",
    MinVale = "0",
    MaxValue = "3",
    Layer1 = "00 00",
    Layer2 = "01 00",
    Layer3 = "02 00",
    Layer4 = "03 00",
}

SysexParams = {
    Layers = SysexParamLayers,
    id = 1
}

function Params:new()
    setmetatable({},Params)
    return self
end

-- access Params:LayerSelect values
function Params:LayerSelect()
  setmetatable({},Params)
  self.SYSEX_898_LayerSelect = "02 07"
  self.Layer1 = "00 00"
  self.Layer2 = "01 00"
  self.Layer3 = "02 00"
  self.Layer4 = "03 00"
  self.MidiValue = function(value) return self.Layer4 .. tostring(value) end
  self.enumLayer = {
      "Layer1",
      "Layer2",
      "Layer3",
      "Layer4"
    }
  self.CurrentLayer = self.enumLayer[1]
  return self
end


p = Params:new()
print(p.SYSEX_898_LayerSelect)
l = SysexParamLayers
print(l.Layer1)
sl = SysexParams.Layers.Layer1
print(sl)

--[[

    enumLayer = {
        "Layer1",
        "Layer2",
        "Layer3",
        "Layer4"
    }
]]--

CommandId = {
    ParamSet = "01 02"
}

-- add all the param commands
ParamId = {}
ParamId[898] = "02 07"

-- sysex messaging data helper object
SysEx = { id = "SysEx" }

-- transforms SysEx table in to a psuedo class
function SysEx:new ()
  setmetatable({},SysEx) -- this is what does the transform

  self.SYSEX_SOX = "F0"
  self.SYSEX_EOX = "F7"
  self.EMUHeader = "F0 18 0F"
  self.MidiID = "00"
  self.SpecialDesignator = "55"
  self.SYSEX_PRE = "F0 18 0F 00 55"
  self.SYSEX_COMMAND_PARAM_VALUE_EDIT = "01 02"
  self.SYSEX_COMMAND_PARAM_VALUE_REQUEST = "02 01"
  self.SYSEX_COMMAND_PARAM_MINMAX_REQUEST = "04"
  self.SYSEX_COMMAND = "00 00 00"
  self.SYSEX_897 = "01 07" 
  self.SYSEX_897_PresetSelect = "01 07"
  self.SYSEX_898 = ParamId[898]
  self.ParamId = ParamId
  self.CommandId = CommandId
  self.SYSEX_898_LayerSelect = "02 07"
  self.Params = Params
  self.BuildMessage =
    function(commandId, paramId, valueHexString)
        return string.format('%s %s %s %s %s',
            self.SYSEX_PRE,
            tostring(commandId),
            self.ParamId[paramId],
            tostring(valueHexString),
            self.SYSEX_EOX
        )
    end

  return self
end
--syx.Params:LayerSelect().SYSEX_898_LayerSelect,
--self.Params:LayerSelect().Layer1,

-- manually setting the command value, but easier to build up classes
function SysEx:addCommand(hexstring)
    setmetatable({},SysEx)
    self.SYSEX_COMMAND = tostring(hexstring)
end

-- main code
local syx = SysEx:new()
print(syx.SYSEX_EOX)
syx:addCommand("00 11 FF")
print(syx.SYSEX_COMMAND)
print(string.format('%s %s',syx.SYSEX_898_LayerSelect, syx.Params:LayerSelect().Layer1))
print(string.format('%s %s %s %s %s',
    syx.SYSEX_PRE,
    syx.CommandId.ParamSet,
    syx.ParamId[898],
    --syx.Params:LayerSelect().SYSEX_898_LayerSelect,
    syx.Params:LayerSelect().Layer1,
    syx.SYSEX_EOX
    ))

    print("BUILD MESSAGE: "..syx.BuildMessage(CommandId["ParamSet"],898,syx.Params.Layer1))
print("BUILD MESSAGE: "..syx.BuildMessage(CommandId["ParamSet"],898,syx.Params.Layer2))
print("BUILD MESSAGE: "..syx.BuildMessage(CommandId["ParamSet"],898,syx.Params.Layer3))
print("BUILD MESSAGE: "..syx.BuildMessage(CommandId["ParamSet"],898,syx.Params.Layer4))

print(syx.Params:LayerSelect().CurrentLayer)
syx.Params:LayerSelect().CurrentLayer = syx.Params.enumLayer[2]
print(syx.Params.CurrentLayer)
print(syx.Params.MidiValue("newvalue"))


--[[ gfind
    words = {}
    for w in string.gfind(s, "%a") do
        table.insert(words, w)
    end
]]--

--[[

    buildSysexTable = function ()
        local t = {
            EMUHeader = "F0 18 0F",
            MidiID = "00",
            SpecialDesignator = "55",
            SYSEX_PRE = "F0 18 0F 00 55",
            SYSEX_EOX = "F7",
            SYSEX_PARAM_SET = "01 02"
        }
        return t
    end
    local tbl = buildSysexTable()
    print(tbl.SYSEX_PRE)
]]--

--[[
    table.
    table.insert(t,(SYSEX_PRE = string.format('%s %s %s', t.EMUHeader, t.MidiID, t.pecialDesignator))
    -- || F0 || 18 0F | 00 55 || 01 02 || F7 ||
    local EMUHeader = "F0 18 0F"  -- Ensoniq DP4 Header
    local MidiID = "00"  -- Midi Device ID
    local SpecialDesignator = "55"
    SYSEX_PRE = string.format('%s %s %s', EMUHeader, MidiID, SpecialDesignator)
    SYSEX_EOX = "7F"
    SYSEX_PARAMSET = "01 02"
]]--
