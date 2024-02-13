function showOpenPresetMenu()
	
	if panelFullyLoaded == 0 then
		return
	end

	local pwOpenPreset = PopupMenu()

	-- Need to refill presets here
	pwOpenPreset = refillPresetsPopup(pwOpenPreset, true)

	local retVal = pwOpenPreset:show(0, 0, 0, 22)

	processMenuRetVal(retVal)
end