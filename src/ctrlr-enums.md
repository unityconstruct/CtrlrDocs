# Ctrlr Enums - CtrlrMacros.h

| enum CtrlrSysExFormulaToken |
| - |
| ByteValue |
| ByteChannel |
| ByteChannel4Bit |
| LSB7bitValue |
| MSB7bitValue |
| LSB4bitValue |
| MSB4bitValue |
| GlobalVariable |
| ChecksumRolandJP8080 |
| RolandSplitByte1 |
| RolandSplitByte2 |
| RolandSplitByte3 |
| RolandSplitByte4 |
| Ignore |
| FormulaToken |
| LUAToken |
| ChecksumWaldorfRackAttack |
| CurrentProgram |
| CurrentBank |
| NoToken |


| enum CtrlrPanelMidiChannel |
| - |
| panelMidiInputChannelDevice |
| panelMidiOutputChannelDevice |
| panelMidiInputChannelHost |
| panelMidiOutputChannelHost |
| panelMidiControllerChannel |

| enum CtrlrPanelMidiOption | Value |
| - | - |
| panelMidiInputFromHost | 2 |
| panelMidiInputFromHostCompare | 4 |
| panelMidiOutputToHost | 8 |
| panelMidiThruH2H | 16 |
| panelMidiThruH2HChannelize | 32 |
| panelMidiThruH2D | 64 |
| panelMidiThruH2DChannelize | 128 |
| panelMidiThruD2D | 256 |
| panelMidiThruD2DChannelize | 512 |
| panelMidiThruD2H | 1024 |
| panelMidiThruD2HChannelize | 2048 |
| panelMidiRealtimeIgnore | 4096 |
| panelMidiControllerToLua | 8192 |

| enum CtrlrMidiLogOptions | Value |
| - | - |
| midiLogName | 2 |
| midiLogChannel | 4 |
| midiLogNumber | 8 |
| midiLogValue | 16 |
| midiLogRawData | 32 |
| midiLogTimestamp | 64 |
| midiLogRawDecimal | 128 |
| midiLogInput | 256 |
| midiLogOutput | 512 |
| midiLogDevice | 1024 |
| midiLogDevAttach | 2048 |
| midiLogDataSize | 4096 |

| enum CtrlrFontProperties |
| - |
| fontTypefaceName |
| fontHeight |
| fontBold |
| fontItalic |
| fontUnderline |
| fontKerning |
| fontHorizontalScale |
| fontSet |

| enum CtrlrMIDIDeviceHandler |
| - |
| JuceMIDI |
| RtMIDI |

| enum CtrlrInstance |
| - |
| InstanceSingle |
| InstanceMulti |
| InstanceSingleRestriced |
| InstanceSingleEngine |
| InstanceMultiEngine |
| InstanceSingleRestrictedEngine |

| enum CtrlrNotificationType |
| - |
| NotifySuccess |
| NotifyFailure |
| NotifyInformation |
| NotifyWarning |

| enum CtrlrByteSplit |
| - |
| SplitNone |
| Split4Bits |
| Split7Bits |
| Split8Bits |

| enum CtrlrByteEncoding |
| - |
| EncodeNormal |
| EncodeMSBFirst |
| EncodeLSBFirst |
| EncodeDSI |

| enum CtrlrMIDIDeviceType |
| - |
| outputDevice |
| inputDevice |
| controllerDevice |
| hostInputDevice |
| hostOutputDevice |
| oscInputDevice |
| oscOutputDevice |
| serialDevice |

| enum CtrlrPanelResourceType |
| - |
| ImageRes |
| AudioRes |
| TextRes |
| XmlRes |
| FontRes |
| DataRes |


### CtrlrMacros.h

