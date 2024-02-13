function setMidiDumpState(mdState)
	
	if mdState == true then

		-- Prevent sending messages to synth during dump loading
		panel:setPropertyString("panelMidiPauseOut", "1")

		-- Disable sending last control value to info label
		panel:getComponent("lblProgramChanges"):setPropertyString("uiLabelDisplaysAllValues", "0")

		-- Set info label text to empty
		panel:getComponent("lblProgramChanges"):setPropertyString("uiLabelText", "Waiting for MIDI data")

		-- Just to make sure temp storage will be empty
		receivedProgramBytes = MemoryBlock()

		-- Panel ready for midi dump
		isGettingMidiDumpState = true
	else
		-- If size fits to single program, then it's a single program dump
		if (receivedProgramBytes:getSize() < 271) and (receivedProgramBytes:getSize() > 0) then

			processSingleProgram(receivedProgramBytes, selectedPresetNumber)
		else

			-- If size fits to bulk dump, then process bulk dump
			-- If not - just ignore it
			if (receivedProgramBytes:getSize() <= 27000) and (receivedProgramBytes:getSize() > 0) then

				processBulkDump(receivedProgramBytes, 1)
			end
		end

		-- Freeing temp storage
		receivedProgramBytes = MemoryBlock()

		-- Panel ignore incoming data
		isGettingMidiDumpState = false

		-- Restoring midi exchange
		panel:setPropertyString("panelMidiPauseOut", "0")

		-- Enable sending last control value to info label
		panel:getComponent("lblProgramChanges"):setPropertyString("uiLabelDisplaysAllValues", "1")

		-- Set info label text to empty
		panel:getComponent("lblProgramChanges"):setText("Transmission over")
	end
end