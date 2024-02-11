# Lua Methods & Calls

- Lists Exposed Lua Methods, what they call and the filename location

### CtrlrCustomComponent::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrCustomComponent, CtrlrComponent>("CtrlrCustomComponent")
class_<DragAndDropSourceDetails>("DragAndDropSourceDetails")
```

| method | call |
| - | - |
| getDescription | DragAndDropSourceDetails::getDescription |
| getSourceComponent | DragAndDropSourceDetails::getSourceComponent |
| getLocalPositionX | DragAndDropSourceDetails::getLocalPositionX |
| getLocalPositionY | DragAndDropSourceDetails::getLocalPositionY |

### CtrlrLuaMultiTimer::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrLuaMultiTimer>("CtrlrLuaMultiTimer")
```

| method | call |
| - | - |
| setCallback | CtrlrLuaMultiTimer::setCallback |
| startTimer | CtrlrLuaMultiTimer::startTimer |
| isRegistered | CtrlrLuaMultiTimer::isRegistered |
| stopTimer | CtrlrLuaMultiTimer::stopTimer |
| isTimerRunning | CtrlrLuaMultiTimer::isTimerRunning |
| getTimerInterval | CtrlrLuaMultiTimer::getTimerInterval |


### CtrlrModulator::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrModulator, CtrlrLuaObject>("CtrlrModulator")
```

| method | call |
| - | - |
| getValue | CtrlrModulator::getModulatorValue |
| setValue | (CtrlrModulator::*)(const int, const bool))&CtrlrModulator::setValue |
| setValue | (CtrlrModulator::*)(const int, const bool, const bool))&CtrlrModulator::setValue |
| setValueMapped | CtrlrModulator::setValueMapped |
| setValueMapped | CtrlrModulator::setValueMappedCompat |
| setValueNonMapped | CtrlrModulator::setValueNonMapped |
| getVstIndex | CtrlrModulator::getVstIndex |
| getMaxModulatorValue | CtrlrModulator::getMaxModulatorValue |
| getMaxMapped | CtrlrModulator::getMaxMapped |
| getMaxNonMapped | CtrlrModulator::getMaxNonMapped |
| getMinMapped | CtrlrModulator::getMinMapped |
| getMinNonMapped | CtrlrModulator::getMinNonMapped |
| getMinModulatorValue | CtrlrModulator::getMinModulatorValue |
| getComponent | CtrlrModulator::getComponent |
| getRestoreState | CtrlrModulator::getRestoreState |
| isRestoring | CtrlrModulator::getRestoreState |
| setRestoreState | CtrlrModulator::setRestoreState |
| getMidiMessage | CtrlrModulator::getMidiMessagePtr |
| getName | CtrlrModulator::getName |
| getValueMapped | CtrlrModulator::getValueMapped |
| getValueNonMapped | CtrlrModulator::getValueNonMapped |
| getModulatorValue | CtrlrModulator::getModulatorValue |
| setModulatorValue | CtrlrModulator::setModulatorValue |
| getLuaName | CtrlrModulator::getName |
| getModulatorName | CtrlrModulator::getName |

#### CtrlrModulator::wrapForLua->CtrlrModulatorValue Enum | CtrlrLuaManager.cpp
```cpp
.enum_("CtrlrModulatorValue")
```

| id | value |
| - | - |
| initialValue | 0 |
| changedByHost | 1 |
| changedByMidiIn | 2 |
| changedByMidiController | 3 |
| changedByGUI | 4 |
| changedByLua | 5 |
| changedByProgram | 6 |
| changedByLink | 7 |
| changeByUnknown | 8 |


### CtrlrPanel::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrPanel, CtrlrLuaObject>("CtrlrPanel")
```

