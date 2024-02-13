function resendSelectedBank()
	
	if panelFullyLoaded == 0 then
		return
	end

	-- For some reason X-Station resets bank selection right after first program change
	-- So we just sending selected bank number after every program change here

	local bNum = panel:getModulatorByName("Selected Bank"):getValue() + 1
	local midiMsg = string.format("B0 20 0%d", bNum)

	panel:sendMidiMessageNow(CtrlrMidiMessage(midiMsg))
end