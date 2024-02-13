function saveSingleProgramToDisk()

	-- Default filename will be like current preset name
	local cPresName = panel:getComponent("lblProgramName"):getProperty("uiLabelText")

	-- File to save
	local dumpFile = utils.saveFileWindow("Save preset to file..", File(removeSystemSymbols(cPresName)), "*.syx", true)

	-- Writing data to the file
	dumpFile:replaceWithData(MemoryBlock(getPanelData()))
end