| method | call |
| - | - |
| getModulatorByName | CtrlrPanel::getModulator |
| getModulator | CtrlrPanel::getModulator |
| getModulatorByIndex | CtrlrPanel::getModulatorByIndex |
| getNumModulators | CtrlrPanel::getNumModulators |
| sendMidiMessageNow | (CtrlrPanel::*)(CtrlrMidiMessage &)) &CtrlrPanel::sendMidiNow |
| sendMidi | (CtrlrPanel::*)(CtrlrMidiMessage &, double)) &CtrlrPanel::sendMidi |
| getPanelEditor | CtrlrPanel::getPanelEditor |
| getRestoreState | CtrlrPanel::getRestoreState |
| getBootstrapState | CtrlrPanel::getBootstrapState |
| isRestoring | CtrlrPanel::getRestoreState |
| setRestoreState | CtrlrPanel::setRestoreState |
| getComponent | CtrlrPanel::getComponent |
| getGlobalVariable | CtrlrPanel::getGlobalVariable |
| setGlobalVariable | CtrlrPanel::setGlobalVariable |
| getCanvas | CtrlrPanel::getCanvas |
| getWaveformComponent | CtrlrPanel::getWaveformComponent |
| getWaveform | CtrlrPanel::getWaveformComponent |
| getLabelComponent | CtrlrPanel::getLabelComponent |
| getLabel | CtrlrPanel::getLabelComponent |
| getToggleButtonComponent | CtrlrPanel::getToggleButtonComponent |
| getToggleButton | CtrlrPanel::getToggleButtonComponent |
| getImageButtonComponent | CtrlrPanel::getImageButtonComponent |
| getImageButton | CtrlrPanel::getImageButtonComponent |
| getButtonComponent | CtrlrPanel::getButtonComponent |
| getButton | CtrlrPanel::getButtonComponent |
| getComboComponent | CtrlrPanel::getComboComponent |
| getCombo | CtrlrPanel::getComboComponent |
| getListBoxComponent | CtrlrPanel::getListBoxComponent |
| getListBox | CtrlrPanel::getListBoxComponent |
| getFileListBoxComponent | CtrlrPanel::getFileListBoxComponent |
| getFileListBox | CtrlrPanel::getFileListBoxComponent |
| getSliderComponent | CtrlrPanel::getSliderComponent |
| getSlider | CtrlrPanel::getSliderComponent |
| getFixedImageSliderComponent | CtrlrPanel::getFixedImageSliderComponent |
| getFixedImageSlider | CtrlrPanel::getFixedImageSliderComponent |
| getFixedSliderComponent | CtrlrPanel::getFixedSliderComponent |
| getFixedSlider | CtrlrPanel::getFixedSliderComponent |
| getImageSliderComponent | CtrlrPanel::getImageSliderComponent |
| getImageSlider | CtrlrPanel::getImageSliderComponent |
| getModulatorWithProperty | (CtrlrModulator *(CtrlrPanel::*)(const String &, const int)) &CtrlrPanel::getModulatorWithProperty |
| getModulatorWithProperty | (CtrlrModulator *(CtrlrPanel::*)(const String &, const String &)) &CtrlrPanel::getModulatorWithProperty |
| getModulatorsWithProperty | CtrlrPanel::getModulatorsWithPropertyLua |
| getModulatorsWildcard | (luabind::object (CtrlrPanel::*)(const String &, const bool))&CtrlrPanel::getModulatorsWildcardLua |
| getModulatorsWildcard | (luabind::object (CtrlrPanel::*)(const String &, const String &, const bool))&CtrlrPanel::getModulatorsWildcardLua |
| getInputComparator | CtrlrPanel::getInputComparator |
| getModulatorValuesAsData | CtrlrPanel::getModulatorValuesAsData |
| setModulatorValuesFromData | CtrlrPanel::setModulatorValuesFromData |
| getLibrary | CtrlrPanel::getCtrlrMIDILibrary |
| getCtrlrMIDILibrary | CtrlrPanel::getCtrlrMIDILibrary |

#### CtrlrPanel::wrapForLua->CtrlrPanelFileType Enum | CtrlrLuaManager.cpp

```cpp
.enum_("CtrlrPanelFileType")
```

| id | value|
| - | - |
| PanelFileXML | 0 |
| PanelFileXMLCompressed | 1 |
| PanelFileBinary | 2 |
| PanelFileBinaryCompressed | 3 |
| PanelFileExport | 4 |


#### CtrlrPanel::wrapForLua->CtrlrNotificationType Enum | CtrlrLuaManager.cpp

```cpp
.enum_("CtrlrNotificationType")
```

| id | value|
| - | - |
| NotifySuccess | (uint8)NotifySuccess |
| NotifyFailure | (uint8)NotifyFailure |
| NotifyInformation | (uint8)NotifyInformation |
| NotifyWarning | (uint8)NotifyWarnin |

#### CtrlrPanel::wrapForLua->CtrlrByteEncoding Enum | CtrlrLuaManager.cpp

```cpp
.enum_("CtrlrByteEncoding")
```
| id | value|
| - | - |
| EncodeNormal | (uint8)EncodeNormal |
| EncodeMSBFirst | (uint8)EncodeMSBFirst |
| EncodeLSBFirst | (uint8)EncodeLSBFirst |
| EncodeDSI | (uint8)EncodeDS |

#### CtrlrPanel::wrapForLua->CtrlrByteSplit Enum | CtrlrLuaManager.cpp

```cpp
.enum_("CtrlrByteSplit")
```

| id | value|
| - | - |
| SplitNone | (uint8)SplitNone |
| Split4Bits | (uint8)Split4Bits |
| Split7Bits | (uint8)Split7Bits |
| Split8Bits | (uint8)Split8Bit |

