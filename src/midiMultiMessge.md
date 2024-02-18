# Sysex Midi Message Tables


## Sysex Token - Data Type 

| Type | Logic |
| -- | -- |
| ByteValue: | *byte = (uint8)value; |
| ByteChannel: | *byte = (uint8)jlimit (0,15, channel-1); |
| LSB7bitValue: | *byte = (uint8)(value & 127); |
| MSB7bitValue: | *byte = (uint8)(value >> 7); |
| ByteChannel4Bit: | bi = BigInteger ((uint8)jlimit (0,15, channel-1)); <br/> bi.setBitRangeAsInt (4, 3, token.getAdditionalData());<br/> *byte = (uint8)bi.getBitRangeAsInt(0,7); |
| GlobalVariable: if (getGlobalVariables() [token.getAdditionalData()] >= 0) | *byte = (uint8)getGlobalVariables() [token.getAdditionalData()]; |
| LSB4bitValue: | *byte = (uint8)(value & 0xf); |
| MSB4bitValue: | *byte = (uint8)((value >> 4) & 0xf); |
| RolandSplitByte1: | *byte = getRolandSplit (value, 1); |
| RolandSplitByte2: | *byte = getRolandSplit (value, 2); |
| RolandSplitByte3: | *byte = getRolandSplit (value, 3); |
| RolandSplitByte4: | *byte = getRolandSplit (value, 4); |
| CurrentProgram: | None |
| CurrentBank: | None | 
| Ignore: | None | 
| ChecksumRolandJP8080: | None | 
| ChecksumWaldorfRackAttack: | None | 
| FormulaToken: | None | 
| LUAToken: | None |
| NoToken: | None |

### CtrlrSysexProcessor::sysExProcessToken : CtrlrSysexProcessor.cpp

```cpp
void CtrlrSysexProcessor::sysExProcessToken (const CtrlrSysexToken token, uint8 *byte, const int value, const int channel)
{
	if (byte == NULL)
		return;

	BigInteger bi;

	switch (token.getType())
	{
		case ByteValue:
			*byte = (uint8)value;
			break;

		case ByteChannel:
			*byte = (uint8)jlimit (0,15, channel-1);
			break;

		case LSB7bitValue:
			*byte = (uint8)(value & 127);
			break;

		case MSB7bitValue:
			*byte = (uint8)(value >> 7);
			break;

		case ByteChannel4Bit:
			bi = BigInteger ((uint8)jlimit (0,15, channel-1));
			bi.setBitRangeAsInt (4, 3, token.getAdditionalData());
			*byte = (uint8)bi.getBitRangeAsInt(0,7);
			break;

		case GlobalVariable:
			if (getGlobalVariables() [token.getAdditionalData()] >= 0)
				*byte = (uint8)getGlobalVariables() [token.getAdditionalData()];
			break;

		case LSB4bitValue:
			*byte = (uint8)(value & 0xf);
			break;

		case MSB4bitValue:
			*byte = (uint8)((value >> 4) & 0xf);
			break;

		case RolandSplitByte1:
			*byte = getRolandSplit (value, 1);
			break;

		case RolandSplitByte2:
			*byte = getRolandSplit (value, 2);
			break;

		case RolandSplitByte3:
			*byte = getRolandSplit (value, 3);
			break;

		case RolandSplitByte4:
			*byte = getRolandSplit (value, 4);
			break;

        case CurrentProgram:
        case CurrentBank:
		case Ignore:
		case ChecksumRolandJP8080:
		case ChecksumWaldorfRackAttack:
		case FormulaToken:
		case LUAToken:
		case NoToken:
			break;
	}
}

```







## MultiMessage - Token[0]

| Type | Message |
| - | - |
| CC 	| MidiMessage::controllerEvent (ch,number,value); |
| Aftertouch 	| MidiMessage::aftertouchChange (ch,number,value); |
| NoteOn 	| MidiMessage::noteOn (ch,number,(uint8)value); |
| NoteOff 	| MidiMessage::noteOff (ch,number,(uint8)value); |
| ChannelPressure 	| MidiMessage::channelPressureChange (ch,value); |
| ProgramChange 	| MidiMessage::programChange(ch,value); |
| SysEx | CtrlrSysexProcessor::sysexMessageFromString(tokens[5], value, ch)); |


### CtrlrMidiMessageEx midiMessageExfromString | CtrlrUtilities.ccp