```cpp
enum CtrlrSysExFormulaToken
{
	ByteValue,
	ByteChannel,
	ByteChannel4Bit,
	LSB7bitValue,
	MSB7bitValue,
	LSB4bitValue,
	MSB4bitValue,
	GlobalVariable,
	ChecksumRolandJP8080,
	RolandSplitByte1,
	RolandSplitByte2,
	RolandSplitByte3,
	RolandSplitByte4,
	Ignore,
	FormulaToken,
	LUAToken,
	ChecksumWaldorfRackAttack,
	CurrentProgram,
	CurrentBank,
	NoToken
};

enum CtrlrPanelMidiChannel
{
	panelMidiInputChannelDevice,
	panelMidiOutputChannelDevice,
	panelMidiInputChannelHost,
	panelMidiOutputChannelHost,
	panelMidiControllerChannel
};

enum CtrlrPanelMidiOption
{
	panelMidiInputFromHost				= 2,
	panelMidiInputFromHostCompare		= 4,
	panelMidiOutputToHost				= 8,
	panelMidiThruH2H					= 16,
	panelMidiThruH2HChannelize			= 32,
	panelMidiThruH2D					= 64,
	panelMidiThruH2DChannelize			= 128,
	panelMidiThruD2D					= 256,
	panelMidiThruD2DChannelize			= 512,
	panelMidiThruD2H					= 1024,
	panelMidiThruD2HChannelize			= 2048,
	panelMidiRealtimeIgnore				= 4096,
	panelMidiControllerToLua			= 8192
};

enum CtrlrMidiLogOptions
{
	midiLogName=2,
	midiLogChannel=4,
	midiLogNumber=8,
	midiLogValue=16,
	midiLogRawData=32,
	midiLogTimestamp=64,
	midiLogRawDecimal=128,
	midiLogInput=256,
	midiLogOutput=512,
	midiLogDevice=1024,
	midiLogDevAttach=2048,
	midiLogDataSize=4096
};

enum CtrlrFontProperties
{
	fontTypefaceName,
	fontHeight,
	fontBold,
	fontItalic,
	fontUnderline,
	fontKerning,
	fontHorizontalScale,
	fontSet
};

enum CtrlrMIDIDeviceHandler
{
	JuceMIDI,
	RtMIDI
};

class CtrlrPanelMidiProcessor
{
	public:
		virtual ~CtrlrPanelMidiProcessor() {}
		virtual void midiOptionChanged(const CtrlrPanelMidiOption optionThatChanged)=0;
		virtual void midiChannelChaned(const CtrlrPanelMidiChannel channelThatChanged)=0;
};

struct CtrlrInstanceInfo
{
	String instanceName;
	String instanceVersion;
};

class CtrlrNotificationCallback
{
	public:
		virtual ~CtrlrNotificationCallback()
		{
			masterReference.clear();
		}
		virtual void notificationClicked (const MouseEvent e) = 0;

		WeakReference<CtrlrNotificationCallback>::Master masterReference;
};

class DragAndDropSourceDetails
{
	public:
		DragAndDropSourceDetails (const DragAndDropTarget::SourceDetails &details)
			: description(details.description.toString()), sourceComponent(details.sourceComponent), localPositionX(details.localPosition.getX()), localPositionY(details.localPosition.getY())
		{
		}

		DragAndDropSourceDetails (const String &_description, Component *_sourceComponent, int _localPositionX, int _localPositionY)
			: description(_description), sourceComponent(_sourceComponent), localPositionX(_localPositionX), localPositionY(_localPositionY),
				dragImage(Image()), imageOffsetX(-1), imageOffsetY(-1)
		{
		}

		DragAndDropSourceDetails (const String &_description, Image _dragImage, int _imageOffsetX, int _imageOffsetY)
			: description(_description), dragImage(_dragImage), imageOffsetX(_imageOffsetX), imageOffsetY(_imageOffsetY)
		{
		}

		DragAndDropSourceDetails ()
			: dragImage(Image()), imageOffsetX(-1), imageOffsetY(-1),
				sourceComponent(nullptr), localPositionX(-1), localPositionY(-1)
		{
		}

		const String getDescription() const		{ return (description); }
		Component *getSourceComponent() const	{ return (sourceComponent); }
		int getLocalPositionX() const			{ return (localPositionX); }
		int getLocalPositionY() const			{ return (localPositionY); }
		int getImageOffsetX() const				{ return (imageOffsetX); }
		int getImageOffsetY() const				{ return (imageOffsetY); }
		Image getDragImage() const				{ return (dragImage); }

	private:
		String description;
		Component *sourceComponent;
		int localPositionX;
		int localPositionY;
		Image dragImage;
		int imageOffsetX;
		int imageOffsetY;
};

enum CtrlrInstance
{
	InstanceSingle,
	InstanceMulti,
	InstanceSingleRestriced,
	InstanceSingleEngine,
	InstanceMultiEngine,
	InstanceSingleRestrictedEngine
};

enum CtrlrNotificationType
{
	NotifySuccess,
	NotifyFailure,
	NotifyInformation,
	NotifyWarning
};

enum CtrlrByteSplit
{
	SplitNone,
    Split4Bits,
    Split7Bits,
    Split8Bits
};

enum CtrlrByteEncoding
{
	EncodeNormal,
	EncodeMSBFirst,
	EncodeLSBFirst,
	EncodeDSI
};

enum CtrlrMIDIDeviceType
{
    outputDevice,
    inputDevice,
    controllerDevice,
    hostInputDevice,
    hostOutputDevice,
    oscInputDevice,
    oscOutputDevice,
    serialDevice
};

enum CtrlrPanelResourceType
{
	ImageRes,
	AudioRes,
	TextRes,
	XmlRes,
	FontRes,
	DataRes
};
```
