# mouse-fix

This is a simple Lua method for panels that have a broken mouse cursor for some or all components.
```lua
The mouse cursor disappears when mouse is over it. Just paste this method to the console and run it (that means, paste this code, press enter, this will compile the code, then remove the input from the console and run the method by typing “fixMouseCursor()” and pressing enter)

function fixMouseCursor()
	-- Your method code here
	for i=0,panel:getNumModulators()-1 do

		m = panel:getModulatorByIndex(i)
		
		if m ~= nil then
			c = m:getComponent()

			if c ~= nil then
				c:setProperty("componentMouseCursor", 2,false)
			end

		end
	end
end
```