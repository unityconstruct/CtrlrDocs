


```lua
>>> sniffByCompName("cb-PresetLayerSelect")
```
Sniffing on ComponentName:[cb-PresetLayerSelect]
Object type [ValueTree]
-----------------------------------------------------------------

Members:
	                    getSibling:	function
	                        __init:	function
	                       indexOf:	function
	              getChildWithName:	function
	                   getProperty:	function
	                   hasProperty:	function
	                   setProperty:	function
	                      getChild:	function
	                getNumChildren:	function
	                   addListener:	function
	                   toXmlString:	function
	                       hasType:	function
	      getOrCreateChildWithName:	function
	                    createCopy:	function
	                     moveChild:	function
	           removeAllProperties:	function
	                       isValid:	function
	             removeAllChildren:	function
	                   removeChild:	function
	                      addChild:	function
	                     getParent:	function
	                isEquivalentTo:	function
	                removeProperty:	function
	          getChildWithProperty:	function
	     sendPropertyChangeMessage:	function
	                 writeToStream:	function
	                       getType:	function
	                    isAChildOf:	function
	                removeListener:	function
	              getNumProperties:	function
	               getPropertyName:	function


Attributes:

-----------------------------------------------------------------
Geting ObjectTree...
60
componentSentBack    0
componentMouseCursor 2
componentDisabled    0
componentIsLocked    0
componentSnapSize    0
componentGroupName
componentGroupped    0
componentRadioGroupId 0
componentRadioGroupNotifyMidi 1
componentVisibleName LAYERSELECT
componentLabelVisible 1
componentLabelAlwaysOnTop 1
componentLabelPosition top
componentLabelWidth  0
componentLabelHeight 14
componentLabelJustification centred
componentLabelColour ff000000
componentLabelFont   <Sans-Serif>;12;0;0;0;0;1;3
componentEffect      0
componentEffectRadius 1.0
componentEffectColour 0xff000000
componentEffectOffsetX 0
componentEffectOffsetY 0
componentExcludedFromLabelDisplay 0
componentValueDecimalPlaces 0
componentLuaMouseMoved -- None
componentLuaMouseDown -- None
componentLuaMouseUp  -- None
componentLuaMouseDrag -- None
componentLuaMouseDoubleClick -- None
componentLuaMouseEnter -- None
componentLuaMouseExit -- None
uiComboButtonWidthOverride 0
uiButtonLookAndFeelIsCustom nil
uiComboButtonWidth   16
uiComboDynamicContent 0
uiComboSelectedId    -1
uiComboSelectedIndex -1
uiComboContent       Layer1=1
Layer2=2
Layer3=3
Layer4=4
AllLayers=0
uiButtonLookAndFeel  Default
uiComboArrowColour   ff000000
uiComboOutlineColour ff939393
uiComboTextJustification centred
uiComboFont          <Sans-Serif>;14;0;0;0;0;1;3
uiComboTextColour    ff000000
uiComboMenuFont      <Sans-Serif>;16;0;0;0;0;1;3
uiComboMenuFontColour ff000000
uiComboButtonColour  ffdddddd
uiComboBgColour      ffffffff
uiComboMenuBackgroundColour ffffffff
uiComboMenuHighlightColour 66a9a9a9
uiComboMenuFontHighlightedColour ffffffff
uiComboMenuBackgroundRibbed 0
uiComboButtonGradient 1
uiComboButtonGradientColour1 ffffffff
uiComboButtonGradientColour2 ffd4d4d4
uiType               uiCombo
componentRectangle   334 146 120 40
componentLayerUid    76de6814020000002e00000000000000
nil




