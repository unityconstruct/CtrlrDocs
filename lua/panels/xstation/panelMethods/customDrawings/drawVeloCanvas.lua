drawVeloCanvas = function(comp, g)

	g:setColour(Colour(0xCC555555))

	-- Big line
	g:fillRect(5, 37, 1, 124)

	-- Top line
	g:fillRect(5, 36, 10, 1)

	-- Middle line
	g:fillRect(5, 99, 10, 1)

	-- Bottom line
	g:fillRect(5, 160, 10, 1)
end