```lua
const CtrlrMidiMessageEx midiMessageExfromString (const String &str, const int ch, const int number, const int value)
{
	CtrlrMidiMessageEx ret;
	StringArray tokens;

	tokens.addTokens (str, ",", "\"\'");

	if (tokens.size() >= 5)
	{
		ret.indirectNumberFlag	= indirectFromString (tokens[1]);
		ret.indirectValueFlag	= indirectFromString (tokens[2]);
		ret.overrideNumber		= tokens[3].getIntValue();
		ret.overrideValue		= tokens[4].getIntValue();

		if (tokens[0] == "CC")
			ret.m				= MidiMessage::controllerEvent (ch,number,value);
		if (tokens[0] == "Aftertouch")
			ret.m				= MidiMessage::aftertouchChange (ch,number,value);
		if (tokens[0] == "NoteOn")
			ret.m				= MidiMessage::noteOn (ch,number,(uint8)value);
		if (tokens[0] == "NoteOff")
			ret.m				= MidiMessage::noteOff (ch,number,(uint8)value);
		if (tokens[0] == "ChannelPressure")
			ret.m				= MidiMessage::channelPressureChange (ch,value);
		if (tokens[0] == "ProgramChange")
			ret.m				= MidiMessage::programChange(ch,value);

		if (tokens[0] == "SysEx")
		{
			return (CtrlrSysexProcessor::sysexMessageFromString(tokens[5], value, ch));
		}

		ret.setNumber(number);
		ret.setValue(value);
		return (ret);
	}
	else
	{
	    jassertfalse; // Looks like there is not enough tokens to create a CtrlrMidiMessageEx object
		return (CtrlrMidiMessageEx());
	}
}
```



## MidiMessage NRPN Token[4] Note

- `-1,-2` is stored in a token array at index[4]
- function serves as an override for how the message is handled: `NRPN ID` v.s. a `NRPN VALUE`
```
CC,ByteValue,MSB7bitValue,99,-2
CC,ByteValue,LSB7bitValue,98,-2
CC,ByteValue,MSB7bitValue,6,-1
CC,ByteValue,LSB7bitValue,38,-1
```

  - if `-2`
```cpp
bl = MemoryBlock(messageArray.getReference(i).m.getRawData(), messageArray.getReference(i).m.getRawDataSize());
```
  - else
```cpp
bl = midiMessagePattern(messageArray.getReference(i), messageArray.getReference(i).getTokenArray(), getGlobalVariables());
```

### CtrlrMidiMessageEx midiMessageExfromString | CtrlrUtilities.ccp

`ret.overrideValue		= tokens[4].getIntValue();`

```lua
const CtrlrMidiMessageEx midiMessageExfromString (const String &str, const int ch, const int number, const int value)
{
	CtrlrMidiMessageEx ret;
	StringArray tokens;

	tokens.addTokens (str, ",", "\"\'");

	if (tokens.size() >= 5)
	{
		ret.indirectNumberFlag	= indirectFromString (tokens[1]);
		ret.indirectValueFlag	= indirectFromString (tokens[2]);
		ret.overrideNumber		= tokens[3].getIntValue();
		ret.overrideValue		= tokens[4].getIntValue();

		if (tokens[0] == "CC")
			ret.m				= MidiMessage::controllerEvent (ch,number,value);
		if (tokens[0] == "Aftertouch")
			ret.m				= MidiMessage::aftertouchChange (ch,number,value);
		if (tokens[0] == "NoteOn")
			ret.m				= MidiMessage::noteOn (ch,number,(uint8)value);
		if (tokens[0] == "NoteOff")
			ret.m				= MidiMessage::noteOff (ch,number,(uint8)value);
		if (tokens[0] == "ChannelPressure")
			ret.m				= MidiMessage::channelPressureChange (ch,value);
		if (tokens[0] == "ProgramChange")
			ret.m				= MidiMessage::programChange(ch,value);

		if (tokens[0] == "SysEx")
		{
			return (CtrlrSysexProcessor::sysexMessageFromString(tokens[5], value, ch));
		}

		ret.setNumber(number);
		ret.setValue(value);
		return (ret);
	}
	else
	{
	    jassertfalse; // Looks like there is not enough tokens to create a CtrlrMidiMessageEx object
		return (CtrlrMidiMessageEx());
	}
}
```

