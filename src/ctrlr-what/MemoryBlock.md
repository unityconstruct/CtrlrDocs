# MemoryBlock

## Memory Block Functions
| Function Name | Comment |
| - | - |
|getData |	function |
|setBitRange |	function |
|getByte |	function |
|loadFromHexString |	function |
|toHexString |	function |
|insertIntoTable |	function |
|setSize |	function |
|fillWith |	function |
|insert |	function |
|setByte |	function |
|getSize |	function |
|getRange |	function |
|removeSection |	function |
|createFromTable |	function |
|swapWith |	function |
|ensureSize |	function |
|getBitRange |	function |
|copyTo |	function |
|replaceWith |	function |
|__init |	function |
|copyFrom |	function |
|toString |	function |
|append |	function |
|fromBase64Encoding |	function |
|toBase64Encoding |	function |
|toLuaTable |	function |


## what() Output
```
>>> what(mb)
Object type [MemoryBlock]
-----------------------------------------------------------------

Members:
	                       getData:	function
	                   setBitRange:	function
	                       getByte:	function
	             loadFromHexString:	function
	                   toHexString:	function
	               insertIntoTable:	function
	                       setSize:	function
	                      fillWith:	function
	                        insert:	function
	                       setByte:	function
	                       getSize:	function
	                      getRange:	function
	                 removeSection:	function
	               createFromTable:	function
	                      swapWith:	function
	                    ensureSize:	function
	                   getBitRange:	function
	                        copyTo:	function
	                   replaceWith:	function
	                        __init:	function
	                      copyFrom:	function
	                      toString:	function
	                        append:	function
	            fromBase64Encoding:	function
	              toBase64Encoding:	function
	                    toLuaTable:	function


Attributes:

-----------------------------------------------------------------
```

## Command Station Init Messages

```lua
function initMidiHandshake()
  local midiDeviceInquiry = "F0 7E 00 06 01 F7"
  local midiParam_DelaySet = "F0 18 0F 00 55 01 02 15 03 20 01 F7"
  local midiHWConfigRequest = "F0 18 0F 00 55 0A F7"
  local midiDumpAck = "F0 18 0F 00 55 7F 00 00 F7"
  local midiSetupDumpRequest = "F0 18 0F 00 55 1D F7"
  local midiMULTIMODE_CHANNEL_SELECT = "F0 18 0F 00 55 01 02 01 01 00 00 F7"
  local midiMULTIMODE_BASIC_CHANNEL = "F0 18 0F 00 55 01 02 0B 01 00 00 F7"
  local midiPresetDumpRequest = "F0 18 0F 00 55 11 02 03 01 00 00 F7  "
  local midiDumpAck00 = "F0 18 0F 00 55 7F 00 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 10 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 20 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 30 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 40 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 50 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 60 00 F7"
  local midiDumpAck00 = "F0 18 0F 00 55 7F 70 00 F7"
  local midiParamROM_ID = "F0 18 0F 00 55 01 02 0A 01 00 00 F7"
  local midiPRESET_SELECT = "F0 18 0F 00 55 01 02 01 07 7F 7F F7"
--pause("debugging")

-- Device Inquiry
panel:sendMidiMessageNow(CtrlrMidiMessage(MemoryBlock(midiDeviceInquiry)))
end

```

## Functions
getData
setBitRange
getByte
loadFromHexString
toHexString
insertIntoTable
setSize
fillWith
insert
setByte
getSize
getRange
removeSection
createFromTable
swapWith
ensureSize
getBitRange
copyTo
replaceWith
__init
copyFrom
toString
append
fromBase64Encoding
toBase64Encoding
toLuaTable

