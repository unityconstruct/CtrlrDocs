
paintLCDScreen = function(--[[ CtrlrComponent --]] comp, --[[ CtrlrComponent --]] g)

	-- Filling dark background
	g:fillAll(Colour(0xFF202020))

	g:setColour(Colour(0xFF2062E3))

	-- Filling light blue
	g:fillRoundedRectangle(10, 10, comp:getWidth() - 20, comp:getHeight() - 20, 3)

	-- Setting a bit darker colour
	g:setColour(Colour(0xFF1052D3))

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