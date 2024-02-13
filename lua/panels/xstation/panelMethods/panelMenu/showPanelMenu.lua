function showPanelMenu()

	if panelFullyLoaded == 0 then
		return
	end

	local pwOpenPreset = PopupMenu()
	local pwSavePreset = PopupMenu()

	-- Need to refill presets here
	pwOpenPreset = refillPresetsPopup(pwOpenPreset, true)
	pwSavePreset = refillPresetsPopup(pwSavePreset, false)

	local popupWin = PopupMenu()

	popupWin:addSectionHeader("Panel menu:")
	popupWin:addSeparator()

	popupWin:addItem(20, "Show extra controls", true, extraParamsMode)
	popupWin:addSeparator()

	popupWin:addItem(15, "Send data on startup", true, sendDataOnStartup)
	popupWin:addItem(16, "Send data on preset change", true, sendDataOnProgramChange)
	popupWin:addSeparator()

	popupWin:addSubMenu("Open preset", pwOpenPreset, true, Image(), false, 0)
	popupWin:addSeparator()

	popupWin:addSeparator()
	popupWin:addItem(3, "Save preset", true, false)
	popupWin:addSubMenu("Save preset as", pwSavePreset, true, Image(), false, 0)

	popupWin:addSeparator()
	popupWin:addItem(4, "Rename preset", true, false)
	
	popupWin:addSeparator()
	popupWin:addItem(1, "Load *.syx dump from disk", true, false)
	popupWin:addItem(2, "Save *.syx dump on disk", true, false)

	popupWin:addSeparator()
	popupWin:addItem(5, "Load single program from disk", true, false)
	popupWin:addItem(6, "Save single program to disk", true, false)

	popupWin:addSeparator()
	popupWin:addItem(8, "Store single program", true, false)
	popupWin:addItem(9, "Store full bank", true, false)

	popupWin:addSeparator()
	popupWin:addItem(7, "Init patch bank", true, false)

	local retVal = popupWin:show(0, 0, 0, 22)

	processMenuRetVal(retVal)
end