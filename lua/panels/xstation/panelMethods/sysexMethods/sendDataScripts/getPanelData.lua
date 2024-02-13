function getPanelData()

	local pData = {}

	-- SysEx Header
	pData[1] = 0xF0

	-- 00h NOVATION ID 1
	pData[2] = 0x00

	-- 20h NOVATION ID 2
	pData[3] = 0x20

	-- 29h NOVATION ID 3
	pData[4] = 0x29

	-- 01h DEVICE TYPE
	pData[5] = 0x01

	-- 42h KS SERIES
	pData[6] = 0x42

	-- SyCh SYSEX CHANNEL transmitted 7Fh : received 7Fh or current receive channel
	pData[7] = 0x7F

	-- 00h MESSAGE TYPE current program dump
	pData[8] = 0x00

	-- 00h CONTROL BYTE transmitted 0 : received don't care
	pData[9] = 0x00

	-- Vv SOFTWARE VERSION
	pData[10] = 0x10

	-- Vi VERSION INCREMENT
	pData[11] = 0x00

	-- 00h PROGRAM BANK transmitted 0 : received don't care
	pData[12] = 0x00

	-- 00h PROGRAM NUMBER
	pData[13] = selectedPresetNumber - 1

	-- 0 UNISON / VOICE TYPE / FILTER TYPE (packed parameter 2)
	pData[14] = getPackedParametersData(2)

	-- 1 UNISON DETUNE
	pData[15] = getCompValue("Unison Detune")

	-- 2 INDIVIDUAL OSCILLATOR RANDOM DETUNE (VCO DRIFT)
	pData[16] = getCompValue("VCO Drift")

	-- 3 PORTAMENTO TIME
	pData[17] = getCompValue("Voice Portamento")

	-- 4 PREGLIDE SEMITONES (64 = 0) -12..+12 (0=preglide disabled)
	pData[18] = getCompValue("Voice Preglide") + 52

	-- 5 PORTAMENTO MODE (0=exp, 1=linear)
	pData[19] = getCompValue("Voice Portamento Mode")

	-- 6 OSC 1,2,3 OCTAVE / OSC 1>2 SYNC (packed parameter 3)
	pData[20] = getPackedParametersData(3)

	-- 7 OSC1 SEMITONE (64 = 0) -12..+12
	pData[21] = getCompValue("OSC1 Semitone") + 52 

	-- 8 OSC1 CENT (64 = 0) -50..+50
	pData[22] = getCompValue("OSC1 Detune") + 14

	-- 9 OSC1 BENDWHEEL PITCH AMOUNT (64 = 0)
	pData[23] = getCompValue("OSC1 Pitchbend")

	-- 10 OSC1 LFO1 PITCH AMOUNT (64 = 0)
	pData[24] = getCompValue("LFO1 OSC1 Pitch")

	-- 11 OSC1 MOD.ENV PITCH AMOUNT (64 = 0)
	pData[25] = getCompValue("OSC1 Pitch Env")

	-- 12 OSC1 PULSE WIDTH POSITION (64 = 0) 
	pData[26] = getCompValue("OSC1 Pulsewidth")

	-- 13 OSC1 LFO2 PULSE WIDTH MOD (64 = 0)
	pData[27] = getCompValue("LFO2 OSC1 PWM")

	-- 14 OSC1 MOD.ENV PULSE WIDTH MOD (64 = 0)
	pData[28] = getCompValue("OSC1 PW Env")

	-- 15 OSC2 SEMITONE (64 = 0) -12..+12
	pData[29] = getCompValue("OSC2 Semitone") + 52

	-- 16 OSC2 CENT (64 = 0) -50..+50
	pData[30] = getCompValue("OSC2 Detune") + 14

	-- 17 OSC2 BENDWHEEL PITCH AMOUNT (64 = 0)
	pData[31] = getCompValue("OSC2 Pitchbend")

	-- 18 OSC2 LFO1 PITCH AMOUNT (64 = 0)
	pData[32] = getCompValue("LFO1 OSC2 Pitch")

	-- 19 OSC2 MOD.ENV PITCH AMOUNT (64 = 0)
	pData[33] = getCompValue("OSC2 Pitch Env")

	-- 20 OSC2 PULSE WIDTH POSITION (64 = 0)
	pData[34] = getCompValue("OSC2 Pulsewidth")

	-- 21 OSC2 LFO2 PULSE WIDTH MOD (64 = 0)
	pData[35] = getCompValue("LFO2 OSC2 PWM")

	-- 22 OSC2 MOD.ENV PULSE WIDTH MOD (64 = 0)
	pData[36] = getCompValue("OSC2 PW Env")

	-- 23 OSC3 SEMITONE (64 = 0) -12..+12
	pData[37] = getCompValue("OSC3 Semitone") + 52

	-- 24 OSC3 CENT (64 = 0)
	pData[38] = getCompValue("OSC3 Detune") + 14

	-- 25 OSC3 BENDWHEEL PITCH AMOUNT (64 = 0)
	pData[39] = getCompValue("OSC3 Pitchbend")

	-- 26 OSC3 LFO1 PITCH AMOUNT (64 = 0)
	pData[40] = getCompValue("LFO1 OSC3 Pitch")

	-- 27 OSC3 MOD.ENV PITCH AMOUNT (64 = 0)
	pData[41] = getCompValue("OSC3 Pitch Env")

	-- 28 OSC3 PULSE WIDTH POSITION (64 = 0)
	pData[42] = getCompValue("OSC3 Pulsewidth")

	-- 29 OSC3 LFO2 PULSE WIDTH MOD (64 = 0)
	pData[43] = getCompValue("LFO2 OSC3 PWM")

	-- 30 OSC3 MOD.ENV PULSE WIDTH MOD (64 = 0)
	pData[44] = getCompValue("OSC3 PW Env")

	-- 31 OSCs 1,2,3 MODWHEEL DIRECT PITCH DEPTH (64 = 0)
	pData[45] = getCompValue("OSCs to MW")

	-- 32 OSCs 1,2,3 AFTERTOUCH DIRECT PITCH DEPTH (64 = 0)
	pData[46] = getCompValue("OSCs to AT")

	-- 33 OSCs 1,2,3 BREATH DIRECT PITCH DEPTH (64 = 0)
	pData[47] = getCompValue("OSCs to BR")

	-- 34 OSCs 1,2,3 MODWHEEL LFO1 PITCH DEPTH (64 = 0)
	pData[48] = getCompValue("OSCs LFO1 to MW")

	-- 35 OSCs 1,2,3 AFTERTOUCH LFO1 PITCH DEPTH (64 = 0)
	pData[49] = getCompValue("OSCs LFO1 to AT")

	-- 36 OSCs 1,2,3 BREATH LFO1 PITCH DEPTH (64 = 0)
	pData[50] = getCompValue("OSCs LFO1 to BR")

	-- 37 OSC1 LEVEL
	pData[51] = getCompValue("OSC1 Level")

	-- 38 OSC2 LEVEL
	pData[52] = getCompValue("OSC2 Level")

	-- 39 OSC3 LEVEL
	pData[53] = getCompValue("OSC3 Level")

	-- 40 NOISE LEVEL
	pData[54] = getCompValue("Noise Level")

	-- 41 OSC 1*2 RINGMOD LEVEL
	pData[55] = getCompValue("Ring 1-2")

	-- 42 AUDIO INPUT LEVEL
	pData[56] = 0x00

	-- 43 FILTER OVERDRIVE
	pData[57] = getCompValue("Filter Overdrive")

	-- 44 FILTER RESONANCE
	pData[58] = getCompValue("Filter Res")

	-- 45 FILTER Q NORMALISE
	pData[59] = getCompValue("Filter QNorm")

	-- 46 FILTER FREQUENCY
	pData[60] = getCompValue("Filter Cutoff")

	-- 47 FILTER KEYBOARD TRACKING
	pData[61] = getCompValue("Filter Keytrack")

	-- 48 FILTER MODWHEEL DIRECT FREQUENCY DEPTH
	pData[62] = getCompValue("FFq Dpt to MW")

	-- 49 FILTER AFTERTOUCH DIRECT FREQUENCY DEPTH
	pData[63] = getCompValue("FFq Dpt to AT")

	-- 50 FILTER BREATH DIRECT FREQUENCY DEPTH
	pData[64] = getCompValue("FFq Dpt to BR")

	-- 51 FILTER FREQUENCY LFO2 MOD DEPTH
	pData[65] = getCompValue("LFO2 Filter Mod")

	-- 52 FILTER FREQUENCY MOD.ENV DEPTH
	pData[66] = getCompValue("Filter Env")

	-- 53 FILTER MODWHEEL LFO2 FREQUENCY DEPTH
	pData[67] = getCompValue("FFq LFO2 Dpt to MW")

	-- 54 FILTER AFTERTOUCH LFO2 FREQUENCY DEPTH
	pData[68] = getCompValue("FFq LFO2 Dpt to AT")

	-- 55 FILTER BREATH LFO2 FREQUENCY DEPTH
	pData[69] = getCompValue("FFq LFO2 Dpt to BR")

	-- 56 OSC 2>3 FM FIXED LEVEL
	pData[70] = getCompValue("FM 2-3")

	-- 57 OSC 2>3 FM ENVELOPE DEPTH
	pData[71] = getCompValue("FM Envelope Amount")

	-- 58 OSC 2>3 FM ENVELOPE VELOCITY DEPTH
	pData[72] = getCompValue("FM Velocity")

	-- 59 OSC 2>3 FM ENVELOPE ATTACK
	pData[73] = getCompValue("FM Attack")

	-- 60 OSC 2>3 FM ENVELOPE DECAY
	pData[74] = getCompValue("FM Decay")

	-- 61 AMPLITUDE ENVELOPE VELOCITY DEPTH
	pData[75] = getCompValue("ADSR Velocity")

	-- 62 AMPLITUDE ENVELOPE ATTACK
	pData[76] = getCompValue("Amp Attack")

	-- 63 AMPLITUDE ENVELOPE DECAY
	pData[77] = getCompValue("Amp Decay")

	-- 64 AMPLITUDE ENVELOPE SUSTAIN
	pData[78] = getCompValue("Amp Sustain")

	-- 65 AMPLITUDE ENVELOPE RELEASE
	pData[79] = getCompValue("Amp Release")

	-- 66 MOD. ENVELOPE VELOCITY DEPTH
	pData[80] = getCompValue("Mod Velocity")

	-- 67 MOD. ENVELOPE ATTACK
	pData[81] = getCompValue("Filter Attack")

	-- 68 MOD. ENVELOPE DECAY
	pData[82] = getCompValue("Filter Decay")

	-- 69 MOD. ENVELOPE SUSTAIN
	pData[83] = getCompValue("Filter Sustain")

	-- 70 MOD. ENVELOPE RELEASE
	pData[84] = getCompValue("Filter Release")

	-- 71 (not used)
	pData[85] = 0x00

	-- 72 NON-SYNC LFO1 SPEED
	pData[86] = getCompValue("LFO1 Speed")

	-- 73 SYNC LFO1 SPEED
	pData[87] = getCompValue("LFO1 Sync Speed")

	-- 74 LFO1 DELAY
	pData[88] = getCompValue("LFO1 Delay")

	-- 75 NON-SYNC LFO2 SPEED
	pData[89] = getCompValue("LFO2 Speed")

	-- 76 SYNC LFO2 SPEED
	pData[90] = getCompValue("LFO2 Sync Speed")

	-- 77 LFO2 DELAY
	pData[91] = getCompValue("LFO2 Delay")

	-- 78 LFO 1,2 DELAY MONO MULTI MODE (packed parameter 4)
	pData[92] = getPackedParametersData(4)

	-- 79 LFO 1,2 KEYSYNC / LOCK / ONE-SHOT (packed parameter 5)
	pData[93] = getPackedParametersData(5)

	-- 80 ENVELOPE MONO MULTI MODES (packed parameter 1)
	pData[94] = getPackedParametersData(1)

	-- 81 AMPLITUDE MODWHEEL DIRECT DEPTH
	pData[95] = getCompValue("Amp Dpt to MW")

	-- 82 AMPLITUDE AFTERTOUCH DIRECT DEPTH
	pData[96] = getCompValue("Amp Dpt to AT")

	-- 83 AMPLITUDE BREATH DIRECT DEPTH
	pData[97] = getCompValue("Amp Dpt to BR")

	-- 84 ARPEGGIATOR/GENERAL SYNC RATE
	pData[98] = getCompValue("Arp Tempo")

	-- 85 ARPEGGIATOR SYNC SETTING
	pData[99] = getCompValue("Arp Sync Time")

	-- 86 ARPEGGIATOR GATE TIME
	pData[100] = getCompValue("Arp Gate Time")

	-- 87 ARP MODE
	pData[101] = getCompValue("Arp Pattern Mode")

	-- 88 ARPEGGIATOR CONTROL (packed parameter 6)
	pData[102] = getPackedParametersData(6)

	-- 89..91 NOT USED
	pData[103] = 0x00
	pData[104] = 0x00
	pData[105] = 0x00

	-- EQ (NOT USED IN X-Station)
	-- 92 EQ LEVEL
	pData[106] = 0x40

	-- 93 EQ FREQUENCY
	pData[107] = 0x40

	-- 94 NON-SYNC EQ MOD RATE
	pData[108] = 0x00

	-- 95 SYNC EQ MOD RATE
	pData[109] = 0x00

	-- 96 EQ MOD DEPTH
	pData[110] = 0x00

	-- 97 DISTORTION LEVEL
	pData[111] = getCompValue("Dist Level")

	-- 98 MODWHEEL DISTORTION
	pData[112] = getCompValue("Dist Send to MW")

	-- 99 DISTORTION COMPENSATION
	pData[113] = getCompValue("Dist Compensation")

	-- 100 DELAY SEND LEVEL
	pData[114] = getCompValue("Delay Level")

	-- 101 MODWHEEL DELAY SEND
	pData[115] = getCompValue("Delay Send to MW")

	-- 102 NON-SYNC DELAY TIME
	pData[116] = getCompValue("Delay Time")

	-- 103 SYNC DELAY TIME
	pData[117] = getCompValue("Delay Sync Time")

	-- 104 DELAY FEEDBACK
	pData[118] = getCompValue("Delay Feedback")

	-- 105 DELAY STEREO WIDTH
	pData[119] = getCompValue("Delay Stereo Width")

	-- 106 DELAY RATIO
	pData[120] = getCompValue("Delay L/R Ratio")

	-- 107 REVERB SEND LEVEL
	pData[121] = getCompValue("Reverb Level")

	-- 108 MODWHEEL REVERB SEND
	pData[122] = getCompValue("Reverb Send to MW")

	-- 109 REVERB DECAY
	pData[123] = getCompValue("Reverb Decay")

	-- 110 CHORUS SEND LEVEL
	pData[124] = getCompValue("Chorus Level")

	-- 111 MODWHEEL CHORUS SEND
	pData[125] = getCompValue("Chorus Send to MW")

	-- 112 NON-SYNC CHORUS RATE
	pData[126] = getCompValue("Chorus Rate")

	-- 113 SYNC CHORUS RATE
	pData[127] = getCompValue("Chorus Sync Rate")

	-- 114 CHORUS FEEDBACK
	pData[128] = getCompValue("Chorus Feedback")

	-- 115 CHORUS MOD DEPTH
	pData[129] = getCompValue("Chorus Depth")

	-- 116 CHORUS MOD CENTRE POINT
	pData[130] = getCompValue("Chorus Centre")

	-- 117 PAN POSITION
	pData[131] = getCompValue("Pan Position")

	-- 118 NON-SYNC PAN RATE
	pData[132] = getCompValue("Autopan Rate")

	-- 119 SYNC PAN RATE
	pData[133] = getCompValue("Autopan Sync Rate")

	-- 120 PAN MOD DEPTH
	pData[134] = getCompValue("Autopan Depth")

	-- 121 EFFECTS TYPE CONTROL (packed parameter 7)
	pData[135] = getPackedParametersData(7)

	-- 122 EFFECTS GLOBAL SYNC CONTROL (packed parameter 8)
	pData[136] = getPackedParametersData(8)

	-- 123 AUDIO INPUT CONTROL (packed parameter 9)
	pData = fillRangeWithInitBytes(pData, 137, 137)

	-- 124 NOT USED
	pData[138] = 0x00

	-- 125 VOICE LEVEL TO OUTPUT & EFFECTS
	pData[139] = getCompValue("AMP Gain")

	-- 126 EFFECT TYPE SELECTOR/KEYBOARD OCTAVE (packed parameter 10)
	pData[140] = getPackedParametersData(10)

	-- 127 OSC, SOURCE, PW, LFO SELECTORS (packed parameter 11)
	pData = fillRangeWithInitBytes(pData, 141, 141)

	-- 128 OSC1 WAVEFORM
	pData[142] = getCompValue("OSC1 Waveform")

	-- 129 OSC2 WAVEFORM
	pData[143] = getCompValue("OSC2 Waveform")

	-- 130 OSC3 WAVEFORM
	pData[144] = getCompValue("OSC3 Waveform")

	-- 131 LFO1 WAVEFORM
	pData[145] = getCompValue("LFO1 Waveform")

	-- 132 LFO2 WAVEFORM
	pData[146] = getCompValue("LFO2 Waveform")

	-- 133 LFO1 UNIPOLAR
	pData[147] = getCompValue("LFO1 Polarity")

	-- 134 LFO2 UNIPOLAR
	pData[148] = getCompValue("LFO2 Polarity")

	-- 135 LFO1 KEYSYNC START PHASE
	pData[149] = getCompValue("LFO1 Phase")

	-- 136 LFO2 KEYSYNC START PHASE
	pData[150] = getCompValue("LFO2 Phase")

	-- 137 LFO1 SYNC DELAY TIME
	pData[151] = getCompValue("LFO1 Sync Delay")

	-- 138 LFO2 SYNC DELAY TIME
	pData[152] = getCompValue("LFO2 Sync Delay")

	-- NOT IMPLEMENTED YET
	-- 139 MIX MODULATION SELECTOR
	pData[153] = 0x00

	-- 140 FILTER TYPE
	pData[154] = getCompValue("Filter Type")

	-- 141 OSC1 LFO1 LEVEL MOD
	pData[155] = getCompValue("LFO1 OSC1 Level")

	-- 142 OSC2 LFO2 LEVEL MOD
	pData[156] = getCompValue("LFO2 OSC2 Level")

	-- 143 OSC3 A/D ENV LEVEL MOD
	pData[157] = getCompValue("OSC3 AD Amount")

	-- 144 NOISE LFO1 LEVEL MOD
	pData[158] = getCompValue("LFO1 Noise Level")

	-- 145 RING1*2 LFO1 LEVEL MOD
	pData[159] = getCompValue("LFO1 Ring 1-2 Level")

	-- 146 AUDIO INPUT LFO1 LEVEL MOD
	pData[160] = 0x00

	-- 147 OSC123 WAVEFORM KEYSYNC PHASE
	pData[161] = getCompValue("VCO Start Phase")

	-- 148 NOISE TYPE
	pData[162] = getCompValue("Noise Type")

	-- 149 ARPEGGIATOR PATTERN
	pData[163] = getCompValue("Arp Pattern")

	-- 150 FILTER FREQUENCY VELOCITY CONTROL
	pData[164] = getCompValue("Filter Velocity")

	-- 151..166 PROGRAM NAME (16 ascii characters)
	pData[165] = getPresetNameChar(1)
	pData[166] = getPresetNameChar(2)
	pData[167] = getPresetNameChar(3)
	pData[168] = getPresetNameChar(4)
	pData[169] = getPresetNameChar(5)
	pData[170] = getPresetNameChar(6)
	pData[171] = getPresetNameChar(7)
	pData[172] = getPresetNameChar(8)
	pData[173] = getPresetNameChar(9)
	pData[174] = getPresetNameChar(10)
	pData[175] = getPresetNameChar(11)
	pData[176] = getPresetNameChar(12)
	pData[177] = getPresetNameChar(13)
	pData[178] = getPresetNameChar(14)
	pData[179] = getPresetNameChar(15)
	pData[180] = getPresetNameChar(16)

	-- 167 ARPEGGIATOR PATTERN VELOCITY MODE
	pData[181] = getCompValue("Arp Pattern Vel")

	-- 168 FIXED NOTE CONTROL
	pData[182] = getCompValue("Arp Fixed Note")

	-- 169 LFO1 OUTPUT LEVEL VELOCITY CONTROL
	pData[183] = getCompValue("LFO1 Out Velocity")

	-- 170 LFO2 OUTPUT LEVEL VELOCITY CONTROL
	pData[184] = getCompValue("LFO2 Out Velocity")

	-- 171 OSC1 LFO2 LEVEL MOD
	pData[185] = getCompValue("LFO2 OSC1 Level")

	-- 172 OSC 2>3 FM LFO1 DEPTH MOD
	pData[186] = getCompValue("LFO1 FM 2-3 Level")

	-- 173 DRUM NOTE ON-TIME
	pData[187] = 0x00

	-- 174..175 NOT USED
	pData[188] = 0x00
	pData[189] = 0x00

	-- NOT IMPLEMENTED YET
	-- 176 CATEGORY (0..23)
	pData[190] = 0x00

	-- 177 EXPRESSION PEDAL CONTROLLER NUMBER
	pData[191] = 0x00

	-- 178 FOOTSWITCH FUNCTION
	pData[192] = getCompValue("Foot Switch")

	-- 179 PART LEVEL
	pData[193] = getCompValue("Part Level")

	-- 180 PART OUTPUT
	pData[194] = 0x00

	-- 181 PART MIDI CHANNEL
	pData[195] = 0x00

	-- 182 PART LOW NOTE LIMIT
	pData[196] = 0x00

	-- 183 PART HIGH NOTE LIMIT
	pData[197] = 0x7F

	-- 184 PART SEMITONE OFFSET
	pData[198] = 0x40

	-- 185 PART CENT OFFSET
	pData[199] = 0x40

	-- 186 PART VELOCITY FUNCTION
	pData[200] = 0x00

	-- 187 .. 255 FILL WITH ZEROES
	pData = fillRangeWithInitBytes(pData, 201, 269)

	-- SysEx Message End
	pData[270] = 0xF7

	return pData
end