function saveProgramBankToDisk()
	
	-- File to save
	local dumpFile = utils.saveFileWindow("Save patch bank to file..", File("x-station"), "*.syx", true)

	-- Writing data to the file
	dumpFile:replaceWithData(MemoryBlock(getFullBankDataBytes()))
end