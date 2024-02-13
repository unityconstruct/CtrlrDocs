
function startupDelayTimer(delayTime)

	timer:setCallback (1, startupCallback)
	timer:startTimer(1, delayTime)
end

function startupCallback()

	-- Assign all the values with last opened preset
	selectPreset(selectedPresetNumber)

	panelFullyLoaded = 1
	
	-- Sending data to synth if it's necessary
	if sendDataOnStartup == true then
		sendPanelData()
	end

	-- Setting label to show all values
	panel:getComponent("lblProgramChanges"):setPropertyString("uiLabelDisplaysAllValues", "1")

	timer:stopTimer(1)
end

function sendFXChangeTimer(ms)

	timer:setCallback (2, sendFXChangeCallback)
	timer:startTimer(2, ms)
end

function sendFXChangeCallback()

	-- Sending panel data on timer
	if newPresetSelected == false then
		sendPanelData()
	end

	newPresetSelected = false
	
	timer:stopTimer(2)
end