function bankChangeActions()
	
	if panelFullyLoaded == 0 then
		return
	end

	-- Selecting program after bank change
	local pNum = panel:getModulatorByName("Program Number"):getValue()

	panel:getModulatorByName("Program Number"):setValue(pNum, true)
end