### CtrlrMidiMessage::patternChanged() : CtrlrMidiMessage.cpp

```lua

void CtrlrMidiMessage::patternChanged()
{
	messagePattern.setSize(0);

	for (int i=0; i<messageArray.size(); i++)
	{
		MemoryBlock bl(0);
		if (messageArray.getReference(i).overrideValue == -2)
		{
			bl = MemoryBlock(messageArray.getReference(i).m.getRawData(), messageArray.getReference(i).m.getRawDataSize());
		}
		else
		{
			bl = midiMessagePattern(messageArray.getReference(i), messageArray.getReference(i).getTokenArray(), getGlobalVariables());
		}

		messagePattern.append (bl.getData(), bl.getSize());
	}
}
```

### CtrlrMidiMessage::fillMessagePropertiesFromData : 

```lua
Result CtrlrMidiMessage::fillMessagePropertiesFromData()
{
	if (messageArray.size() == 0)
	{
		setProperty (Ids::midiMessageType, (uint8)None);
		setProperty (Ids::midiMessageChannelOverride, false);
		setProperty (Ids::midiMessageChannel, 1);
		setProperty (Ids::midiMessageCtrlrNumber, 1);
		setProperty (Ids::midiMessageCtrlrValue, 0);
		setProperty (Ids::midiMessageMultiList, "");
		setProperty (Ids::midiMessageSysExFormula, "");

		return (Result::fail("MessageArray is empty, initializing to empty NONE message"));
	}
	else
	{
		return (fillMessagePropertiesFromData( MemoryBlock (messageArray[0].m.getRawData(), messageArray[0].m.getRawDataSize()) ));
	}
}
```

<hr/>

## Sysex token[ ? ]

`*` = one or more ANY characters

| token | type |
|-- | -- |
| xx | ByteValue |
| yy | ByteChannel |
| LS | LSB7bitValue |
| MS | MSB7bitValue |
| ii | Ignore |
| ls | LSB4bitValue |
| ms | MSB4bitValue |
| r1 | RolandSplitByte1 |
| r2 | RolandSplitByte2 |
| r3 | RolandSplitByte3 |
| r4 | RolandSplitByte4 |
| tp | CurrentProgram |
| tb | CurrentBank |
| *y | ByteChannel4Bit |
| z* | ChecksumRolandJP8080 |
| w* | ChecksumWaldorfRackAttack |
| u* | LUAToken |
| v* | FormulaToken |
| k*, p*, n*, o* | GlobalVariable |

### CtrlrSysExFormulaToken CtrlrSysexProcessor::sysExIdentifyToken | CtrlrSysexProcessor.cpp

```cpp
CtrlrSysExFormulaToken CtrlrSysexProcessor::sysExIdentifyToken(const String &s)
{
	if (s == "xx")
	{
		return (ByteValue);
	}
	if (s.endsWith("y") && !s.startsWith("y"))
	{
		return (ByteChannel4Bit);
	}
	if (s.startsWith("k") || s.startsWith("p") || s.startsWith("n") || s.startsWith("o"))
	{
		return (GlobalVariable);
	}
	if (s.startsWith("z"))
	{
		return (ChecksumRolandJP8080);
	}
	if (s.startsWith("w"))
	{
		return (ChecksumWaldorfRackAttack);
	}
	if (s.startsWith("u"))
	{
		return (LUAToken);
	}
	if (s.startsWith ("v"))
	{
		return (FormulaToken);
	}
	if (s == "yy")
	{
		return (ByteChannel);
	}
	if (s == "LS")
	{
		return (LSB7bitValue);
	}
	if (s == "MS")
	{
		return (MSB7bitValue);
	}
	if (s == "ii")
	{
		return (Ignore);
	}
	if (s == "ls")
	{
		return (LSB4bitValue);
	}
	if (s == "ms")
	{
		return (MSB4bitValue);
	}

	if (s == "r1")
	{
		return (RolandSplitByte1);
	}
	if (s == "r2")
	{
		return (RolandSplitByte2);
	}
	if (s == "r3")
	{
		return (RolandSplitByte3);
	}
	if (s == "r4")
	{
		return (RolandSplitByte4);
	}
	if (s == "tp")
	{
		return (CurrentProgram);
	}
	if (s == "tb")
	{
		return (CurrentBank);
	}
	return (NoToken);
}
```