>>> midiPresetLayerSelect(1)
Nibblize: value: 1
Nibblize: value after negative check/adjust: 1
Formatting to Hex: Value:[1] HexString:[01]
Formatting to Hex: Value:[0] HexString:[00]
Nibblized to Hexstring: Value:[1] MSB:[1] LSB:[0] HexString:[01 00]
Changing Layer: [1] Message:[01 02 02 07 01 00]
comboPresetLayerSelect: Selected Layer: [1]
comboPresetLayerSelect: Selected Layer: [2]
comboPresetLayerSelect: Selected Layer: [3]
comboPresetLayerSelect: Selected Layer: [4]

>>> what(getComp("cb-PresetLayerSelect"))
CompName:[cb-PresetLayerSelect]]
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------

>>> what(getComp("cb-LayerSelect"))
CompName:[cb-LayerSelect]]
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------

>>> what(getComp("cb-PresetLayerSelect"))
CompName:[cb-PresetLayerSelect]]
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------

>>> what(getComp("cb-PresetLayerSelect"))
CompName:[cb-PresetLayerSelect]]
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:
asdf
-----------------------------------------------------------------

```lua
>>> what(getComp("cb-PresetLayerSelect"))
```
CompName:[cb-PresetLayerSelect]]
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------

```lua
>>>  panel:getComponent(componentName)   what(getComp("cb-PresetLayerSelect"))
ERROR: No matching overload found, candidates:
CtrlrComponent* getComponent(CtrlrPanel&,String const&)

>>>  panel:getComponent("cb-PresetLayerSelect")  

>>>  what(panel:getComponent("cb-PresetLayerSelect")  )
```
Object type [CtrlrCombo]
-----------------------------------------------------------------

