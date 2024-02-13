function renameChosenPreset()
	
	-- Construct dialog window
	local modalWindow = AlertWindow("Info", "Input new preset name:", AlertWindow.InfoIcon)
	modalWindow:addButton("OK", 1, KeyPress(KeyPress.returnKey), KeyPress())
	modalWindow:addButton("Cancel", 0, KeyPress(KeyPress.escapeKey), KeyPress())
	modalWindow:addTextEditor("presetNewName", getSelectedPresetName(selectedPresetNumber), "16 characters max", false)
	modalWindow:setModalHandler(getRenameWMResult)
	modalWindow:runModalLoop()
end