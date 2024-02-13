function selectPreset(sPreset)
	
	-- Setting this flag to avoid data duplication
	newPresetSelected = true

	assignParameters(programBank[sPreset])
	setPresetName(getSelectedPresetName(sPreset), sPreset)
	selectedPresetNumber = sPreset

	-- Autosend preset to the synthesizer
	if (sendDataOnProgramChange) and (panelFullyLoaded == 1) then
		sendPanelData()
	end
end