Members:
	                      getRight:	function
	             getPropertyDouble:	function
	      copyAllExplicitColoursTo:	function
	                   focusGained:	function
	    setRepaintsOnMouseActivity:	function
	                     getBottom:	function
	                    getMaximum:	function
	              setComponentText:	function
	              isFocusContainer:	function
	        parentHierarchyChanged:	function
	                     isVisible:	function
	         setExplicitFocusOrder:	function
	                      getAlpha:	function
	             setCentreRelative:	function
	                removeProperty:	function
	          removeChildComponent:	function
	                getComponentAt:	function
	                       mouseUp:	function
	canModalEventBeSentToComponent:	function
	         isMouseOverOrDragging:	function
	                setComponentID:	function
	                      getOwner:	function
	                    findColour:	function
	             setFocusContainer:	function
	                      setAlpha:	function
	                getComponentID:	function
	  isBroughtToFrontOnMouseClick:	function
	                         click:	function
	                         paint:	function
	            lookAndFeelChanged:	function
	             visibilityChanged:	function
	               findChildWithID:	function
	               getScreenBounds:	function
	  focusOfChildComponentChanged:	function
	             enablementChanged:	function
	            getParentComponent:	function
	                  getLuaBounds:	function
	                          getX:	function
	             removeAllChildren:	function
	            getMouseXYRelative:	function
	      getInterceptsMouseClicks:	function
	          getParentMonitorArea:	function
	         getWantsKeyboardFocus:	function
	                       setSize:	function
	          getSelectedItemIndex:	function
	             setPropertyColour:	function
	                    getScreenY:	function
	               childrenChanged:	function
	            setTopLeftPosition:	function
	               keyStateChanged:	function
	      setInterceptsMouseClicks:	function
	          setSelectedItemIndex:	function
	                       getRect:	function
	             getChildComponent:	function
	                       setText:	function
	         getExplicitFocusOrder:	function
	                       getText:	function
	                     setOpaque:	function
	                 colourChanged:	function
	                       repaint:	function
	getMouseClickGrabsKeyboardFocus:	function
	                          getY:	function
	                    mouseEnter:	function
	               getWindowHandle:	function
	               getParentHeight:	function
	            childBoundsChanged:	function
	          getTopLevelComponent:	function
	setMouseClickGrabsKeyboardFocus:	function
	              getOwnedComboBox:	function
	        setPaintingIsUnclipped:	function
	      getIndexOfChildComponent:	function
	                      contains:	function
	                 getLocalPoint:	function
	                   isMouseOver:	function
	                 getProperties:	function
	                     mouseDrag:	function
	                centreWithSize:	function
	             grabKeyboardFocus:	function
	                    setVisible:	function
	             addAndMakeVisible:	function
	    moveKeyboardFocusToSibling:	function
	                 isAlwaysOnTop:	function
	             isMouseButtonDown:	function
	        userTriedToCloseWindow:	function
	                 setSelectedId:	function
	                    getScreenX:	function
	             removeFromDesktop:	function
	            setBufferedToImage:	function
	isCurrentlyBlockedByAnotherModalComponent:	function
	       createComponentSnapshot:	function
	           removeMouseListener:	function
	                reallyContains:	function
	                     isShowing:	function
	                getMouseCursor:	function
	                   isOnDesktop:	function
	          handleCommandMessage:	function
	                       hitTest:	function
	             isColourSpecified:	function
	         setComponentMidiValue:	function
	         inputAttemptWhenModal:	function
	                     isEnabled:	function
	                     getBounds:	function
	      minimisationStateChanged:	function
	         sendLookAndFeelChange:	function
	                      isOpaque:	function
	                mouseWheelMove:	function
	            setComponentEffect:	function
	                getLookAndFeel:	function
	              getComponentText:	function
	                      toBehind:	function
	            getComponentEffect:	function
	                 getSelectedId:	function
	                setLookAndFeel:	function
	                     setBounds:	function
	                getParentWidth:	function
	                setBoundsInset:	function
	         setWantsKeyboardFocus:	function
	              addChildAndSetID:	function
	                 getPositioner:	function
	                     mouseDown:	function
	                exitModalState:	function
	             addChildComponent:	function
	                getPropertyInt:	function
	                       toFront:	function
	                  setMidiValue:	function
	         getNumChildComponents:	function
	                     getHeight:	function
	                       setName:	function
	                  getMidiValue:	function
	           modifierKeysChanged:	function
	              mouseDoubleClick:	function
	                    setEnabled:	function
	              addMouseListener:	function
	       getCachedComponentImage:	function
	            localPointToGlobal:	function
	                        __init:	function
	          addComponentListener:	function
	                   getProperty:	function
	              hasKeyboardFocus:	function
	 setBroughtToFrontOnMouseClick:	function
	                        toBack:	function
	             removeKeyListener:	function
	         getComponentMidiValue:	function
	                         moved:	function
	             proportionOfWidth:	function
	                   getValueMap:	function
	                addKeyListener:	function
	             setPropertyString:	function
	                 setPositioner:	function
	          createFocusTraverser:	function
	                  addToDesktop:	function
	             paintOverChildren:	function
	                  removeColour:	function
	                setPropertyInt:	function
	       setCachedComponentImage:	function
	                 isTransformed:	function
	                     mouseMove:	function
	            proportionOfHeight:	function
	           setTopRightPosition:	function
	             getPropertyString:	function
	       removeComponentListener:	function
	                   getPosition:	function
	                     focusLost:	function
	                 getObjectTree:	function
	                      setValue:	function
	             setBoundsRelative:	function
	             parentSizeChanged:	function
	                    isParentOf:	function
	                  setTransform:	function
	            postCommandMessage:	function
	                   setProperty:	function
	               getTextForValue:	function
	                      getValue:	function
	             getScreenPosition:	function
	          paintEntireComponent:	function
	             getBoundsInParent:	function
	                     setColour:	function
	             getComponentValue:	function
	             updateMouseCursor:	function
	                      getWidth:	function
	                       resized:	function
	             setComponentValue:	function
	                broughtToFront:	function
	                    getMinimum:	function
	          setCustomLookAndFeel:	function
	                       getPeer:	function
	                setMouseCursor:	function
	                    keyPressed:	function
	                  getTransform:	function
	                setAlwaysOnTop:	function
	               enterModalState:	function
	              isCurrentlyModal:	function
	                     mouseExit:	function
	             deleteAllChildren:	function
	             setPropertyDouble:	function
	                setBoundsToFit:	function
	                getLocalBounds:	function


