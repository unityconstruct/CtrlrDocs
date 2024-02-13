function getRenameWMResult(result, window)
	
	window:setVisible (false)

	if result == 1 and window:getTextEditor("presetNewName") ~= nil then
		setNewPresetName(selectedPresetNumber, window:getTextEditor("presetNewName"):getText())
	end
end