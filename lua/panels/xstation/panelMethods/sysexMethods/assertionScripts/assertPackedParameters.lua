function convertPParByte(fullVal, sFrom, cTo)

	return bin2dec(string.sub(dec2bin(fullVal), sFrom, cTo))
end

function assertPackedParameters(pParNumber, pParValue)
	
	local bVal = 0
	local binStr = ""

	if pParNumber == 1 then

		-- bit 0 : amp env trigger 0=single 1=multi
		bVal = convertPParByte(pParValue, 8, 8)
		assertSingleParameter("Amp Velo Trigger", bVal)

		-- bit 1 : mod env trigger 0=single 1=multi
		bVal = convertPParByte(pParValue, 7, 7)
		assertSingleParameter("Mod Velo Trigger", bVal)

		-- bit 2 : fm env trigger 0=single 1=multi
		bVal = convertPParByte(pParValue, 6, 6)
		assertSingleParameter("FM Velo Trigger", bVal)

	elseif pParNumber == 2 then

		-- bits 0-2 : unison count
		bVal = convertPParByte(pParValue, 6, 8)
		assertSingleParameter("Voice Unison", bVal)

		-- bits 3-4 : voice polyphony mode
		bVal = convertPParByte(pParValue, 4, 5)
		assertSingleParameter("Poly Mode", bVal)

		-- bit 5 : filter type 0=12dB 1=24dB per octave
		bVal = convertPParByte(pParValue, 3, 3)
		assertSingleParameter("Filter Slope", bVal)

	elseif pParNumber == 3 then

		-- bits 0-1 : osc1 octave -1,0,1,2
		bVal = convertPParByte(pParValue, 7, 8)
		assertSingleParameter("OSC1 Octave", bVal)

		-- bits 2-3 : osc2 octave -1,0,1,2
		bVal = convertPParByte(pParValue, 5, 6)
		assertSingleParameter("OSC2 Octave", bVal)

		-- bits 4-5 : osc3 octave -1,0,1,2
		bVal = convertPParByte(pParValue, 3, 4)
		assertSingleParameter("OSC3 Octave", bVal)

		-- bit 6 : osc1>2 sync 1=on
		bVal = convertPParByte(pParValue, 2, 2)
		assertSingleParameter("OSC 1-2 Sync", bVal)

	elseif pParNumber == 4 then

		-- bit 0 : lfo1 delay multi 1=on
		bVal = convertPParByte(pParValue, 8, 8)
		assertSingleParameter("LFO1 Mode", bVal)

		-- bit 1 : lfo2 delay multi 1=on
		bVal = convertPParByte(pParValue, 7, 7)
		assertSingleParameter("LFO2 Mode", bVal)

	elseif pParNumber == 5 then

		-- bit 0 : lfo1 one-shot mode 1=on
		bVal = convertPParByte(pParValue, 8, 8)
		assertSingleParameter("LFO1 Phase Offset", bVal)

		-- bit 1 : lfo1 keysync 1=on
		bVal = convertPParByte(pParValue, 7, 7)
		assertSingleParameter("LFO1 Keysync", bVal)

		-- bit 2 : lfo1 lock 0=independent per voice 1=all voices same phase
		bVal = convertPParByte(pParValue, 6, 6)
		assertSingleParameter("LFO1 All Voices", bVal)

		-- bit 3 : lfo2 one-shot mode 1=on
		bVal = convertPParByte(pParValue, 5, 5)
		assertSingleParameter("LFO2 Phase Offset", bVal)

		-- bit 4 : lfo2 keysync 1=on
		bVal = convertPParByte(pParValue, 4, 4)
		assertSingleParameter("LFO2 Keysync", bVal)

		-- bit 5 : lfo2 lock 0=independent per voice 1=all voices same phase
		bVal = convertPParByte(pParValue, 3, 3)
		assertSingleParameter("LFO2 All Voices", bVal)

	elseif pParNumber == 6 then

		-- bits 0-1 : number of octaves 1,2,3,4
		bVal = convertPParByte(pParValue, 7, 8)
		assertSingleParameter("Arp Octave Num", bVal)

		-- bit 2 : arpeggiator off/on 1=on
		bVal = convertPParByte(pParValue, 6, 6)
		assertSingleParameter("Arp Switch", bVal)

		-- bit 3 : arpeggiator keysync control 1=on
		bVal = convertPParByte(pParValue, 5, 5)
		assertSingleParameter("Arp Keysync", bVal)

		-- bit 4 : arpeggiator latch control 1=on
		bVal = convertPParByte(pParValue, 4, 4)
		assertSingleParameter("Arp Latch", bVal)

	elseif pParNumber == 7 then

		-- bits 0-2 : reverb type (values 6,7 not used)
		bVal = convertPParByte(pParValue, 6, 8)
		assertSingleParameter("Reverb Type", bVal)

		-- bit 3 : chorus/phaser control 0=chorus 1=phaser
		bVal = convertPParByte(pParValue, 5, 5)
		assertSingleParameter("Chorus Type", bVal)

	elseif pParNumber == 8 then

		-- bits 0-1 : chorus global sync off,left,centre,right
		bVal = convertPParByte(pParValue, 7, 8)
		assertSingleParameter("Chorus Global Sync", bVal)

		-- bits 2-3 : pan global sync off,left,centre,right
		bVal = convertPParByte(pParValue, 5, 6)
		assertSingleParameter("Autopan GSync", bVal)

		-- bits 4-5 : eq frequency global sync off,low,mid,high
		--bVal = convertPParByte(pParValue, 3, 4)
		--assertSingleParameter("EQ GSync Type", bVal)

	elseif pParNumber == 9 then

		-- Audio input controls, ignoring

	elseif pParNumber == 10 then

		-- bits 3-6 : signed keyboard octave shift -3..+3
		bVal = convertPParByte(pParValue, 2, 5)
		assertSingleParameter("Voice Octave", bVal)

	elseif pParNumber == 11 then

		-- Selectors handling, ignoring

	end
end