Attributes:

-----------------------------------------------------------------

>>>  p(string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i)):getValue()))
ERROR: [string "_runtime"]:1: attempt to index global 'result' (a nil value)

>>>  result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()    p(string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i)):getValue()))
ERROR: No matching overload found, candidates:
Identifier getPropertyName(ValueTree const&,int)

>>>  result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()   

>>>  result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p(  string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i)):getValue())) done
ERROR: [string "_runtime"]:1: '=' expected near '<eof>'

>>>  result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p(  string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())) done
ERROR: [string "_runtime"]:1: ')' expected near 'done'

>>>  result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p(  string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue()))) done
ERROR: [string "_runtime"]:1: '=' expected near '<eof>'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  )) done
ERROR: [string "_runtime"]:1: '=' expected near '<eof>'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  )) done
ERROR: [string "_runtime"]:1: '=' expected near '<eof>'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do  tostring(result:getPropertyName(i)) done
ERROR: [string "_runtime"]:1: '=' expected near '<eof>'

>>> 

>>> 

>>> 

>>> 

>>> 

>>> p("fuck off")
fuck off

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  

>>> toString("asdf")
ERROR: [string "_runtime"]:1: attempt to call global 'toString' (a nil value)

>>> tostring("asdf")

>>> p("asdf")
asdf

>>> p(toString("asdf"))
ERROR: [string "_runtime"]:1: attempt to call global 'toString' (a nil value)

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  )) end
ERROR: [string "_runtime"]:1: attempt to call method 'getValue' (a nil value)

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):Value())  )) end
ERROR: [string "_runtime"]:1: attempt to call method 'Value' (a nil value)

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):Value)  )) end
ERROR: [string "_runtime"]:1: function arguments expected near ')'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(tostring(result:getPropertyName(i))) end
componentSentBack
componentMouseCursor
componentDisabled
componentIsLocked
componentSnapSize
componentGroupName
componentGroupped
componentRadioGroupId
componentRadioGroupNotifyMidi
componentVisibleName
componentLabelVisible
componentLabelAlwaysOnTop
componentLabelPosition
componentLabelWidth
componentLabelHeight
componentLabelJustification
componentLabelColour
componentLabelFont
componentEffect
componentEffectRadius
componentEffectColour
componentEffectOffsetX
componentEffectOffsetY
componentExcludedFromLabelDisplay
componentValueDecimalPlaces
componentLuaMouseMoved
componentLuaMouseDown
componentLuaMouseUp
componentLuaMouseDrag
componentLuaMouseDoubleClick
componentLuaMouseEnter
componentLuaMouseExit
uiComboButtonWidthOverride
uiButtonLookAndFeelIsCustom
uiComboButtonWidth
uiComboDynamicContent
uiComboSelectedId
uiComboSelectedIndex
uiComboContent
uiButtonLookAndFeel
uiComboArrowColour
uiComboOutlineColour
uiComboTextJustification
uiComboFont
uiComboTextColour
uiComboMenuFont
uiComboMenuFontColour
uiComboButtonColour
uiComboBgColour
uiComboMenuBackgroundColour
uiComboMenuHighlightColour
uiComboMenuFontHighlightedColour
uiComboMenuBackgroundRibbed
uiComboButtonGradient
uiComboButtonGradientColour1
uiComboButtonGradientColour2
uiType
componentRectangle
componentLayerUid


