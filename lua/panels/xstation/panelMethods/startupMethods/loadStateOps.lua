function loadStateOps(stateData)
	
	local i

	-- Retrieving patch bank values
	for i = 1, 100 do
		programBank[i] = fromCSV(stateData:getProperty(string.format("progBank%d", i)))
	end

	selectedPresetNumber = tonumber(stateData:getProperty("selectedProg"))
	sendDataOnStartup = strToBool(stateData:getProperty("sendDataOnStartup"))
	sendDataOnProgramChange = strToBool(stateData:getProperty("sendDataOnProgramChange"))
end