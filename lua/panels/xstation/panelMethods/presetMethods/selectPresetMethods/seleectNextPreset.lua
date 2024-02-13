function selectNextPreset()
	
	if panelFullyLoaded == 0 then
		return
	end

	if selectedPresetNumber == 100 then
		selectedPresetNumber = 1
	else
		selectedPresetNumber = selectedPresetNumber + 1
	end

	selectPreset(selectedPresetNumber)
end