function showAboutWindow()
	
	if panelFullyLoaded == 0 then
		return
	end

	local infoText = ""

	infoText = infoText .. "\nCreated by inteyes"

	utils.infoWindow("Novation X-Station Voice Editor v. 0.4.3", infoText)
end