## Label Formatters

| Token | Source |
| - | - |
| %N | modulator->getComponent()->getProperty(Ids::componentVisibleName).toString()); |
| %s | modulator->getComponent()->getComponentText()); |
| %v | String(modulator->getModulatorValue())); |
| %h | String::formatted ("%x", modulator->getModulatorValue())); |
| %x | modulator->getMidiMessage().toString()); |
| %g | modulator->getGroupName()); |

### labelFromProperty - CtrlrUtilities.cpp

```cpp

const String labelFromProperty (CtrlrModulator *modulator, const String &formatText)
{
	if (modulator == nullptr)
		return ("");

	String ret = formatText.replace ("%n", modulator->getName());
	if (modulator->getComponent())
	{
		ret = ret.replace ("%N", modulator->getComponent()->getProperty(Ids::componentVisibleName).toString());
		ret = ret.replace ("%s", modulator->getComponent()->getComponentText());
	}
	ret = ret.replace ("%v", String(modulator->getModulatorValue()));
	ret = ret.replace ("%h", String::formatted ("%x", modulator->getModulatorValue()));
	ret = ret.replace ("%x", modulator->getMidiMessage().toString());
	ret = ret.replace ("%g", modulator->getGroupName());

	return (ret);
}
```

## Sysex Token Formulae - IndirectOperation

| Type | Operation |
| - | - |
| LSB7bitValue | inValue & 127 |
| MSB7bitValue | inValue >> 7 |
| LSB4bitValue | inValue & 0xf |
| MSB4bitValue | (inValue >> 4) & 0xf |
| else |inValue |

### indirectOperation - CtrlrUtilities.cpp

```cpp
int	indirectOperation(const int inValue, const CtrlrSysExFormulaToken op)
{
	if (op == LSB7bitValue)
	{
		return (inValue & 127);
	}
	else if (op == MSB7bitValue)
	{
		return (inValue >> 7);
	}
	else if (op == LSB4bitValue)
	{
		return (inValue & 0xf);
	}
	else if (op == MSB4bitValue)
	{
		return ((inValue >> 4) & 0xf);
	}
	else
	{
		return (inValue);
	}
}
```

## SysEx Token Formulae - BigInteger

| Token | Operation |
| - | - |
| LSB7bitValue | i.setBitRangeAsInt(0, 7, inValue); return (i.getBitRangeAsInt(0, 7)); |
| MSB7bitValue | i.setBitRangeAsInt(7, 7, inValue); return (i.getBitRangeAsInt(0, 14)); |
| LSB4bitValue | i.setBitRangeAsInt(0, 4, inValue); return (i.getBitRangeAsInt(0, 8)); |
| MSB4bitValue | i.setBitRangeAsInt(4, 4, inValue); return (i.getBitRangeAsInt(0, 8)); |
| else |return (inValue); |


### indirectReverseOperation - CtrlrUtilities.cpp

```cpp
int indirectReverseOperation(const int inValue, const CtrlrSysExFormulaToken op)
{
	BigInteger i(0);
	if (op == LSB7bitValue)
	{
		i.setBitRangeAsInt(0, 7, inValue);
		return (i.getBitRangeAsInt(0, 7));
	}
	else if (op == MSB7bitValue)
	{
		i.setBitRangeAsInt(7, 7, inValue);
		return (i.getBitRangeAsInt(0, 14));
	}
	else if (op == LSB4bitValue)
	{
		i.setBitRangeAsInt(0, 4, inValue);
		return (i.getBitRangeAsInt(0, 8));
	}
	else if (op == MSB4bitValue)
	{
		i.setBitRangeAsInt(4, 4, inValue);
		return (i.getBitRangeAsInt(0, 8));
	}
	else
	{
		return (inValue);
	}
}
```


## Syex Token Formulae - BigInteger

| Token | Operation |
| - | - |
| LSB7bitValue | i.setBitRangeAsInt(0, 7, inValue); return (i.getBitRangeAsInt(0, 14)); |
| MSB7bitValue | i.setBitRangeAsInt(7, 7, inValue); return (i.getBitRangeAsInt(0, 14)); |
| LSB4bitValue | i.setBitRangeAsInt(0, 4, inValue); return (i.getBitRangeAsInt(0, 8)); |
| MSB4bitValue | i.setBitRangeAsInt(4, 4, inValue); return (i.getBitRangeAsInt(0, 8)); |
| else | return (BigInteger(inValue)); |


