function saveStateOps(stateData)
	
	local i

	-- Saving patch bank values
	for i = 1, 100 do
		stateData:setProperty(string.format("progBank%d", i), toCSV(programBank[i]), nil)
	end

	stateData:setProperty("selectedProg", tostring(selectedPresetNumber), nil)
	stateData:setProperty("sendDataOnStartup", boolToStr(sendDataOnStartup), nil)
	stateData:setProperty("sendDataOnProgramChange", boolToStr(sendDataOnProgramChange), nil)
end