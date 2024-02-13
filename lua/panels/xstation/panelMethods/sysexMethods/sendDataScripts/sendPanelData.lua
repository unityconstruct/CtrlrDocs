function sendPanelData()
	
	if panelFullyLoaded == 0 then
		return
	end

	-- Sending panel data to a synth
	sendMSG(getPanelData())
end