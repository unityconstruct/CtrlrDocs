function readSingleProgram()

	-- File open dialog
	local bulkDump = utils.openFileWindow("Select X-Station single program file", File(""), "*.syx;*.mid", true)
	local dumpBytes = MemoryBlock()

	-- If file exists, then proceed
	if bulkDump:existsAsFile() then

		dumpBytes = MemoryBlock(bulkDump:getSize())
		bulkDump:loadFileAsData(dumpBytes)
	else
		return
	end

	if (bulkDump:getSize() > 270) then
		utils.warnWindow("Warning", "Wrong file size, operation cancelled")
	else
		processSingleProgram(dumpBytes, selectedPresetNumber)
		-- Congratulations! X-Station dump successfully imported!
	end
end