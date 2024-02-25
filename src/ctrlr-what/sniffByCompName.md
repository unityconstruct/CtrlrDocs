>>> sniffByCompName("controller-1")
Sniffing on ComponentName:[controller-1]
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
77
componentSentBack    0
componentMouseCursor 2
componentDisabled    0
componentIsLocked    0
componentSnapSize    0
componentGroupName
componentGroupped    0
componentRadioGroupId 0
componentRadioGroupNotifyMidi 1
componentVisibleName A
componentLabelVisible 1
componentLabelAlwaysOnTop 1
componentLabelPosition top
componentLabelWidth  20
componentLabelHeight 20
componentLabelJustification centredTop
componentLabelColour ff368e95
componentLabelFont   LCD2 Normal;14;1;0;0;0;1;2
componentEffect      No Effect
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
uiSliderMin          0
uiSliderMax          127.0
uiSliderInterval     1.0
uiSliderSetNotificationOnlyOnRelease 0
uiSliderDoubleClickEnabled 1
uiSliderDoubleClickValue 64.0
uiSliderVelocitySensitivity 1.0
uiSliderVelocityThreshold 1
uiSliderVelocityOffset 0.0
uiSliderVelocityMode 0
uiSliderVelocityModeKeyTrigger 1
uiSliderSpringMode   0
uiSliderSpringValue  0
uiSliderMouseWheelInterval 1.0
uiSliderLookAndFeel  V3
uiSliderLookAndFeelIsCustom 1
uiSliderPopupBubble  1
uiSliderStyle        LinearVertical
uiSliderRotaryOutlineColour 0xff0000ff
uiSliderRotaryFillColour 0xff0000ff
uiSliderThumbColour  ff00fcea
uiSliderTrackColour  ff6f707b
uiSliderIncDecButtonColour 0
uiSliderIncDecTextColour ff000000
uiSliderTrackCornerSize 1.0
uiSliderThumbCornerSize 0.0
uiSliderThumbWidth   11.0
uiSliderThumbHeight  4.0
uiSliderThumbFlatOnLeft 0
uiSliderThumbFlatOnRight 0
uiSliderThumbFlatOnTop 0
uiSliderThumbFlatOnBottom 0
uiSliderValuePosition 4
uiSliderValueWidth   64
uiSliderValueHeight  11
uiSliderValueTextJustification centred
uiSliderValueFont    LCD2 Normal;10;1;0;0;0;1;2
uiSliderValueTextColour ffffffff
uiSliderValueHighlightColour 40000000
uiSliderValueBgColour 0x00ffffff
uiSliderValueOutlineColour 30dedede
uiType               uiSlider
componentRectangle   16 458 23 134
componentLayerUid    a764b3d2ab0000002e00000000000000
nil

>>> panel:getModulator("controller-1"):getComponent()

>>> what(panel:getModulator("controller-1"):getComponent())
Object type [CtrlrSlider]
-----------------------------------------------------------------

Members:
	                      getRight:	function
	             getPropertyDouble:	function
	      copyAllExplicitColoursTo:	function
	                   focusGained:	function
	    setRepaintsOnMouseActivity:	function
	                setMouseCursor:	function
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
	              getComponentText:	function
	                       mouseUp:	function
	canModalEventBeSentToComponent:	function
	      minimisationStateChanged:	function
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
	                       hitTest:	function
	             setPropertyColour:	function
	                    getScreenY:	function
	               childrenChanged:	function
	            setTopLeftPosition:	function
	               keyStateChanged:	function
	      setInterceptsMouseClicks:	function
	                       getRect:	function
	             getChildComponent:	function
	         getExplicitFocusOrder:	function
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
	                    getScreenX:	function
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
	            setBufferedToImage:	function
	isCurrentlyBlockedByAnotherModalComponent:	function
	           removeMouseListener:	function
	             removeFromDesktop:	function
	                     isShowing:	function
	       createComponentSnapshot:	function
	                setBoundsToFit:	function
	          handleCommandMessage:	function
	                getMouseCursor:	function
	             isColourSpecified:	function
	                setLookAndFeel:	function
	         inputAttemptWhenModal:	function
	                getOwnedSlider:	function
	                     getBounds:	function
	         setComponentMidiValue:	function
	         sendLookAndFeelChange:	function
	                      isOpaque:	function
	                mouseWheelMove:	function
	            setComponentEffect:	function
	                getLookAndFeel:	function
	                   isOnDesktop:	function
	              addMouseListener:	function
	            getComponentEffect:	function
	                    setEnabled:	function
	                      toBehind:	function
	                     setBounds:	function
	         isMouseOverOrDragging:	function
	                setBoundsInset:	function
	                getComponentAt:	function
	                     getBottom:	function
	                getParentWidth:	function
	                 getPositioner:	function
	                exitModalState:	function
	             addChildComponent:	function
	              addChildAndSetID:	function
	                       toFront:	function
	                  setMidiValue:	function
	         getNumChildComponents:	function
	                     getHeight:	function
	                       setName:	function
	                  getMidiValue:	function
	           modifierKeysChanged:	function
	              mouseDoubleClick:	function
	         setWantsKeyboardFocus:	function
	              hasKeyboardFocus:	function
	                     mouseDown:	function
	                getPropertyInt:	function
	            localPointToGlobal:	function
	                        __init:	function
	                   getProperty:	function
	       getCachedComponentImage:	function
	          addComponentListener:	function
	                        toBack:	function
	          paintEntireComponent:	function
	             getScreenPosition:	function
	 setBroughtToFrontOnMouseClick:	function
	             proportionOfWidth:	function
	                      getValue:	function
	                addKeyListener:	function
	             setPropertyString:	function
	                         moved:	function
	                   setProperty:	function
	         getComponentMidiValue:	function
	                setPropertyInt:	function
	                  removeColour:	function
	       setCachedComponentImage:	function
	             paintOverChildren:	function
	                 getObjectTree:	function
	                   getPosition:	function
	            proportionOfHeight:	function
	           setTopRightPosition:	function
	             getPropertyString:	function
	       removeComponentListener:	function
	                 isTransformed:	function
	                     mouseMove:	function
	                     focusLost:	function
	                      setValue:	function
	             setBoundsRelative:	function
	             parentSizeChanged:	function
	                    isParentOf:	function
	                  setTransform:	function
	            postCommandMessage:	function
	          createFocusTraverser:	function
	               getTextForValue:	function
	                  addToDesktop:	function
	                 setPositioner:	function
	             removeKeyListener:	function
	             getBoundsInParent:	function
	                     setColour:	function
	             getComponentValue:	function
	             updateMouseCursor:	function
	                      getWidth:	function
	                       resized:	function
	             setComponentValue:	function
	                broughtToFront:	function
	                    keyPressed:	function
	          setCustomLookAndFeel:	function
	                       getPeer:	function
	                    getMinimum:	function
	                     isEnabled:	function
	                  getTransform:	function
	                setAlwaysOnTop:	function
	               enterModalState:	function
	              isCurrentlyModal:	function
	                     mouseExit:	function
	             deleteAllChildren:	function
	                reallyContains:	function
	             setPropertyDouble:	function
	                getLocalBounds:	function


Attributes:

-----------------------------------------------------------------
