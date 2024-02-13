function setNewPresetName(pNumber, newName)
	
	local i
	
	for i = string.len(newName) + 1, 16 do
		newName = newName .. " "
 	end

	for i = 165, 180 do
		-- Converting one char to byte
		programBank[pNumber][i] = string.byte(newName, i - 164, i - 164)
	end

	setPresetName(getSelectedPresetName(pNumber), pNumber)
end