### getValueAsBigInteger - CtrlrUtilities.cpp

```cpp
const BigInteger getValueAsBigInteger(const int inValue, const CtrlrSysExFormulaToken op)
{
	BigInteger i(0);
	if (op == LSB7bitValue)
	{
		i.setBitRangeAsInt(0, 7, inValue);
		return (i.getBitRangeAsInt(0, 14));
	}
	else if (op == MSB7bitValue)
	{
		i.setBitRangeAsInt(7, 7, inValue);
		return (i.getBitRangeAsInt(0, 14));
	}
	else if (op == LSB4bitValue)
	{
		i.setBitRangeAsInt(0, 4, inValue);
		return (i.getBitRangeAsInt(0, 8));
	}
	else if (op == MSB4bitValue)
	{
		i.setBitRangeAsInt(4, 4, inValue);
		return (i.getBitRangeAsInt(0, 8));
	}
	else
	{
		return (BigInteger(inValue));
	}
}
```


## Sysex Formulae - GlobalVariable

| Token | AdditionalData Operation |
| - | - |
| o | tokenAdditionalData = 16 + _tokenAdditionalData;|
| p | tokenAdditionalData = 32 + _tokenAdditionalData;|
| n | tokenAdditionalData = 48 + _tokenAdditionalData;|
| k | tokenAdditionalData = _tokenAdditionalData;|
| else | None |


### CtrlrSysexToken.cpp

```cpp
void CtrlrSysexToken::setAdditionalData(const int _tokenAdditionalData)
{
	if (tokenType == GlobalVariable)
	{
		switch (tokenIdentifier)
		{
			case 'o':
				tokenAdditionalData = 16 + _tokenAdditionalData;
				break;
			case 'p':
				tokenAdditionalData = 32 + _tokenAdditionalData;
				break;
			case 'n':
				tokenAdditionalData = 48 + _tokenAdditionalData;
				break;
			case 'k':
				tokenAdditionalData = _tokenAdditionalData;
			default:
				break;
		}
	}
	else
	{
		tokenAdditionalData = _tokenAdditionalData;
	}
}
```


# other notes

<hr/>

## sysex tokens ( uncleaned tables )

| token | type |
|-- | -- |
| xx | return (ByteValue); |
| if (s.endsWith("y && !s.startsWith("y) | return (ByteChannel4Bit); |
| if (s.startsWith("k `OR` s.startsWith("p `OR` s.startsWith("n `OR` s.startsWith("o) | return (GlobalVariable); |
| if (s.startsWith("z) | return (ChecksumRolandJP8080); |
| if (s.startsWith("w) | return (ChecksumWaldorfRackAttack); |
| if (s.startsWith("u) | return (LUAToken); |
| if (s.startsWith ("v) | return (FormulaToken); |
| yy | return (ByteChannel); |
| LS | return (LSB7bitValue); |
| MS | return (MSB7bitValue); |
| ii | return (Ignore); |
| ls | return (LSB4bitValue); |
| ms | return (MSB4bitValue); |
| r1 | return (RolandSplitByte1); |
| r2 | return (RolandSplitByte2); |
| r3 | return (RolandSplitByte3); |
| r4 | return (RolandSplitByte4); |
| tp | return (CurrentProgram); |
| tb | return (CurrentBank); |

```cpp
xx return (ByteValue);
if (s.endsWith("y && !s.startsWith("y) return (ByteChannel4Bit);
if (s.startsWith("k `OR` s.startsWith("p `OR` s.startsWith("n `OR` s.startsWith("o) return (GlobalVariable);
if (s.startsWith("z) return (ChecksumRolandJP8080);
if (s.startsWith("w) return (ChecksumWaldorfRackAttack);
if (s.startsWith("u) return (LUAToken);
if (s.startsWith ("v) return (FormulaToken);
yy return (ByteChannel);
LS return (LSB7bitValue);
MS return (MSB7bitValue);
ii return (Ignore);
ls return (LSB4bitValue);
ms return (MSB4bitValue);
r1 return (RolandSplitByte1);
r2 return (RolandSplitByte2);
r3 return (RolandSplitByte3);
r4 return (RolandSplitByte4);
tp return (CurrentProgram);
tb return (CurrentBank);
```
<hr/>



<hr/>





