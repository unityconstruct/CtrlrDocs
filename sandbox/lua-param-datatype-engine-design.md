# Parameter DataType Engine Design

- is there a finite set of methods for parameters?
- while there are many ways parameters can be packed for hardware with tons of parameters to account for
  - aren't there a finite number of methods used?
  - for example:
    - a unit might pack multiple parameters in groups of 3,4,5,6
    - each of these groups might be packed in the same way such that once knowing:
      - PARAM_ID
      - PARAM_DATA_TYPE
      - PARAM_VALUE_MIN
      - PARAM_VALUE_MAX
      - MIDI_PACKING_STRATEGY_TYPE
      - MIDI_PACKING_STATEGY_PARAM_COUNT
    - Seems that even if the number of parameters packed changes, 
      - the number of strategy types, param counts, and MIDI bit count are finite
      - and once the logic is created for packing ADSR Voice1
      - the same logic is used for ADSR Voice1

### Data Normalization & Supporting Objects

#### hardware comm type
- This table enumerates the shuttle in which parameters are carried to/from a destination/source
- it doesn't care about about the parameter values/data type
- only cares about what Chinese Math to use & how many params there are

| MIDI_COMM_BITS | MIDI_PACKING_STRATEGY_TYPE | MIDI_PACKING_STATEGY_PARAM_COUNT | 
| - | - | - |
| 7 | A | 1 |
| 7 | A | 2 |
| 7 | A | 3 |
| 7 | A | 4 |
| 7 | A | 5 |

#### the parameter
- the parameter doesn't care about the package, only its DataType & value
- the Type determins the Chinese Math to convert VALUE in the UI & what needs to be stuffed in the pacakge

| PARAM_ID | PARAM_DATA_TYPE | PARAM_VALUE_MIN | PARAM_VALUE_MAX |
| - | - | - | - |
| VOICE1_FILTER_CUTOFF | PARAM_128VALUE_-64_63 | -64 | 63  |
| VOICE1_FILTER_RESONANCE | PARAM_128VALUE_0_127 | 0 | 127  |
| VOICE1_FILTER_TYPE | PARAM_128VALUE_1_128 | 1 | 128  |


#### the objects
- so things are broken up by Possibilities
  - and Objects combine those Possibilities into a Definition
- The Conversion engine parses these, applies the Chinese Math using A LIBRARY of Packing routines
- This works GREAT!! IF the number of routines is finite.
- If the number of methods of packing only ever handles 1-10 parameters, then that's 10 routines.. it doesn't care about translating UI VALUE to MIDI MESSAGE DATA TYPE
  - nor what destintation params are bundled

### Mockup
- the varieties might be near infinite, if so, second best case is maybe theres 20 different types that account for 80%... 
- might be laughable, but just throwing it out there for a feasibilty check.
- I don't know what the options are, nor the calculations, but wiring up the DataStructs, Objects and Methods seems fairly straight forward.
- If it is broken down into modular pieces, no one piece is doing more than one or two calculations - that themselves are in objects or a function lib.

```lua

--- Enum for the Parameter's  Real-World MIN/MAX values
MidiParameterDataType = {
    "PARAM_128VALUE_-64_63",
    "PARAM_128VALUE_0_127",
    "PARAM_128VALUE_1_128"
}

--- Enum for Hardwards Packing Logic type
PackingStrategy = {
    "BIT7_MSB_LSB",
    "BIT7_LSB_MSB",
    "BIT7_LSB_MSB_1_PARAMS",
    "BIT7_LSB_MSB_2_PARAMS",
    "BIT7_LSB_MSB_3_PARAMS",
    "BIT7_LSB_MSB_4_PARAMS"
}

--- Enum for Comm Direction
CtrlrMidiCommDirection = {
    "ToHardware",
    "ToCtrlr"
}

--- MidiParameter Object
CtrlrMidiParameter = {
    PARAM_NAME = "DEFAULT",
    PARAM_ID = "2580",
    PARAM_DATA_TYPE = MidiParameterDataType.PARAM_128VALUE_0_127,
    PARAM_VALUE = 15,
}

--- MidiMessage Package containing MidiParameterObjects
CtrlrMidiParameterPackage = {
    Parameters = CtrlrMidiParameter{},
    PackingStrategyToHardware = PackingStrategy.BIT7_MSB_LSB,
    PackingStrategyToCtrlr = PackingStrategy.BIT7_LSB_MSB_3_PARAMS
}


--[[
    DO THE CONVERSION..!! WORK THAT MAGIC!!! I DON'T CARE WHAT IT DOES!! I GAVE IT CORRECT VALUES!!!
--]]

---Convert Parameters to a MidiMessage using a CtrlrMidiParameterPackage containing one or more parameters and a comm direction
---function will call needed conversion function based on the Package's PackagingStrategy, direction, number & datatypes of the parameter
---@param package CtrlrMidiParameterPackage
---@param direction CtrlrMidiCommDirection
function CtrlrMidiPackagerConvert( package, direction )
    -- call MidiParameterPackerPrep(package) -- to get PackingStrategy & direction
    -- foreach CtrlrMidiParameter in package -- to translate Parameter VALUE to its MidiParameterDataType used for communication
      -- paramHexValues[i] = call MidiParameterPacker(package.Parameters.Count)
    -- end
    -- midiPayload = call MidiPackage(paramHexValues)
    -- call MidiSend(midiPayload)
end



-- CtrlrMidiParameterDataTypeConversionType = {
--     PARAM_DATA_TYPE = "", 
--     MIDI_PACKING_STRATEGY_TYPE = CtrlrMidiParameterPackage.PackingStrategyToCtrlr
-- }






-- MidiParamterMinMaxType = {
--     "MIN__64_MAX63",
--     "MIN0_MAX127,
--     "MIN1_MAX128"

-- }
```


