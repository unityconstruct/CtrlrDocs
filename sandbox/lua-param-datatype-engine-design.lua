#!/usr/bin/lua



MidiParameterDataType = {
    "PARAM_128VALUE_-64_63",
    "PARAM_128VALUE_0_127",
    "PARAM_128VALUE_1_128"
}

PackingStrategy = {
    "BIT7_MSB_LSB",
    "BIT7_LSB_MSB"
}


CtrlrMidiParameter = {
    PARAM_NAME = "DEFAULT",
    PARAM_ID = "2580",
    PARAM_DATA_TYPE = MidiParameterDataType.PARAM_128VALUE_0_127,
    PARAM_VALUE = 15,
}


CtrlrMidiParameterPackage = {
    Parameters = CtrlrMidiParameter{},
    PackingStrategyToHardware = PackingStrategy.BIT7_MSB_LSB,
    PackingStrategyToCtrlr = PackingStrategy.BIT7_LSB_MSB
}

CtrlrMidiCommDirection = {
    "ToHardware",
    "ToCtrlr"
}

--CtrlrMidiParameterPackage
--CtrlrMidiCommDirection

---Convert Parameters to a MidiMessage using a CtrlrMidiParameterPackage containing one or more parameters and a comm direction
---function will call needed conversion function based on the Package's PackagingStrategy, direction, number & datatypes of the parameter
---@param package CtrlrMidiParameterPackage
---@param direction CtrlrMidiCommDirection
function CtrlrMidiPackagerConvert( package, direction )
    sendto = direction
    sendto = CtrlrMidiCommDirection.ToCtrlr
    -- call MidiParameterPackerPrep(package) -- to get PackingStrategy & direction
    -- foreach CtrlrMidiParameter in package -- to translate Parameter VALUE to its MidiParameterDataType used for communication
      -- paramHexValues[i] = call MidiParameterPacker(package.Parameters.Count)
    -- end
    -- midiPayload = call MidiPackage(paramHexValues)
    -- call MidiSend(midiPayload)
end
