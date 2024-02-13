function assignParameters(valsArray)
	
	-- Stop sending midi while setting parameters
	panel:setPropertyString("panelMidiPauseOut", "1")

	-- First 13 bytes are headers

	-- 0 UNISON / VOICE TYPE / FILTER TYPE (packed parameter 2)
	assertPackedParameters(2, valsArray[14])

	-- 1 UNISON DETUNE
	assertSingleParameter("Unison Detune", valsArray[15])

	-- 2 INDIVIDUAL OSCILLATOR RANDOM DETUNE (VCO DRIFT)
	assertSingleParameter("VCO Drift", valsArray[16])

	-- 3 PORTAMENTO TIME
	assertSingleParameter("Voice Portamento", valsArray[17])

	-- 4 PREGLIDE SEMITONES (64 = 0) -12..+12 (0=preglide disabled)
	assertSingleParameter("Voice Preglide", valsArray[18] - 52)

	-- 5 PORTAMENTO MODE (0=exp, 1=linear)
	assertSingleParameter("Voice Portamento Mode", valsArray[19])

	-- 6 OSC 1,2,3 OCTAVE / OSC 1>2 SYNC (packed parameter 3)
	assertPackedParameters(3, valsArray[20])

	-- 7 OSC1 SEMITONE (64 = 0) -12..+12
	assertSingleParameter("OSC1 Semitone", valsArray[21] - 52)

	-- 8 OSC1 CENT (64 = 0) -50..+50
	assertSingleParameter("OSC1 Detune", valsArray[22] - 14)

	-- 9 OSC1 BENDWHEEL PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC1 Pitchbend", valsArray[23])

	-- 10 OSC1 LFO1 PITCH AMOUNT (64 = 0)
	assertSingleParameter("LFO1 OSC1 Pitch", valsArray[24])

	-- 11 OSC1 MOD.ENV PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC1 Pitch Env", valsArray[25])

	-- 12 OSC1 PULSE WIDTH POSITION (64 = 0) (0=50% or in-phase double wave)
	assertSingleParameter("OSC1 Pulsewidth", valsArray[26])

	-- 13 OSC1 LFO2 PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("LFO2 OSC1 PWM", valsArray[27])

	-- 14 OSC1 MOD.ENV PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("OSC1 PW Env", valsArray[28])

	-- 15 OSC2 SEMITONE (64 = 0) -12..+12
	assertSingleParameter("OSC2 Semitone", valsArray[29] - 52)

	-- 16 OSC2 CENT (64 = 0) -50..+50
	assertSingleParameter("OSC2 Detune", valsArray[30] - 14)

	-- 17 OSC2 BENDWHEEL PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC2 Pitchbend", valsArray[31])

	-- 18 OSC2 LFO1 PITCH AMOUNT (64 = 0)
	assertSingleParameter("LFO1 OSC2 Pitch", valsArray[32])

	-- 19 OSC2 MOD.ENV PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC2 Pitch Env", valsArray[33])

	-- 20 OSC2 PULSE WIDTH POSITION (64 = 0) (0=50% or in-phase double wave)
	assertSingleParameter("OSC2 Pulsewidth", valsArray[34])

	-- 21 OSC2 LFO2 PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("LFO2 OSC2 PWM", valsArray[35])

	-- 22 OSC2 MOD.ENV PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("OSC2 PW Env", valsArray[36])

	-- 23 OSC3 SEMITONE (64 = 0) -12..+12
	assertSingleParameter("OSC3 Semitone", valsArray[37] - 52)

	-- 24 OSC3 CENT (64 = 0) -50..+50
	assertSingleParameter("OSC3 Detune", valsArray[38] - 14)

	-- 25 OSC3 BENDWHEEL PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC3 Pitchbend", valsArray[39])

	-- 26 OSC3 LFO1 PITCH AMOUNT (64 = 0)
	assertSingleParameter("LFO1 OSC3 Pitch", valsArray[40])

	-- 27 OSC3 MOD.ENV PITCH AMOUNT (64 = 0)
	assertSingleParameter("OSC3 Pitch Env", valsArray[41])

	-- 28 OSC3 PULSE WIDTH POSITION (64 = 0) (0=50% or in-phase double wave)
	assertSingleParameter("OSC3 Pulsewidth", valsArray[42])

	-- 29 OSC3 LFO2 PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("LFO2 OSC3 PWM", valsArray[43])

	-- 30 OSC3 MOD.ENV PULSE WIDTH MOD (64 = 0)
	assertSingleParameter("OSC3 PW Env", valsArray[44])

	-- 31 OSCs 1,2,3 MODWHEEL DIRECT PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs to MW", valsArray[45])

	-- 32 OSCs 1,2,3 AFTERTOUCH DIRECT PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs to AT", valsArray[46])

	-- 33 OSCs 1,2,3 BREATH DIRECT PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs to BR", valsArray[47])

	-- 34 OSCs 1,2,3 MODWHEEL LFO1 PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs LFO1 to MW", valsArray[48])

	-- 35 OSCs 1,2,3 AFTERTOUCH LFO1 PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs LFO1 to AT", valsArray[49])

	-- 36 OSCs 1,2,3 BREATH LFO1 PITCH DEPTH (64 = 0)
	assertSingleParameter("OSCs LFO1 to BR", valsArray[50])

	-- 37 OSC1 LEVEL (to filter)
	assertSingleParameter("OSC1 Level", valsArray[51])

	-- 38 OSC2 LEVEL (to filter)
	assertSingleParameter("OSC2 Level", valsArray[52])

	-- 39 OSC3 LEVEL (to filter)
	assertSingleParameter("OSC3 Level", valsArray[53])

	-- 40 NOISE LEVEL (to filter)
	assertSingleParameter("Noise Level", valsArray[54])

	-- 41 OSC 1*2 RINGMOD LEVEL (to filter)
	assertSingleParameter("Ring 1-2", valsArray[55])

	-- 42 AUDIO INPUT LEVEL (to filter)
	--assertSingleParameter("", valsArray[56])

	-- 43 FILTER OVERDRIVE
	assertSingleParameter("Filter Overdrive", valsArray[57])

	-- 44 FILTER RESONANCE
	assertSingleParameter("Filter Res", valsArray[58])

	-- 45 FILTER Q NORMALISE (127=zero filter drive at max resonance)
	assertSingleParameter("Filter QNorm", valsArray[59])

	-- 46 FILTER FREQUENCY
	assertSingleParameter("Filter Cutoff", valsArray[60])

	-- 47 FILTER KEYBOARD TRACKING (0=NONE, 127=PRECISE PITCH TRACK)
	assertSingleParameter("Filter Keytrack", valsArray[61])

	-- 48 FILTER MODWHEEL DIRECT FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq Dpt to MW", valsArray[62])

	-- 49 FILTER AFTERTOUCH DIRECT FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq Dpt to AT", valsArray[63])

	-- 50 FILTER BREATH DIRECT FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq Dpt to BR", valsArray[64])

	-- 51 FILTER FREQUENCY LFO2 MOD DEPTH (64 = 0)
	assertSingleParameter("LFO2 Filter Mod", valsArray[65])

	-- 52 FILTER FREQUENCY MOD.ENV DEPTH (64 = 0)
	assertSingleParameter("Filter Env", valsArray[66])

	-- 53 FILTER MODWHEEL LFO2 FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq LFO2 Dpt to MW", valsArray[67])

	-- 54 FILTER AFTERTOUCH LFO2 FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq LFO2 Dpt to AT", valsArray[68])

	-- 55 FILTER BREATH LFO2 FREQUENCY DEPTH (64 = 0)
	assertSingleParameter("FFq LFO2 Dpt to BR", valsArray[69])

	-- 56 OSC 2>3 FM FIXED LEVEL
	assertSingleParameter("FM 2-3", valsArray[70])

	-- 57 OSC 2>3 FM ENVELOPE DEPTH (64 = 0)
	assertSingleParameter("FM Envelope Amount", valsArray[71])

	-- 58 OSC 2>3 FM ENVELOPE VELOCITY DEPTH (64 = 0)
	assertSingleParameter("FM Velocity", valsArray[72])

	-- 59 OSC 2>3 FM ENVELOPE ATTACK
	assertSingleParameter("FM Attack", valsArray[73])

	-- 60 OSC 2>3 FM ENVELOPE DECAY
	assertSingleParameter("FM Decay", valsArray[74])

	-- 61 AMPLITUDE ENVELOPE VELOCITY DEPTH (64 = 0)
	assertSingleParameter("ADSR Velocity", valsArray[75])

	-- 62 AMPLITUDE ENVELOPE ATTACK
	assertSingleParameter("Amp Attack", valsArray[76])

	-- 63 AMPLITUDE ENVELOPE DECAY
	assertSingleParameter("Amp Decay", valsArray[77])

	-- 64 AMPLITUDE ENVELOPE SUSTAIN
	assertSingleParameter("Amp Sustain", valsArray[78])

	-- 65 AMPLITUDE ENVELOPE RELEASE
	assertSingleParameter("Amp Release", valsArray[79])

	-- 66 MOD. ENVELOPE VELOCITY DEPTH (64 = 0)
	assertSingleParameter("Mod Velocity", valsArray[80])

	-- 67 MOD. ENVELOPE ATTACK
	assertSingleParameter("Filter Attack", valsArray[81])

	-- 68 MOD. ENVELOPE DECAY
	assertSingleParameter("Filter Decay", valsArray[82])

	-- 69 MOD. ENVELOPE SUSTAIN
	assertSingleParameter("Filter Sustain", valsArray[83])

	-- 70 MOD. ENVELOPE RELEASE
	assertSingleParameter("Filter Release", valsArray[84])

	-- 71 (not used)

	-- 72 NON-SYNC LFO1 SPEED
	assertSingleParameter("LFO1 Speed", valsArray[86])

	-- 73 SYNC LFO1 SPEED 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("LFO1 Sync Speed", valsArray[87])

	-- 74 LFO1 DELAY (GRADUAL ONSET TIME / ONE-SHOT MODE DELAY)
	assertSingleParameter("LFO1 Delay", valsArray[88])

	-- 75 NON-SYNC LFO2 SPEED
	assertSingleParameter("LFO2 Speed", valsArray[89])

	-- 76 SYNC LFO2 SPEED 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("LFO2 Sync Speed", valsArray[90])

	-- 77 LFO2 DELAY (GRADUAL ONSET TIME / ONE-SHOT MODE DELAY)
	assertSingleParameter("LFO2 Delay", valsArray[91])

	-- 78 LFO 1,2 DELAY MONO MULTI MODE (packed parameter 4)
	assertPackedParameters(4, valsArray[92])

	-- 79 LFO 1,2 KEYSYNC / LOCK / ONE-SHOT (packed parameter 5)
	assertPackedParameters(5, valsArray[93])

	-- 80 ENVELOPE MONO MULTI MODES (packed parameter 1)
	assertPackedParameters(1, valsArray[94])

	-- 81 AMPLITUDE MODWHEEL DIRECT DEPTH (64 = 0)
	assertSingleParameter("Amp Dpt to MW", valsArray[95])

	-- 82 AMPLITUDE AFTERTOUCH DIRECT DEPTH (64 = 0)
	assertSingleParameter("Amp Dpt to AT", valsArray[96])

	-- 83 AMPLITUDE BREATH DIRECT DEPTH (64 = 0)
	assertSingleParameter("Amp Dpt to BR", valsArray[97])

	-- 84 ARPEGGIATOR/GENERAL SYNC RATE (64..191 bpm) (common)
	assertSingleParameter("Arp Tempo", valsArray[98])

	-- 85 ARPEGGIATOR SYNC SETTING 0..15 (32Triplet..1 bar)
	assertSingleParameter("Arp Sync Time", valsArray[99])

	-- 86 ARPEGGIATOR GATE TIME (64 = 0)(+63 gives tied notes in mono mode)
	assertSingleParameter("Arp Gate Time", valsArray[100])

	-- 87 ARP MODE (0..6 = up, down, ud1, ud2, order, random, chord)
	assertSingleParameter("Arp Pattern Mode", valsArray[101])

	-- 88 ARPEGGIATOR CONTROL (packed parameter 6)
	assertPackedParameters(6, valsArray[102])

	-- 89..91 NOT USED

	-- 92 EQ LEVEL (64 = 0) (0, 1..63, 64, 65..126, 127 = LP, LPshelf, flat, HPshelf, HP)
	--assertSingleParameter("", valsArray[106])

	-- 93 EQ FREQUENCY
	--assertSingleParameter("", valsArray[107])

	-- 94 NON-SYNC EQ MOD RATE
	--assertSingleParameter("", valsArray[108])

	-- 95 SYNC EQ MOD RATE 0..34 (non-sync, 32Triplet..12bars)
	--assertSingleParameter("", valsArray[109])

	-- 96 EQ MOD DEPTH
	--assertSingleParameter("", valsArray[110])

	-- 97 DISTORTION LEVEL
	assertSingleParameter("Dist Level", valsArray[111])

	-- 98 MODWHEEL DISTORTION (64 = 0)
	assertSingleParameter("Dist Send to MW", valsArray[112])

	-- 99 DISTORTION COMPENSATION
	assertSingleParameter("Dist Compensation", valsArray[113])

	-- 100 DELAY SEND LEVEL
	assertSingleParameter("Delay Level", valsArray[114])

	-- 101 MODWHEEL DELAY SEND
	assertSingleParameter("Delay Send to MW", valsArray[115])

	-- 102 NON-SYNC DELAY TIME
	assertSingleParameter("Delay Time", valsArray[116])

	-- 103 SYNC DELAY TIME 0..19 (non-sync, 32Triplet..2bars)
	assertSingleParameter("Delay Sync Time", valsArray[117])

	-- 104 DELAY FEEDBACK
	assertSingleParameter("Delay Feedback", valsArray[118])

	-- 105 DELAY STEREO WIDTH
	assertSingleParameter("Delay Stereo Width", valsArray[119])

	-- 106 DELAY RATIO
	assertSingleParameter("Delay L/R Ratio", valsArray[120])

	-- 107 REVERB SEND LEVEL
	assertSingleParameter("Reverb Level", valsArray[121])

	-- 108 MODWHEEL REVERB SEND (64 = 0)
	assertSingleParameter("Reverb Send to MW", valsArray[122])

	-- 109 REVERB DECAY
	assertSingleParameter("Reverb Decay", valsArray[123])

	-- 110 CHORUS SEND LEVEL
	assertSingleParameter("Chorus Level", valsArray[124])

	-- 111 MODWHEEL CHORUS SEND (64 = 0)
	assertSingleParameter("Chorus Send to MW", valsArray[125])

	-- 112 NON-SYNC CHORUS RATE
	assertSingleParameter("Chorus Rate", valsArray[126])

	-- 113 SYNC CHORUS RATE 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("Chorus Sync Rate", valsArray[127])

	-- 114 CHORUS FEEDBACK (64 = 0)
	assertSingleParameter("Chorus Feedback", valsArray[128])

	-- 115 CHORUS MOD DEPTH
	assertSingleParameter("Chorus Depth", valsArray[129])

	-- 116 CHORUS MOD CENTRE POINT
	assertSingleParameter("Chorus Centre", valsArray[130])

	-- 117 PAN POSITION (64 = 0)
	assertSingleParameter("Pan Position", valsArray[131])

	-- 118 NON-SYNC PAN RATE
	assertSingleParameter("Autopan Rate", valsArray[132])

	-- 119 SYNC PAN RATE 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("Autopan Sync Rate", valsArray[133])

	-- 120 PAN MOD DEPTH
	assertSingleParameter("Autopan Depth", valsArray[134])

	-- 121 EFFECTS TYPE CONTROL (packed parameter 7)
	assertPackedParameters(7, valsArray[135])

	-- 122 EFFECTS GLOBAL SYNC CONTROL (packed parameter 8)
	assertPackedParameters(8, valsArray[136])

	-- 123 AUDIO INPUT CONTROL (packed parameter 9)
	assertPackedParameters(9, valsArray[137])

	-- 124 NOT USED

	-- 125 VOICE LEVEL TO OUTPUT & EFFECTS (0..30Db)
	assertSingleParameter("AMP Gain", valsArray[139])

	-- 126 EFFECT TYPE SELECTOR/KEYBOARD OCTAVE (packed parameter 10)
	assertPackedParameters(10, valsArray[140])

	-- 127 OSC, SOURCE, PW, LFO SELECTORS (packed parameter 11)
	assertPackedParameters(11, valsArray[141])

	-- 128 OSC1 WAVEFORM (0..31)
	assertSingleParameter("OSC1 Waveform", valsArray[142])

	-- 129 OSC2 WAVEFORM (0..31)
	assertSingleParameter("OSC2 Waveform", valsArray[143])

	-- 130 OSC3 WAVEFORM (0..31)
	assertSingleParameter("OSC3 Waveform", valsArray[144])

	-- 131 LFO1 WAVEFORM (0..31)
	assertSingleParameter("LFO1 Waveform", valsArray[145])

	-- 132 LFO2 WAVEFORM (0..31)
	assertSingleParameter("LFO2 Waveform", valsArray[146])

	-- 133 LFO1 UNIPOLAR (0= centre-zero, 1=all positive)
	assertSingleParameter("LFO1 Polarity", valsArray[147])

	-- 134 LFO2 UNIPOLAR (0= centre-zero, 1=all positive)
	assertSingleParameter("LFO2 Polarity", valsArray[148])

	-- 135 LFO1 KEYSYNC START PHASE (0..357 degrees)
	assertSingleParameter("LFO1 Phase", valsArray[149])

	-- 136 LFO2 KEYSYNC START PHASE (0..357 degrees)
	assertSingleParameter("LFO2 Phase", valsArray[150])

	-- 137 LFO1 SYNC DELAY TIME 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("LFO1 Sync Delay", valsArray[151])

	-- 138 LFO2 SYNC DELAY TIME 0..34 (non-sync, 32Triplet..12bars)
	assertSingleParameter("LFO2 Sync Delay", valsArray[152])

	-- 139 MIX MODULATION SELECTOR (0=normal, 1=pots control mod levels)
	--assertSingleParameter("", valsArray[153])

	-- 140 FILTER TYPE (0..2 = LP, BP, HP)
	assertSingleParameter("Filter Type", valsArray[154])

	-- 141 OSC1 LFO1 LEVEL MOD (64 = 0)
	assertSingleParameter("LFO1 OSC1 Level", valsArray[155])

	-- 142 OSC2 LFO2 LEVEL MOD (64 = 0)
	assertSingleParameter("LFO2 OSC2 Level", valsArray[156])

	-- 143 OSC3 A/D ENV LEVEL MOD (64 = 0)
	assertSingleParameter("OSC3 AD Amount", valsArray[157])

	-- 144 NOISE LFO1 LEVEL MOD (64 = 0)
	assertSingleParameter("LFO1 Noise Level", valsArray[158])

	-- 145 RING1*2 LFO1 LEVEL MOD (64 = 0)
	assertSingleParameter("LFO1 Ring 1-2 Level", valsArray[159])

	-- 146 AUDIO INPUT LFO1 LEVEL MOD (64 = 0)
	--assertSingleParameter("", valsArray[160])

	-- 147 OSC123 WAVEFORM KEYSYNC PHASE (0..357 degrees)
	assertSingleParameter("VCO Start Phase", valsArray[161])

	-- 148 NOISE TYPE (0..3 = white, hp, bp, hp*bp)
	assertSingleParameter("Noise Type", valsArray[162])

	-- 149 ARPEGGIATOR PATTERN (0..32 0=off, 32 patterns)
	assertSingleParameter("Arp Pattern", valsArray[163])

	-- 150 FILTER FREQUENCY VELOCITY CONTROL (64 = 0)
	assertSingleParameter("Filter Velocity", valsArray[164])

	-- 151..166 PROGRAM NAME (16 ascii characters)
	-- Done in another function

	-- 167 ARPEGGIATOR PATTERN VELOCITY MODE (0=use note-on velocity, 1= use velocity in pattern)
	assertSingleParameter("Arp Pattern Vel", valsArray[181])

	-- 168 FIXED NOTE CONTROL (0=off, 1-127 fix the note to midi 1..127 ie C#-2..G8)
	assertSingleParameter("Arp Fixed Note", valsArray[182])

	-- 169 LFO1 OUTPUT LEVEL VELOCITY CONTROL (64 = 0)
	assertSingleParameter("LFO1 Out Velocity", valsArray[183])

	-- 170 LFO2 OUTPUT LEVEL VELOCITY CONTROL (64 = 0)
	assertSingleParameter("LFO2 Out Velocity", valsArray[184])

	-- 171 OSC1 LFO2 LEVEL MOD (64 = 0)
	assertSingleParameter("LFO2 OSC1 Level", valsArray[185])

	-- 172 OSC 2>3 FM LFO1 DEPTH MOD (64 = 0)
	assertSingleParameter("LFO1 FM 2-3 Level", valsArray[186])

	-- 173 DRUM NOTE ON-TIME (0=turn off by note-off, 1-127=1msec..10sec auto-turn-off, ignoring note-off)
	--assertSingleParameter("", valsArray[187])

	-- 174..175 NOT USED

	-- 176 CATEGORY (0..23)
	--assertSingleParameter("", valsArray[190])

	-- 177 EXPRESSION PEDAL CONTROLLER NUMBER
	--assertSingleParameter("", valsArray[191])

	-- 178 FOOTSWITCH FUNCTION (0=sustain, 1=arp latch on override)
	assertSingleParameter("Foot Switch", valsArray[192])

	-- PART PARAMETERS (note that most of these operate in both program and performance mode)

	-- 179 PART LEVEL
	assertSingleParameter("Part Level", valsArray[193])

	-- 180 PART OUTPUT (0..5 = 1+2, 3+4, 1, 2, 3, 4)
	--assertSingleParameter("", valsArray[194])

	-- 181 PART MIDI CHANNEL (0..15 Note that in program mode, the global channel is used)
	--assertSingleParameter("", valsArray[195])

	-- 182 PART LOW NOTE LIMIT
	--assertSingleParameter("", valsArray[196])

	-- 183 PART HIGH NOTE LIMIT
	--assertSingleParameter("", valsArray[197])

	-- 184 PART SEMITONE OFFSET (64 = 0)
	--assertSingleParameter("", valsArray[198])

	-- 185 PART CENT OFFSET (64 = 0)
	--assertSingleParameter("", valsArray[199])

	-- 186 PART VELOCITY FUNCTION (0..15 0=normal, 1=inverse, 2=xfade hi, 3=xfade lo, then12 limit settings)
	--assertSingleParameter("", valsArray[200])

	-- PERFORMANCE PARAMETERS stored in each part's data block

	-- 187 PART ORIGINAL PROGRAM BANK (1..8)
	-- 188 PART ORIGINAL PROGRAM NUMBER (0..99)
	-- 189 PERFORMANCE PART EDIT SELECTION (bits 0..3 are 1 for parts 1..4 respectively)
	-- 190 PERFORMANCE PART ON SELECTION (bits 0..3 are 1 for parts 1..4 respectively)
	-- 191 PERFORMANCE TEMPO BPM (this is the performance's version of parameter 84)
	-- 192..207 PERFORMANCE NAME (16 ascii characters)
	-- 208 PERFORMANCE VOCODER PART SELECTION (0..3 for parts 1..4)
	-- 209..255 (not used, set to 0)

	panel:setPropertyString("panelMidiPauseOut", "0")
end