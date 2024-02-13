drawADSRCanvas = function(comp, g)

	local lClr = Colour(tonumber("0x" .. panel:getComponent("Amp Attack"):getProperty("uiSliderTrackColour")))

	local startXPoints = {37, 65, 93, 121, 185, 213, 241, 269, 321, 349}
	local startYPoints = {36, 50, 78, 92}
	local i = 0

	g:setColour(lClr)

	-- Draw small lines
	for j = 1, #startYPoints do
		for i = 1, #startXPoints do
			g:fillRect(startXPoints[i], startYPoints[j], 17, 1)
		end
	end

	-- Draw big lines
	for i = 1, #startXPoints do
		g:fillRect(startXPoints[i] - 3, 63, 23, 2)
	end
end