function storeSinglePatch(bNum, pNum, sNum)
	
	local cProg = programBank[pNum]

	-- Message type set to Record Program
	cProg[8] = 0x01

	-- Set new bank value
	cProg[12] = bNum

	-- Set program number in the synth to save
	if sNum ~= nil then
		cProg[13] = sNum
	else
		cProg[13] = pNum - 1
	end

	sendMSG(cProg)
end