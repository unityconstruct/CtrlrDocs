function midiListener(midiMessage)
	
	if isGettingMidiDumpState == true then

		if midiMessage:getSize() > 14 then

			receivedProgramBytes:append(midiMessage:getData())

			panel:getComponent("lblProgramChanges"):setText(string.format("Bytes received: %d", receivedProgramBytes:getSize()))
			
			console(tostring(receivedProgramBytes:getSize()))

			-- Max dump size from x-station is 27000 bytes (270 bytes per preset)
			if receivedProgramBytes:getSize() >= 27000 then

				panel:getModulatorByName("Get Program"):setValue(0, true)
			end
		end
	end
end