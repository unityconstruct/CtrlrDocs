function savePresetAs(pNum)
	
	local bNum = panel:getModulatorByName("Selected Bank"):getValue()

	programBank[pNum] = getPanelData()
	alterPBValues(bNum, pNum)
	selectPreset(pNum)
end