>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(tostring(result:getPropertyName(i))) what(result:getProperty(getPropertyName(i)):getValue()) end
componentSentBack
ERROR: [string "_runtime"]:1: attempt to call global 'getPropertyName' (a nil value)

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(tostring(result:getPropertyName(i))) what(result:getProperty(result:getPropertyName(i)) :getValue()) end
componentSentBack
ERROR: [string "_runtime"]:1: attempt to call method 'getValue' (a nil value)

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(tostring(result:getPropertyName(i))) what(result:getProperty(result:getPropertyName(i))) end
componentSentBack
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentMouseCursor
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentDisabled
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentIsLocked
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentSnapSize
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentGroupName
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentGroupped
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentRadioGroupId
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentRadioGroupNotifyMidi
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentVisibleName
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelVisible
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelAlwaysOnTop
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelPosition
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelWidth
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelHeight
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelJustification
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLabelFont
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentEffect
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentEffectRadius
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentEffectColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentEffectOffsetX
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentEffectOffsetY
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentExcludedFromLabelDisplay
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentValueDecimalPlaces
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseMoved
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseDown
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseUp
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseDrag
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseDoubleClick
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseEnter
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLuaMouseExit
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonWidthOverride
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiButtonLookAndFeelIsCustom
Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonWidth
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboDynamicContent
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboSelectedId
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboSelectedIndex
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboContent
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiButtonLookAndFeel
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboArrowColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboOutlineColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboTextJustification
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboFont
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboTextColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuFont
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuFontColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboBgColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuBackgroundColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuHighlightColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuFontHighlightedColour
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboMenuBackgroundRibbed
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonGradient
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonGradientColour1
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiComboButtonGradientColour2
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
uiType
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentRectangle
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
componentLayerUid
Object type [string]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------

Object type [nil]
-----------------------------------------------------------------

Members:


Attributes:

-----------------------------------------------------------------
```lua
>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(tostring(result:getPropertyName(i))) p(result:getProperty(result:getPropertyName(i))) end
```
componentSentBack
0
componentMouseCursor
2
componentDisabled
0
componentIsLocked
0
componentSnapSize
0
componentGroupName

componentGroupped
0
componentRadioGroupId
0
componentRadioGroupNotifyMidi
1
componentVisibleName
LAYERSELECT
componentLabelVisible
1
componentLabelAlwaysOnTop
1
componentLabelPosition
top
componentLabelWidth
0
componentLabelHeight
14
componentLabelJustification
centred
componentLabelColour
ff000000
componentLabelFont
<Sans-Serif>;12;0;0;0;0;1;3
componentEffect
0
componentEffectRadius
1.0
componentEffectColour
0xff000000
componentEffectOffsetX
0
componentEffectOffsetY
0
componentExcludedFromLabelDisplay
0
componentValueDecimalPlaces
0
componentLuaMouseMoved
-- None
componentLuaMouseDown
-- None
componentLuaMouseUp
-- None
componentLuaMouseDrag
-- None
componentLuaMouseDoubleClick
-- None
componentLuaMouseEnter
-- None
componentLuaMouseExit
-- None
uiComboButtonWidthOverride
0
uiButtonLookAndFeelIsCustom
nil
uiComboButtonWidth
16
uiComboDynamicContent
0
uiComboSelectedId
-1
uiComboSelectedIndex
-1
uiComboContent
Layer1=1
Layer2=2
Layer3=3
Layer4=4
AllLayers=0
uiButtonLookAndFeel
Default
uiComboArrowColour
ff000000
uiComboOutlineColour
ff939393
uiComboTextJustification
centred
uiComboFont
<Sans-Serif>;14;0;0;0;0;1;3
uiComboTextColour
ff000000
uiComboMenuFont
<Sans-Serif>;16;0;0;0;0;1;3
uiComboMenuFontColour
ff000000
uiComboButtonColour
ffdddddd
uiComboBgColour
ffffffff
uiComboMenuBackgroundColour
ffffffff
uiComboMenuHighlightColour
66a9a9a9
uiComboMenuFontHighlightedColour
ffffffff
uiComboMenuBackgroundRibbed
0
uiComboButtonGradient
1
uiComboButtonGradientColour1
ffffffff
uiComboButtonGradientColour2
ffd4d4d4
uiType
uiCombo
componentRectangle
334 146 120 40
componentLayerUid
76de6814020000002e00000000000000



