# nbsp in LUA
 > John Goodland edited this page on Sep 2, 2022 · 2 revisions
- We came across a weird error the other day.
- If a label has leading spaces they will be stripped from the display (but still be there in the editor box).
- To work around this you can add a "\160" in to preserve the spacing (important for LCD replication, for example)
- Here's the code
```lua
for i = textStart, 43 do -- gets the title of the screen
        	text = text .. string.char(data:getByte(i))
    	end

row1Text = string.format("%s\160\n",text) --  extra space char is needed to keep the text in line with the graphics

--- 

finalText = row1Text..row2Text .. row3Text .. row4Text .. row5Text .. row6Text .. row7Text..row8Text
		panel:getModulatorByName("mainText"):getComponent():setComponentText(finalText)
```
