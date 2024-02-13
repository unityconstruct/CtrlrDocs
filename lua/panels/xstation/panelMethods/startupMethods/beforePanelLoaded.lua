function beforePanelLoaded()
	
	local i

	-- Full load signal
	panelFullyLoaded = 0

	-- Show extra controls flag
	extraParamsMode = false

	-- Ready to get midi dump flag
	isGettingMidiDumpState = false

	selectedPresetNumber = 1

	-- MIDI dump temporary storage
	receivedProgramBytes = {}

	programBank = {}

	-- Initialising empty patch bank
	initPresetBank()

	-- Send panel data at startup flag
	sendDataOnStartup = false

	-- Send panel data on program change flag
	sendDataOnProgramChange = true

	-- New preset selected flag
	newPresetSelected = true
end