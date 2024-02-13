function getPackedParametersData(pPar)
	
	-- What we need to do here is:
	-- Get value
	-- Convert it to the bin format
	-- Repeat for all the values in packed data
	-- Concat bin values into one
	-- Convert it to dec

	local vTab = {}

	if pPar == 1 then
		vTab[3] = reduceStr(dec2bin(getCompValue("Amp Velo Trigger")), 1)
		vTab[2] = reduceStr(dec2bin(getCompValue("Mod Velo Trigger")), 1)
		vTab[1] = reduceStr(dec2bin(getCompValue("FM Velo Trigger")), 1)

	elseif pPar == 2 then
		vTab[3] = reduceStr(dec2bin(getCompValue("Voice Unison")), 3)
		vTab[2] = reduceStr(dec2bin(getCompValue("Poly Mode")), 2)
		vTab[1] = reduceStr(dec2bin(getCompValue("Filter Slope")), 1)

	elseif pPar == 3 then
		vTab[4] = reduceStr(dec2bin(getCompValue("OSC1 Octave")), 2)
		vTab[3] = reduceStr(dec2bin(getCompValue("OSC2 Octave")), 2)
		vTab[2] = reduceStr(dec2bin(getCompValue("OSC3 Octave")), 2)
		vTab[1] = reduceStr(dec2bin(getCompValue("OSC 1-2 Sync")), 1)

	elseif pPar == 4 then
		vTab[2] = reduceStr(dec2bin(getCompValue("LFO1 Mode")), 1)
		vTab[1] = reduceStr(dec2bin(getCompValue("LFO2 Mode")), 1)

	elseif pPar == 5 then
		vTab[6] = reduceStr(dec2bin(getCompValue("LFO1 Phase Offset")), 1)
		vTab[5] = reduceStr(dec2bin(getCompValue("LFO1 Keysync")), 1)
		vTab[4] = reduceStr(dec2bin(getCompValue("LFO1 All Voices")), 1)
		vTab[3] = reduceStr(dec2bin(getCompValue("LFO2 Phase Offset")), 1)
		vTab[2] = reduceStr(dec2bin(getCompValue("LFO2 Keysync")), 1)
		vTab[1] = reduceStr(dec2bin(getCompValue("LFO2 All Voices")), 1)

	elseif pPar == 6 then
		vTab[4] = reduceStr(dec2bin(getCompValue("Arp Octave Num")), 2)
		vTab[3] = reduceStr(dec2bin(getCompValue("Arp Switch")), 1)
		vTab[2] = reduceStr(dec2bin(getCompValue("Arp Keysync")), 1)
		vTab[1] = reduceStr(dec2bin(getCompValue("Arp Latch")), 1)

	elseif pPar == 7 then
		vTab[2] = reduceStr(dec2bin(getCompValue("Reverb Type")), 3)
		vTab[1] = reduceStr(dec2bin(getCompValue("Chorus Type")), 1)

	elseif pPar == 8 then
		vTab[3] = reduceStr(dec2bin(getCompValue("Chorus Global Sync")), 2)
		vTab[2] = reduceStr(dec2bin(getCompValue("Autopan GSync")), 2)
		-- EQ Global Sync
		vTab[1] = reduceStr(dec2bin(0), 2)

	elseif pPar == 10 then
		vTab[2] = reduceStr(dec2bin(0), 3)
		vTab[1] = reduceStr(dec2bin(getCompValue("Voice Octave")), 4)

	end

	return bin2dec(table.concat(vTab))
end