function refillPresetsPopup(presetPUWin, toOpen)

	local i
	local j
	local presetName = ""
	local puID = 101

	if toOpen == false then
		puID = 301
		presetPUWin:addSectionHeader("Save preset:")
	else
		presetPUWin:addSectionHeader("Open preset:")
	end

	for i = 1, 100 do 

		presetName = getSelectedPresetName(i)

		if i == selectedPresetNumber then
			presetPUWin:addItem(puID, tostring(i) .. ". " .. presetName, true, true)
		else
			presetPUWin:addItem(puID, tostring(i) .. ". " .. presetName, true, false)
		end

		puID = puID + 1
	end

	return presetPUWin
end