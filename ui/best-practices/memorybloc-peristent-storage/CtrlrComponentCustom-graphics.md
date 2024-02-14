# CtrlrComponentCustom Graphics manipulation

- Some examples working iwth CtrlrComponentCustom


## >>> what(panel:getComponent("LCD_Screen"))



## refresh the component
- after updating values
- `Save & Compile All...`
- use `panel:getComponent()`, not `panel:getModulater()` to access graphic methods
- instead of closing/opening, updates can be made immeidaly with the following:

```lua
panel:getComponent("LCD_Screen"):repaint()
```

## Drawing various items in teh CtrlrComonentCustom object
- Example function that draws various elements to simualate and LCD display
```lua
paintLCDScreen = function(--[[ CtrlrComponent --]] comp, --[[ CtrlrComponent --]] g)

	-- Filling dark background
	g:fillAll(Colour(0xFF202020))
    --g:fillAll(Colour(0xFF2020FF))
	-- light blue
	-- g:setColour(Colour(0xFF2062E3))
    --g:setColour(Colour(0xFFFF00E3))
    g:setColour(Colour(0xFF103152))

	-- Filling light blue
	g:fillRoundedRectangle(10, 10, comp:getWidth() - 20, comp:getHeight() - 20, 3)

	-- Setting a bit darker colour
	g:setColour(Colour(0xFF1052D3))
	--g:setColour(Colour(0xFF003250))

	-- Filling background squares for chars
	local rectSpace = 1
	local i	
	local j
	local rectWd = math.floor((comp:getWidth()  - 20 - (rectSpace * 16)) / 24)
	local rectHg = math.floor((comp:getHeight() - 20 - (rectSpace * 3)) / 2)

	for j = 1, 3, 2 do
		for i = 16 + rectSpace, comp:getWidth()  - 24, rectWd + rectSpace do
			g:fillRect(i + 1, (10 + rectSpace) * j + 1, rectWd, rectHg - rectSpace)
		end
	end

	-- Adding some glance
	g:setGradientFill(ColourGradient(Colour(0x25FFFFFF), comp:getWidth(), 0, Colour(0x00FFFFFF),
					  comp:getWidth(), comp:getHeight() / 2, false))

	g:fillRoundedRectangle(1, 1, comp:getWidth() - 2, comp:getHeight() - 2, 1)

end
```


```bash
>>> what(panel:getComponent("LCD_Screen"))
Object type [CtrlrCustomComponent]
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
	                     isEnabled:	function
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
	             setCentrePosition:	function
	             getChildComponent:	function
	         getExplicitFocusOrder:	function
	                     setOpaque:	function
	                 colourChanged:	function
	                       repaint:	function
	getMouseClickGrabsKeyboardFocus:	function
	                          getY:	function
	                getLocalBounds:	function
	                  setLuaBounds:	function
	               getParentHeight:	function
	            childBoundsChanged:	function
	          getTopLevelComponent:	function
	setMouseClickGrabsKeyboardFocus:	function
	                    getScreenX:	function
	        setPaintingIsUnclipped:	function
	      getIndexOfChildComponent:	function
	                      contains:	function
	                 getLocalPoint:	function
	                reallyContains:	function
	         getComponentMidiValue:	function
	                     mouseDrag:	function
	                centreWithSize:	function
	             grabKeyboardFocus:	function
	                    setVisible:	function
	             addAndMakeVisible:	function
	    moveKeyboardFocusToSibling:	function
	                 isAlwaysOnTop:	function
	             isMouseButtonDown:	function
	        userTriedToCloseWindow:	function
	             removeFromDesktop:	function
	             getBoundsInParent:	function
	            setBufferedToImage:	function
	isCurrentlyBlockedByAnotherModalComponent:	function
	             setPropertyDouble:	function
	           removeMouseListener:	function
	         setComponentMidiValue:	function
	                     isShowing:	function
	                setLookAndFeel:	function
	       createComponentSnapshot:	function
	          handleCommandMessage:	function
	                setBoundsToFit:	function
	             isColourSpecified:	function
	             enablementChanged:	function
	         inputAttemptWhenModal:	function
	                  getMidiValue:	function
	                     getBounds:	function
	             localAreaToGlobal:	function
	         sendLookAndFeelChange:	function
	                      isOpaque:	function
	                mouseWheelMove:	function
	                      toBehind:	function
	                getLookAndFeel:	function
	      minimisationStateChanged:	function
	            localPointToGlobal:	function
	            getComponentEffect:	function
	              getComponentText:	function
	                    keyPressed:	function
	                     setBounds:	function
	                getParentWidth:	function
	                setBoundsInset:	function
	         setWantsKeyboardFocus:	function
	              addChildAndSetID:	function
	                   isMouseOver:	function
	             updateMouseCursor:	function
	                exitModalState:	function
	             addChildComponent:	function
	                getPropertyInt:	function
	                       toFront:	function
	                  setMidiValue:	function
	         getNumChildComponents:	function
	                     getHeight:	function
	                       setName:	function
	                    getMinimum:	function
	           modifierKeysChanged:	function
	              mouseDoubleClick:	function
	                    setEnabled:	function
	              addMouseListener:	function
	                        toBack:	function
	             getScreenPosition:	function
	          addComponentListener:	function
	                     getBottom:	function
	                   getProperty:	function
	              hasKeyboardFocus:	function
	 setBroughtToFrontOnMouseClick:	function
	             removeKeyListener:	function
	          paintEntireComponent:	function
	             parentSizeChanged:	function
	                         moved:	function
	             proportionOfWidth:	function
	                addKeyListener:	function
	                     focusLost:	function
	             setPropertyString:	function
	                    getMarkers:	function
	          createFocusTraverser:	function
	                setPropertyInt:	function
	             paintOverChildren:	function
	                  removeColour:	function
	       setCachedComponentImage:	function
	                 getObjectTree:	function
	                   getPosition:	function
	                  getLocalArea:	function
	                  addToDesktop:	function
	           setTopRightPosition:	function
	             getPropertyString:	function
	       removeComponentListener:	function
	                 isTransformed:	function
	                     mouseMove:	function
	            proportionOfHeight:	function
	                      setValue:	function
	             setBoundsRelative:	function
	                 setPositioner:	function
	                    isParentOf:	function
	                  setTransform:	function
	            postCommandMessage:	function
	                   setProperty:	function
	               getTextForValue:	function
	                      getValue:	function
	                        __init:	function
	                   isOnDesktop:	function
	       getCachedComponentImage:	function
	                     setColour:	function
	             getComponentValue:	function
	                     mouseDown:	function
	                      getWidth:	function
	                       resized:	function
	             setComponentValue:	function
	                broughtToFront:	function
	                 getProperties:	function
	          setCustomLookAndFeel:	function
	                       getPeer:	function
	                 getPositioner:	function
	            setComponentEffect:	function
	                  getTransform:	function
	                setAlwaysOnTop:	function
	               enterModalState:	function
	              isCurrentlyModal:	function
	                     mouseExit:	function
	             deleteAllChildren:	function
	                    mouseEnter:	function
	                getMouseCursor:	function
	               getWindowHandle:	function


Attributes:

-----------------------------------------------------------------
```