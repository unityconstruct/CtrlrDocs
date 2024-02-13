function selectPreviousPreset()
	
	if panelFullyLoaded == 0 then
		return
	end

	if selectedPresetNumber == 1 then
		selectedPresetNumber = 100
	else
		selectedPresetNumber = selectedPresetNumber - 1
	end

	selectPreset(selectedPresetNumber)
end