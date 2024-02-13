function processMenuRetVal(rVal)
	
	if rVal == 0 then
		return
	end

	-- Read bulk dump file
	if rVal == 1 then
		readBulkDump()
	end

	-- Save bulk dump file to disk
	if rVal == 2 then
		saveProgramBankToDisk()
	end

	-- Save current preset
	if rVal == 3 then
		savePreset()
	end

	-- Rename current preset
	if rVal == 4 then
		renameChosenPreset()
	end

	-- Read single program from disk
	if rVal == 5 then
		readSingleProgram()
	end

	-- Save single program to disk
	if rVal == 6 then
		saveSingleProgramToDisk()
	end

	-- Initialize entire patch bank
	if rVal == 7 then
		if not utils.questionWindow("Warning!", "All existing data of current sound bank in the panel will be erased! Proceed?",
 									"OK", "Cancel") then
			return
		end

		initPresetBank()
		selectPreset(1)
	end

	-- Store single patch in the synth's memory
	if rVal == 8 then
		local bNum = panel:getModulatorByName("Selected Bank"):getValue()
		local sNum = panel:getModulatorByName("Program Number"):getValue()

	  	storeSinglePatch(bNum, selectedPresetNumber, sNum)
		panel:getModulatorByName("Program Number"):setValue(sNum, true)
	end

	-- Store full patch bank in the synth's memory
	if rVal == 9 then
		if not utils.questionWindow("Warning!", "All existing data of current sound bank in the synth will be replaced! Proceed?",
 									"OK", "Cancel") then
			return
		end

	  	sendPatchBank()
		panel:getModulatorByName("Program Number"):setValue(1, true)
	end

	-- Send data to the synth on startup
	if rVal == 15 then
		sendDataOnStartup = not sendDataOnStartup
	end

	-- Send data to the synth on program change
	if rVal == 16 then
		sendDataOnProgramChange = not sendDataOnProgramChange
	end

	-- Show extra controls
	if rVal == 20 then
		extraParamsMode = not extraParamsMode

		showHideExtraControls(extraParamsMode)
	end

	-- Open preset
	if rVal >= 101 and rVal <= 200 then

		selectPreset(rVal - 100)
	end

	-- Save preset as
	if rVal >= 301 and rVal <= 400 then

		savePresetAs(rVal - 300)
	end
end