#### CtrlrPanel::wrapForLua->CtrlrInstance Enum | CtrlrLuaManager.cpp

```cpp
.enum_("CtrlrInstance")
```

| id | value|
| - | - |
| InstanceSingle | (uint8)InstanceSingle |
| InstanceMulti | (uint8)InstanceMulti |
| InstanceSingleRestriced | (uint8)InstanceSingleRestriced |
| InstanceSingleEngine | (uint8)InstanceSingleEngine |
| InstanceMultiEngine | (uint8)InstanceMultiEngine |
| InstanceSingleRestrictedEngine | (uint8)InstanceSingleRestrictedEngin |

### CtrlrPanelCanvas::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrPanelCanvas,Component>("CtrlrPanelCanvas")
```

| method | call |
| - | - |
| getLayerByName | CtrlrPanelCanvas::getLayerByName |
| getLayer | CtrlrPanelCanvas::getLayer |
| getLayerFromArray | CtrlrPanelCanvas::getLayerFromArray |
| getNumLayers | CtrlrPanelCanvas::getNumLayers |
| getLayerName | CtrlrPanelCanvas::getLayerName |

### CtrlrPanelCanvasLayer:wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrPanelCanvasLayer, bases<Component, CtrlrLuaObject> >("CtrlrPanelCanvasLayer")
```
| method | call |
| - | - |
| moveUp | CtrlrPanelCanvasLayer::moveUp |
| moveDown | CtrlrPanelCanvasLayer::moveDown |
| setCustomLookAndFeel | (void (CtrlrPanelCanvasLayer::*)(const luabind::object &)) &CtrlrPanelCanvasLayer::setCustomLookAndFeel |

### CtrlrPanelEditor::wrapForLua | CtrlrLuaManager.cpp

```cpp
class_<CtrlrPanelEditor, CtrlrLuaObject>("CtrlrPanelEditor")
```

| method | call |
| - | - |
| getWidth | CtrlrPanelEditor::getWidth |
| getHeight | CtrlrPanelEditor::getHeight |
| getCanvas | CtrlrPanelEditor::getCanvas |

<hr/>

### CtrlrLuaUtils::wrapForLua | CtrlrLuaUtils.cpp

```cpp
class_<CtrlrLuaUtils>("CtrlrLuaUtils")
```

| method | call |
| - | - |
| unpackDsiData | CtrlrLuaUtils::unpackDsiData, adopt(result) |
| packDsiData | CtrlrLuaUtils::packDsiData, adopt(result) |
| warnWindow | CtrlrLuaUtils::warnWindow |
| infoWindow | CtrlrLuaUtils::infoWindow |
| questionWindow | CtrlrLuaUtils::questionWindow |
| openFileWindow | CtrlrLuaUtils::openFileWindow |
| openMultipleFilesWindow | CtrlrLuaUtils::openMultipleFilesWindow |
| saveFileWindow | CtrlrLuaUtils::saveFileWindow |
| getDirectoryWindow | CtrlrLuaUtils::getDirectoryWindow |
| askForTextInputWindow | CtrlrLuaUtils::askForTextInputWindow |
| getMidiInputDevices | CtrlrLuaUtils::getMidiInputDevices |
| getMidiOutputDevices | CtrlrLuaUtils::getMidiOutputDevices |
| getVersionMajor | CtrlrLuaUtils::getVersionMajor |
| getVersionMinor | CtrlrLuaUtils::getVersionMinor |
| getVersionRevision | CtrlrLuaUtils::getVersionRevision |
| getVersionString | CtrlrLuaUtils::getVersionString |
| getPi | CtrlrLuaUtils::getPi |


<hr/>

### CtrlrLuaObject::wrapForLua | CtrlrLuaObject.cpp

```cpp
class_<CtrlrLuaObject>("CtrlrLuaObject")
```

| method | call |
| - | - |
| getPropertyInt | CtrlrLuaObject::getPropertyInt |
| getPropertyDouble | CtrlrLuaObject::getPropertyDouble |
| getPropertyString | CtrlrLuaObject::getPropertyString |
| setPropertyInt | CtrlrLuaObject::setPropertyInt |
| setPropertyColour | CtrlrLuaObject::setPropertyColour |
| setPropertyDouble | CtrlrLuaObject::setPropertyDouble |
| setPropertyString | CtrlrLuaObject::setPropertyString |
| removeProperty | CtrlrLuaObject::removeProperty |
| setProperty | (CtrlrLuaObject::*)(const Identifier &, const var &, const bool))&CtrlrLuaObject::setProperty |
| getProperty | CtrlrLuaObject::getProperty |
| getObjectTree | CtrlrLuaObject::getObjectTree |

<hr/>