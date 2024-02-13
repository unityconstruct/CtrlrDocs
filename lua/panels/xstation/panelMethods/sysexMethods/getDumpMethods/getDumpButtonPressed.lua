function getDumpButtonPressed(mod, value, source)

	if panelFullyLoaded == 0 then
		return
	end

	setMidiDumpState(strToBool(tostring(value)))
end