```bash
componentSentBack   0
componentMouseCursor    2
componentDisabled   0
componentIsLocked   0
componentSnapSize   0
componentGroupName  
componentGroupped   0
componentRadioGroupId   0
componentRadioGroupNotifyMidi   1
componentVisibleName    LAYERSELECT
componentLabelVisible   1
componentLabelAlwaysOnTop   1
componentLabelPosition  top
componentLabelWidth 0
componentLabelHeight    14
componentLabelJustification centred
componentLabelColourff000000    
componentLabelFont  <Sans-Serif>;12;0;0;0;0;1;3
componentEffect 0
componentEffectRadius   1.0
componentEffectColour   0\xff000000
componentEffectOffsetX 0
componentEffectOffsetY  0
componentExcludedFromLabelDisplay   0
componentValueDecimalPlaces 0
componentLuaMouseMoved  -- None
componentLuaMouseDown   -- None
componentLuaMouseUp -- None
componentLuaMouseDrag   -- None
componentLuaMouseDoubleClick    -- None
componentLuaMouseEnter  -- None
componentLuaMouseExit   -- None
uiComboButtonWidthOverride  0
uiButtonLookAndFeelIsCustom nil
uiComboButtonWidth  16
uiComboDynamicContent   0
uiComboSelectedId   -1
uiComboSelectedIndex    -1
uiComboContent  
Layer1=1
Layer2=2
Layer3=3
Layer4=4
AllLayers=0
uiButtonLookAndFeel Default
uiComboArrowColour  ff000000
uiComboOutlineColour    ff939393
uiComboTextJustification    centred
uiComboFont <Sans-Serif>;14;0;0;0;0;1;3
uiComboTextColour   ff000000
uiComboMenuFont <Sans-Serif>;16;0;0;0;0;1;3
uiComboMenuFontColour   ff000000
uiComboButtonColour ffdddddd
uiComboBgColour ffffffff
uiComboMenuBackgroundColour ffffffff
uiComboMenuHighlightColour  66a9a9a9
uiComboMenuFontHighlightedColour    ffffffff
uiComboMenuBackgroundRibbed 0
uiComboButtonGradient   1
uiComboButtonGradientColour1    ffffffff
uiComboButtonGradientColour2    ffd4d4d4
uiType  uiCombo
componentRectangle  334 146 120 40
componentLayerUid   76de6814020000002e00000000000000

```























nil
```lua
>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(  string.format("%-20s %-10s",tostring(result:getPropertyName(i)),result:getProperty(result:getPropertyName(i)) end
ERROR: [string "_runtime"]:1: ')' expected near 'end'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(  string.format("%-20s %-10s",tostring(result:getPropertyName(i)),result:getProperty(result:getPropertyName(i))) end
ERROR: [string "_runtime"]:1: ')' expected near 'end'

>>> result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(  string.format("%-20s %-10s",tostring(result:getPropertyName(i)),result:getProperty(result:getPropertyName(i)))) end
```
componentSentBack    0
componentMouseCursor 2
componentDisabled    0
componentIsLocked    0
componentSnapSize    0
componentGroupName
componentGroupped    0
componentRadioGroupId 0
componentRadioGroupNotifyMidi 1
componentVisibleName LAYERSELECT
componentLabelVisible 1
componentLabelAlwaysOnTop 1
componentLabelPosition top
componentLabelWidth  0
componentLabelHeight 14
componentLabelJustification centred
componentLabelColour ff000000
componentLabelFont   <Sans-Serif>;12;0;0;0;0;1;3
componentEffect      0
componentEffectRadius 1.0
componentEffectColour 0xff000000
componentEffectOffsetX 0
componentEffectOffsetY 0
componentExcludedFromLabelDisplay 0
componentValueDecimalPlaces 0
componentLuaMouseMoved -- None
componentLuaMouseDown -- None
componentLuaMouseUp  -- None
componentLuaMouseDrag -- None
componentLuaMouseDoubleClick -- None
componentLuaMouseEnter -- None
componentLuaMouseExit -- None
uiComboButtonWidthOverride 0
ERROR: [string "_runtime"]:1: bad argument #3 to 'format' (string expected, got nil)

>>> sniffByCompName("cb-PresetLayerSelect")
Sniffing on ComponentName:[cb-PresetLayerSelect]
Object type [ValueTree]
-----------------------------------------------------------------

Members:
	                    getSibling:	function
	                        __init:	function
	                       indexOf:	function
	              getChildWithName:	function
	                   getProperty:	function
	                   hasProperty:	function
	                   setProperty:	function
	                      getChild:	function
	                getNumChildren:	function
	                   addListener:	function
	                   toXmlString:	function
	                       hasType:	function
	      getOrCreateChildWithName:	function
	                    createCopy:	function
	                     moveChild:	function
	           removeAllProperties:	function
	                       isValid:	function
	             removeAllChildren:	function
	                   removeChild:	function
	                      addChild:	function
	                     getParent:	function
	                isEquivalentTo:	function
	                removeProperty:	function
	          getChildWithProperty:	function
	     sendPropertyChangeMessage:	function
	                 writeToStream:	function
	                       getType:	function
	                    isAChildOf:	function
	                removeListener:	function
	              getNumProperties:	function
	               getPropertyName:	function


Attributes:

-----------------------------------------------------------------
Geting ObjectTree...
60
componentSentBack    0
componentMouseCursor 2
componentDisabled    0
componentIsLocked    0
componentSnapSize    0
componentGroupName
componentGroupped    0
componentRadioGroupId 0
componentRadioGroupNotifyMidi 1
componentVisibleName LAYERSELECT
componentLabelVisible 1
componentLabelAlwaysOnTop 1
componentLabelPosition top
componentLabelWidth  0
componentLabelHeight 14
componentLabelJustification centred
componentLabelColour ff000000
componentLabelFont   <Sans-Serif>;12;0;0;0;0;1;3
componentEffect      0
componentEffectRadius 1.0
componentEffectColour 0xff000000
componentEffectOffsetX 0
componentEffectOffsetY 0
componentExcludedFromLabelDisplay 0
componentValueDecimalPlaces 0
componentLuaMouseMoved -- None
componentLuaMouseDown -- None
componentLuaMouseUp  -- None
componentLuaMouseDrag -- None
componentLuaMouseDoubleClick -- None
componentLuaMouseEnter -- None
componentLuaMouseExit -- None
uiComboButtonWidthOverride 0
uiButtonLookAndFeelIsCustom nil
uiComboButtonWidth   16
uiComboDynamicContent 0
uiComboSelectedId    -1
uiComboSelectedIndex -1
uiComboContent       Layer1=1
Layer2=2
Layer3=3
Layer4=4
AllLayers=0
uiButtonLookAndFeel  Default
uiComboArrowColour   ff000000
uiComboOutlineColour ff939393
uiComboTextJustification centred
uiComboFont          <Sans-Serif>;14;0;0;0;0;1;3
uiComboTextColour    ff000000
uiComboMenuFont      <Sans-Serif>;16;0;0;0;0;1;3
uiComboMenuFontColour ff000000
uiComboButtonColour  ffdddddd
uiComboBgColour      ffffffff
uiComboMenuBackgroundColour ffffffff
uiComboMenuHighlightColour 66a9a9a9
uiComboMenuFontHighlightedColour ffffffff
uiComboMenuBackgroundRibbed 0
uiComboButtonGradient 1
uiComboButtonGradientColour1 ffffffff
uiComboButtonGradientColour2 ffd4d4d4
uiType               uiCombo
componentRectangle   334 146 120 40
componentLayerUid    76de6814020000002e00000000000000
nil

