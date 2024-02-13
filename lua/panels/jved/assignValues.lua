assignValues = function(midiMessage)


    -- create a variable that contains all bytes of program data from the synths program dump, get this info from synth's manual:
    
          
        commonData = midiMessage:getData():getRange(1,44) --get string that contains common patch data
    
        programData = midiMessage:getData():getRange(1,126) --get strings that contains a tone patch data
    
    
    
    
    -- #### Common Patch Data Section ####
    
        
        Common = commonData:getByte(6)
    
        if Common==32 then
        
        
        --Table to store on table All Common Data
            
        tableCommon = {}
    
        tableCommon[0] = 0x41 -- ID Roland
        tableCommon[1] = commonData:getByte(1)-- Device Id
        tableCommon[2] = commonData:getByte(2)-- JV-80 / 880
        tableCommon[3] = commonData:getByte(3)-- Set value
        tableCommon[4] = commonData:getByte(4)-- place to store - pcm or internal - seted by external modulator (store function)
        tableCommon[5] = commonData:getByte(5)-- patch memory store position - seted by external modulator (store function)
        tableCommon[6] = commonData:getByte(6)-- patch common memory area 	
        tableCommon[7] = commonData:getByte(7)
        tableCommon[8] = commonData:getByte(8)
        tableCommon[9] = commonData:getByte(9)
        tableCommon[10] = commonData:getByte(10)
        tableCommon[11] = commonData:getByte(11)
        tableCommon[12] = commonData:getByte(12)
        tableCommon[13] = commonData:getByte(13)
        tableCommon[14] = commonData:getByte(14)
        tableCommon[15] = commonData:getByte(15)
        tableCommon[16] = commonData:getByte(16)
        tableCommon[17] = commonData:getByte(17)
        tableCommon[18] = commonData:getByte(18)
        tableCommon[19] = commonData:getByte(19)
        tableCommon[20] = commonData:getByte(20)
        tableCommon[21] = commonData:getByte(21)
        tableCommon[22] = commonData:getByte(22)
        tableCommon[23] = commonData:getByte(23)
        tableCommon[24] = commonData:getByte(24)
        tableCommon[25] = commonData:getByte(25)
        tableCommon[26] = commonData:getByte(26)
        tableCommon[27] = commonData:getByte(27)
        tableCommon[28] = commonData:getByte(28)
        tableCommon[29] = commonData:getByte(29)
        tableCommon[30] = commonData:getByte(30)
        tableCommon[31] = commonData:getByte(31)
        tableCommon[32] = commonData:getByte(32)
        tableCommon[33] = commonData:getByte(33)
        tableCommon[34] = commonData:getByte(34)
        tableCommon[35] = commonData:getByte(35)
        tableCommon[36] = commonData:getByte(36)
        tableCommon[37] = commonData:getByte(37)
        tableCommon[38] = commonData:getByte(38)
        tableCommon[39] = commonData:getByte(39)
        tableCommon[40] = commonData:getByte(40)
        tableCommon[41] = commonData:getByte(41)
        tableCommon[42] = commonData:getByte(42)--Roland Checksum
        
     
        panel:getModulatorByName("NAME-01"):setValueMapped(commonData:getByte(8), false)
        panel:getModulatorByName("NAME-02"):setValueMapped(commonData:getByte(9), false)
        panel:getModulatorByName("NAME-03"):setValueMapped(commonData:getByte(10), false)
        panel:getModulatorByName("NAME-04"):setValueMapped(commonData:getByte(11), false)
        panel:getModulatorByName("NAME-05"):setValueMapped(commonData:getByte(12), false)
        panel:getModulatorByName("NAME-06"):setValueMapped(commonData:getByte(13), false)
        panel:getModulatorByName("NAME-07"):setValueMapped(commonData:getByte(14), false)
        panel:getModulatorByName("NAME-08"):setValueMapped(commonData:getByte(15), false)
        panel:getModulatorByName("NAME-09"):setValueMapped(commonData:getByte(16), false)
        panel:getModulatorByName("NAME-10"):setValueMapped(commonData:getByte(17), false)
        panel:getModulatorByName("NAME-11"):setValueMapped(commonData:getByte(18), false)
        panel:getModulatorByName("NAME-12"):setValueMapped(commonData:getByte(19), false)
        
        panel:getModulatorByName("VELOCITY-VELOCITY-SW"):setValueMapped(commonData:getByte(20), false)
        
        panel:getModulatorByName("REVERB-TYPE"):setValueMapped(commonData:getByte(21), false)
        panel:getModulatorByName("REVERB-LEVEL"):setModulatorValue(commonData:getByte(22), false, false, false)
        panel:getModulatorByName("REVERB-TIME"):setModulatorValue(commonData:getByte(23), false, false, false)
        panel:getModulatorByName("REVERB-FEEDBACK"):setModulatorValue(commonData:getByte(24), false, false, false)
        
        panel:getModulatorByName("CHORUS-TYPE"):setValueMapped(commonData:getByte(25), false)
        panel:getModulatorByName("CHORUS-LEVEL"):setModulatorValue(commonData:getByte(26), false, false, false)
        panel:getModulatorByName("CHORUS-DEPTH"):setModulatorValue(commonData:getByte(27), false, false, false)
        panel:getModulatorByName("CHORUS-RATE"):setModulatorValue(commonData:getByte(28), false, false, false)
        panel:getModulatorByName("CHORUS-FEEDBACK"):setModulatorValue(commonData:getByte(29), false, false, false)
        panel:getModulatorByName("CHORUS-OUTPUT-SW"):setValueMapped(commonData:getByte(30), false)
        
        panel:getModulatorByName("COMMON-ANALOGFEEL"):setModulatorValue(commonData:getByte(31), false, false, false)
        panel:getModulatorByName("COMMON-PATCHLEVEL"):setModulatorValue(commonData:getByte(32), false, false, false)
        panel:getModulatorByName("COMMON-PATCHPAN"):setModulatorValue(commonData:getByte(33)-64, false, false, false)
        
        panel:getModulatorByName("BENDRANGE-DOWN"):setModulatorValue(commonData:getByte(34)-64, false, false, false)
        panel:getModulatorByName("BENDRANGE-UP"):setModulatorValue(commonData:getByte(35), false, false, false)
        
        panel:getModulatorByName("COMMON-KEYASSIGN-SW"):setValueMapped(commonData:getByte(36), false)
        panel:getModulatorByName("COMMON-LEGATO-SW"):setValueMapped(commonData:getByte(37), false)
        
        panel:getModulatorByName("PORTAMENTO-SW"):setValueMapped(commonData:getByte(38), false)
        panel:getModulatorByName("PORTAMENTO-MODE-SW"):setValueMapped(commonData:getByte(39), false)
        panel:getModulatorByName("PORTAMENTO-TYPE-SW"):setValueMapped(commonData:getByte(40), false)
        panel:getModulatorByName("PORTAMENTO-TIME"):setModulatorValue(commonData:getByte(41), false, false, false)
    
    
        end
    
    
    
    
    -- Select witch Tone (1 to 4) will be trated    
    
        
        SelectTone = programData:getByte(6) --Read if Tone Data is from Tone1, Tone2, Tone3 or Tone4 from Patch    
    
    
        
    -- #### Tone 1 ####   
    
       
        if SelectTone==40 then -- Test if is Tone-1 Data from patch
    
        
        --Table to store on table All Tone 1 Data
    
        tableTone1 = {}
    
        tableTone1[0] = 0x41
        tableTone1[1] = programData:getByte(1)
        tableTone1[2] = programData:getByte(2)
        tableTone1[3] = programData:getByte(3)
        tableTone1[4] = programData:getByte(4)
        tableTone1[5] = programData:getByte(5)
        tableTone1[6] = programData:getByte(6)
        tableTone1[7] = programData:getByte(7)
        tableTone1[8] = programData:getByte(8)
        tableTone1[9] = programData:getByte(9)
        tableTone1[10] = programData:getByte(10)
        tableTone1[11] = programData:getByte(11)
        tableTone1[12] = programData:getByte(12)
        tableTone1[13] = programData:getByte(13)
        tableTone1[14] = programData:getByte(14)
        tableTone1[15] = programData:getByte(15)
        tableTone1[16] = programData:getByte(16)
        tableTone1[17] = programData:getByte(17)
        tableTone1[18] = programData:getByte(18)
        tableTone1[19] = programData:getByte(19)
        tableTone1[20] = programData:getByte(20)
        tableTone1[21] = programData:getByte(21)
        tableTone1[22] = programData:getByte(22)
        tableTone1[23] = programData:getByte(23)
        tableTone1[24] = programData:getByte(24)
        tableTone1[25] = programData:getByte(25)
        tableTone1[26] = programData:getByte(26)
        tableTone1[27] = programData:getByte(27)
        tableTone1[28] = programData:getByte(28)
        tableTone1[29] = programData:getByte(29)
        tableTone1[30] = programData:getByte(30)
        tableTone1[31] = programData:getByte(31)
        tableTone1[32] = programData:getByte(32)
        tableTone1[33] = programData:getByte(33)
        tableTone1[34] = programData:getByte(34)
        tableTone1[35] = programData:getByte(35)
        tableTone1[36] = programData:getByte(36)
        tableTone1[37] = programData:getByte(37)
        tableTone1[38] = programData:getByte(38)
        tableTone1[39] = programData:getByte(39)
        tableTone1[40] = programData:getByte(40)
        tableTone1[41] = programData:getByte(41)
        tableTone1[42] = programData:getByte(42)
        tableTone1[43] = programData:getByte(43)
        tableTone1[44] = programData:getByte(44)
        tableTone1[45] = programData:getByte(45)
        tableTone1[46] = programData:getByte(46)
        tableTone1[47] = programData:getByte(47)
        tableTone1[48] = programData:getByte(48)
        tableTone1[49] = programData:getByte(49)
        tableTone1[50] = programData:getByte(50)
        tableTone1[51] = programData:getByte(51)
        tableTone1[52] = programData:getByte(52)
        tableTone1[53] = programData:getByte(53)
        tableTone1[54] = programData:getByte(54)
        tableTone1[55] = programData:getByte(55)
        tableTone1[56] = programData:getByte(56)
        tableTone1[57] = programData:getByte(57)
        tableTone1[58] = programData:getByte(58)
        tableTone1[59] = programData:getByte(59)
        tableTone1[60] = programData:getByte(60)
        tableTone1[61] = programData:getByte(61)
        tableTone1[62] = programData:getByte(62)
        tableTone1[63] = programData:getByte(63)
        tableTone1[64] = programData:getByte(64)
        tableTone1[65] = programData:getByte(65)
        tableTone1[66] = programData:getByte(66)
        tableTone1[67] = programData:getByte(67)
        tableTone1[68] = programData:getByte(68)
        tableTone1[69] = programData:getByte(69)
        tableTone1[70] = programData:getByte(70)
        tableTone1[71] = programData:getByte(71)
        tableTone1[72] = programData:getByte(72)
        tableTone1[73] = programData:getByte(73)
        tableTone1[74] = programData:getByte(74)
        tableTone1[75] = programData:getByte(75)
        tableTone1[76] = programData:getByte(76)
        tableTone1[77] = programData:getByte(77)
        tableTone1[78] = programData:getByte(78)
        tableTone1[79] = programData:getByte(79)
        tableTone1[80] = programData:getByte(80)
        tableTone1[81] = programData:getByte(81)
        tableTone1[82] = programData:getByte(82)
        tableTone1[83] = programData:getByte(83)
        tableTone1[84] = programData:getByte(84)
        tableTone1[85] = programData:getByte(85)
        tableTone1[86] = programData:getByte(86)
        tableTone1[87] = programData:getByte(87)
        tableTone1[88] = programData:getByte(88)
        tableTone1[89] = programData:getByte(89)
        tableTone1[90] = programData:getByte(90)
        tableTone1[91] = programData:getByte(91)
        tableTone1[92] = programData:getByte(92)
        tableTone1[93] = programData:getByte(93)
        tableTone1[94] = programData:getByte(94)
        tableTone1[95] = programData:getByte(95)
        tableTone1[96] = programData:getByte(96)
        tableTone1[97] = programData:getByte(97)
        tableTone1[98] = programData:getByte(98)
        tableTone1[99] = programData:getByte(99)
        tableTone1[100] = programData:getByte(100)
        tableTone1[101] = programData:getByte(101)
        tableTone1[102] = programData:getByte(102)
        tableTone1[103] = programData:getByte(103)
        tableTone1[104] = programData:getByte(104)
        tableTone1[105] = programData:getByte(105)
        tableTone1[106] = programData:getByte(106)
        tableTone1[107] = programData:getByte(107)
        tableTone1[108] = programData:getByte(108)
        tableTone1[109] = programData:getByte(109)
        tableTone1[110] = programData:getByte(110)
        tableTone1[111] = programData:getByte(111)
        tableTone1[112] = programData:getByte(112)
        tableTone1[113] = programData:getByte(113)
        tableTone1[114] = programData:getByte(114)
        tableTone1[115] = programData:getByte(115)
        tableTone1[116] = programData:getByte(116)
        tableTone1[117] = programData:getByte(117)
        tableTone1[118] = programData:getByte(118)
        tableTone1[119] = programData:getByte(119)
        tableTone1[120] = programData:getByte(120)
        tableTone1[121] = programData:getByte(121)
        tableTone1[122] = programData:getByte(122)
        tableTone1[123] = programData:getByte(123)
        tableTone1[124] = programData:getByte(124)
    
        
        panel:getModulatorByName("T1-WAVEGROUP"):setValueMapped(programData:getByte(8), false)
           
        
        -- This filter is to combine 2 bytes that contais the "Wave Number" data abd set the Internal Wave combo modulator    
                       
                FilterMsb = programData:getByte(9)
                FilterLsb = programData:getByte(10)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)
    
                
        panel:getModulatorByName("T1-WAVE-INT"):setModulatorValue(FilterValue, false,false,false)		
    
        
        panel:getModulatorByName("T1-SWITCH"):setValueMapped(programData:getByte(11), false)
        
        panel:getModulatorByName("T1-FXM-SW"):setValueMapped(programData:getByte(12), false)
        panel:getModulatorByName("T1-FXM-DEPTH"):setModulatorValue(programData:getByte(13)+1, false, false, false)
        
        panel:getModulatorByName("T1-VELOCITY-LOWER"):setModulatorValue(programData:getByte(14), false, false, false)
        panel:getModulatorByName("T1-VELOCITY-UPPER"):setModulatorValue(programData:getByte(15), false, false, false)
        
        panel:getModulatorByName("T1-VOL-SW"):setValueMapped(programData:getByte(16), false)
        panel:getModulatorByName("T1-HOLD-SW"):setValueMapped(programData:getByte(17), false)
        
        panel:getModulatorByName("T1-MOD-MOD1-DESTINY"):setValueMapped(programData:getByte(18), false)
        panel:getModulatorByName("T1-MOD-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(19)-64, false, false, false)
        panel:getModulatorByName("T1-MOD-MOD2-DESTINY"):setValueMapped(programData:getByte(20), false)
        panel:getModulatorByName("T1-MOD-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(21)-64, false, false, false)
        panel:getModulatorByName("T1-MOD-MOD3-DESTINY"):setValueMapped(programData:getByte(22), false)
        panel:getModulatorByName("T1-MOD-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(23)-64, false, false, false)
        panel:getModulatorByName("T1-MOD-MOD4-DESTINY"):setValueMapped(programData:getByte(24), false)
        panel:getModulatorByName("T1-MOD-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(25)-64, false, false, false)
        
        panel:getModulatorByName("T1-AFT-MOD1-DESTINY"):setValueMapped(programData:getByte(26), false)
        panel:getModulatorByName("T1-AFT-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(27)-64, false, false, false)
        panel:getModulatorByName("T1-AFT-MOD2-DESTINY"):setValueMapped(programData:getByte(28), false)
        panel:getModulatorByName("T1-AFT-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(29)-64, false, false, false)
        panel:getModulatorByName("T1-AFT-MOD3-DESTINY"):setValueMapped(programData:getByte(30), false)
        panel:getModulatorByName("T1-AFT-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(31)-64, false, false, false)
        panel:getModulatorByName("T1-AFT-MOD4-DESTINY"):setValueMapped(programData:getByte(32), false)
        panel:getModulatorByName("T1-AFT-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(33)-64, false, false, false)
        
        panel:getModulatorByName("T1-EXP-MOD1-DESTINY"):setValueMapped(programData:getByte(34), false)
        panel:getModulatorByName("T1-EXP-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(35)-64, false, false, false)
        panel:getModulatorByName("T1-EXP-MOD2-DESTINY"):setValueMapped(programData:getByte(36), false)
        panel:getModulatorByName("T1-EXP-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(37)-64, false, false, false)
        panel:getModulatorByName("T1-EXP-MOD3-DESTINY"):setValueMapped(programData:getByte(38), false)
        panel:getModulatorByName("T1-EXP-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(39)-64, false, false, false)
        panel:getModulatorByName("T1-EXP-MOD4-DESTINY"):setValueMapped(programData:getByte(40), false)
        panel:getModulatorByName("T1-EXP-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(41)-64, false, false, false)
        
        panel:getModulatorByName("T1-LFO1-WAVEFORM"):setValueMapped(programData:getByte(42), false)
        panel:getModulatorByName("T1-LFO1-OFFSET"):setValueMapped(programData:getByte(43), false)
        panel:getModulatorByName("T1-LFO1-SYNCRO-SW"):setValueMapped(programData:getByte(44), false)
        panel:getModulatorByName("T1-LFO1-RATE"):setModulatorValue(programData:getByte(45), false, false, false)
            
        
        -- This filter is to combine 2 bytes that contais a "LFO-1 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(46)
                FilterLsb = programData:getByte(47)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T1-LFO1-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T1-LFO1-FADETYPE-SW"):setValueMapped(programData:getByte(48), false)
        panel:getModulatorByName("T1-LFO1-FADETIME"):setModulatorValue(programData:getByte(49), false, false, false)
        panel:getModulatorByName("T1-LFO1-PITCHDEPTH"):setModulatorValue(programData:getByte(50)-64, false, false, false)
        panel:getModulatorByName("T1-LFO1-TVFDEPTH"):setModulatorValue(programData:getByte(51)-64, false, false, false)
        panel:getModulatorByName("T1-LFO1-TVADEPTH"):setModulatorValue(programData:getByte(52)-64, false, false, false)
        
        panel:getModulatorByName("T1-LFO2-WAVEFORM"):setValueMapped(programData:getByte(53), false)
        panel:getModulatorByName("T1-LFO2-OFFSET"):setValueMapped(programData:getByte(54), false)
        panel:getModulatorByName("T1-LFO2-SYNCRO-SW"):setValueMapped(programData:getByte(55), false)
        panel:getModulatorByName("T1-LFO2-RATE"):setModulatorValue(programData:getByte(56), false, false, false)
        
        
        -- This filter is to combine 2 bytes that contais a "LFO-2 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(57)
                FilterLsb = programData:getByte(58)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T1-LFO2-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T1-LFO2-FADETYPE-SW"):setValueMapped(programData:getByte(59), false)
        panel:getModulatorByName("T1-LFO2-FADETIME"):setModulatorValue(programData:getByte(60), false, false, false)
        panel:getModulatorByName("T1-LFO2-PITCHDEPTH"):setModulatorValue(programData:getByte(61)-64, false, false, false)
        panel:getModulatorByName("T1-LFO2-TVFDEPTH"):setModulatorValue(programData:getByte(62)-64, false, false, false)
        panel:getModulatorByName("T1-LFO2-TVADEPTH"):setModulatorValue(programData:getByte(63)-64, false, false, false)
    
        panel:getModulatorByName("T1-PITCH-PITCHCOARSE"):setModulatorValue(programData:getByte(64)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-FINEPITCH"):setModulatorValue(programData:getByte(65)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-RANDOMPITCH"):setValueMapped(programData:getByte(66), false)
        panel:getModulatorByName("T1-PITCH-KFPITCH"):setValueMapped(programData:getByte(67), false)
        panel:getModulatorByName("T1-PITCH-VELOCITYLEVEL"):setModulatorValue(programData:getByte(68)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-T1VELOCITY"):setValueMapped(programData:getByte(69), false)
        panel:getModulatorByName("T1-PITCH-T4VELOCITY"):setValueMapped(programData:getByte(70), false)
        panel:getModulatorByName("T1-PITCH-KFTIME"):setValueMapped(programData:getByte(71), false)
        panel:getModulatorByName("T1-PITCH-ENVDEPTH"):setModulatorValue(programData:getByte(72)-64, false, false, false)
    
        panel:getModulatorByName("T1-PITCH-ENV-T1"):setModulatorValue(programData:getByte(73), false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-L1"):setModulatorValue(programData:getByte(74)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-T2"):setModulatorValue(programData:getByte(75), false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-L2"):setModulatorValue(programData:getByte(76)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-T3"):setModulatorValue(programData:getByte(77), false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-L3"):setModulatorValue(programData:getByte(78)-64, false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-T4"):setModulatorValue(programData:getByte(79), false, false, false)
        panel:getModulatorByName("T1-PITCH-ENV-L4"):setModulatorValue(programData:getByte(80)-64, false, false, false)
    
        panel:getModulatorByName("T1-TVF-FILTERMODE"):setValueMapped(programData:getByte(81), false)
        panel:getModulatorByName("T1-TVF-CUTOFFFREQ"):setModulatorValue(programData:getByte(82), false, false, false)
        panel:getModulatorByName("T1-TVF-RESONANCE"):setModulatorValue(programData:getByte(83), false, false, false)
        panel:getModulatorByName("T1-TVF-RESONANCETYPE"):setValueMapped(programData:getByte(84), false)
        panel:getModulatorByName("T1-TVF-KFCUTOFF"):setValueMapped(programData:getByte(85), false)
        panel:getModulatorByName("T1-TVF-VELOCITYCURVE"):setValueMapped(programData:getByte(86), false)
        panel:getModulatorByName("T1-TVF-ENVVELOCITY"):setModulatorValue(programData:getByte(87)-64, false, false, false)
        panel:getModulatorByName("T1-TVF-T1VELOCITY"):setValueMapped(programData:getByte(88), false)
        panel:getModulatorByName("T1-TVF-T4VELOCITY"):setValueMapped(programData:getByte(89), false)
        panel:getModulatorByName("T1-TVF-KFTIME"):setValueMapped(programData:getByte(90), false)
        panel:getModulatorByName("T1-TVF-ENVDEPTH"):setModulatorValue(programData:getByte(91)-64, false, false, false)
    
        panel:getModulatorByName("T1-TVF-ENV-T1"):setModulatorValue(programData:getByte(92), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-L1"):setModulatorValue(programData:getByte(93), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-T2"):setModulatorValue(programData:getByte(94), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-L2"):setModulatorValue(programData:getByte(95), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-T3"):setModulatorValue(programData:getByte(96), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-L3"):setModulatorValue(programData:getByte(97), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-T4"):setModulatorValue(programData:getByte(98), false, false, false)
        panel:getModulatorByName("T1-TVF-ENV-L4"):setModulatorValue(programData:getByte(99), false, false, false)
             
        panel:getModulatorByName("T1-LEVEL"):setModulatorValue(programData:getByte(100), false, false, false)
        
        panel:getModulatorByName("T1-TVA-KFLEVEL"):setValueMapped(programData:getByte(101), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Pan" data and set slide modulator
    
                FilterMsb = programData:getByte(102)
                FilterLsb = programData:getByte(103)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)-64  
    
        panel:getModulatorByName("T1-PAN"):setModulatorValue(FilterValue, false, false, false)
    
        
        panel:getModulatorByName("T1-TVA-KFPAN"):setValueMapped(programData:getByte(104), false)
        panel:getModulatorByName("T1-TVA-TONEDELAY"):setValueMapped(programData:getByte(105), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Tone Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(106)
                FilterLsb = programData:getByte(107)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
                panel:getModulatorByName("T1-TVA-DELAYTIME"):setModulatorValue(FilterValue, false, false, false)
            
        
        panel:getModulatorByName("T1-TVA-VELOCITYCURVE"):setValueMapped(programData:getByte(108), false)
        panel:getModulatorByName("T1-TVA-VELOCITYLEVEL"):setModulatorValue(programData:getByte(109)-64, false, false, false)
        panel:getModulatorByName("T1-TVA-T1VELOCITY"):setValueMapped(programData:getByte(110), false)
        panel:getModulatorByName("T1-TVA-T4VELOCITY"):setValueMapped(programData:getByte(111), false)
        panel:getModulatorByName("T1-TVA-KFTIME"):setValueMapped(programData:getByte(112), false)
        
        panel:getModulatorByName("T1-TVA-ENV-T1"):setModulatorValue(programData:getByte(113), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-L1"):setModulatorValue(programData:getByte(114), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-T2"):setModulatorValue(programData:getByte(115), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-L2"):setModulatorValue(programData:getByte(116), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-T3"):setModulatorValue(programData:getByte(117), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-L3"):setModulatorValue(programData:getByte(118), false, false, false)
        panel:getModulatorByName("T1-TVA-ENV-T4"):setModulatorValue(programData:getByte(119), false, false, false)
        
        panel:getModulatorByName("T1-DRY"):setModulatorValue(programData:getByte(120), false, false, false)
        panel:getModulatorByName("T1-REVERB"):setModulatorValue(programData:getByte(121), false, false, false)
        panel:getModulatorByName("T1-CHORUS"):setModulatorValue(programData:getByte(122), false, false, false)
        panel:getModulatorByName("T1-BUS"):setValueMapped(programData:getByte(123), false)
            
    
    
        end
    
    
    
    
    -- #### Tone 2 ####   
    
       
        if SelectTone==41 then -- Test if is Tone-2 Data from patch
    
    
        --Table to store on table All Tone 2 Data
    
        tableTone2 = {}
        
        tableTone2[0] = 0x41
        tableTone2[1] = programData:getByte(1)
        tableTone2[2] = programData:getByte(2)
        tableTone2[3] = programData:getByte(3)
        tableTone2[4] = programData:getByte(4)
        tableTone2[5] = programData:getByte(5)
        tableTone2[6] = programData:getByte(6)
        tableTone2[7] = programData:getByte(7)
        tableTone2[8] = programData:getByte(8)
        tableTone2[9] = programData:getByte(9)
        tableTone2[10] = programData:getByte(10)
        tableTone2[11] = programData:getByte(11)
        tableTone2[12] = programData:getByte(12)
        tableTone2[13] = programData:getByte(13)
        tableTone2[14] = programData:getByte(14)
        tableTone2[15] = programData:getByte(15)
        tableTone2[16] = programData:getByte(16)
        tableTone2[17] = programData:getByte(17)
        tableTone2[18] = programData:getByte(18)
        tableTone2[19] = programData:getByte(19)
        tableTone2[20] = programData:getByte(20)
        tableTone2[21] = programData:getByte(21)
        tableTone2[22] = programData:getByte(22)
        tableTone2[23] = programData:getByte(23)
        tableTone2[24] = programData:getByte(24)
        tableTone2[25] = programData:getByte(25)
        tableTone2[26] = programData:getByte(26)
        tableTone2[27] = programData:getByte(27)
        tableTone2[28] = programData:getByte(28)
        tableTone2[29] = programData:getByte(29)
        tableTone2[30] = programData:getByte(30)
        tableTone2[31] = programData:getByte(31)
        tableTone2[32] = programData:getByte(32)
        tableTone2[33] = programData:getByte(33)
        tableTone2[34] = programData:getByte(34)
        tableTone2[35] = programData:getByte(35)
        tableTone2[36] = programData:getByte(36)
        tableTone2[37] = programData:getByte(37)
        tableTone2[38] = programData:getByte(38)
        tableTone2[39] = programData:getByte(39)
        tableTone2[40] = programData:getByte(40)
        tableTone2[41] = programData:getByte(41)
        tableTone2[42] = programData:getByte(42)
        tableTone2[43] = programData:getByte(43)
        tableTone2[44] = programData:getByte(44)
        tableTone2[45] = programData:getByte(45)
        tableTone2[46] = programData:getByte(46)
        tableTone2[47] = programData:getByte(47)
        tableTone2[48] = programData:getByte(48)
        tableTone2[49] = programData:getByte(49)
        tableTone2[50] = programData:getByte(50)
        tableTone2[51] = programData:getByte(51)
        tableTone2[52] = programData:getByte(52)
        tableTone2[53] = programData:getByte(53)
        tableTone2[54] = programData:getByte(54)
        tableTone2[55] = programData:getByte(55)
        tableTone2[56] = programData:getByte(56)
        tableTone2[57] = programData:getByte(57)
        tableTone2[58] = programData:getByte(58)
        tableTone2[59] = programData:getByte(59)
        tableTone2[60] = programData:getByte(60)
        tableTone2[61] = programData:getByte(61)
        tableTone2[62] = programData:getByte(62)
        tableTone2[63] = programData:getByte(63)
        tableTone2[64] = programData:getByte(64)
        tableTone2[65] = programData:getByte(65)
        tableTone2[66] = programData:getByte(66)
        tableTone2[67] = programData:getByte(67)
        tableTone2[68] = programData:getByte(68)
        tableTone2[69] = programData:getByte(69)
        tableTone2[70] = programData:getByte(70)
        tableTone2[71] = programData:getByte(71)
        tableTone2[72] = programData:getByte(72)
        tableTone2[73] = programData:getByte(73)
        tableTone2[74] = programData:getByte(74)
        tableTone2[75] = programData:getByte(75)
        tableTone2[76] = programData:getByte(76)
        tableTone2[77] = programData:getByte(77)
        tableTone2[78] = programData:getByte(78)
        tableTone2[79] = programData:getByte(79)
        tableTone2[80] = programData:getByte(80)
        tableTone2[81] = programData:getByte(81)
        tableTone2[82] = programData:getByte(82)
        tableTone2[83] = programData:getByte(83)
        tableTone2[84] = programData:getByte(84)
        tableTone2[85] = programData:getByte(85)
        tableTone2[86] = programData:getByte(86)
        tableTone2[87] = programData:getByte(87)
        tableTone2[88] = programData:getByte(88)
        tableTone2[89] = programData:getByte(89)
        tableTone2[90] = programData:getByte(90)
        tableTone2[91] = programData:getByte(91)
        tableTone2[92] = programData:getByte(92)
        tableTone2[93] = programData:getByte(93)
        tableTone2[94] = programData:getByte(94)
        tableTone2[95] = programData:getByte(95)
        tableTone2[96] = programData:getByte(96)
        tableTone2[97] = programData:getByte(97)
        tableTone2[98] = programData:getByte(98)
        tableTone2[99] = programData:getByte(99)
        tableTone2[100] = programData:getByte(100)
        tableTone2[101] = programData:getByte(101)
        tableTone2[102] = programData:getByte(102)
        tableTone2[103] = programData:getByte(103)
        tableTone2[104] = programData:getByte(104)
        tableTone2[105] = programData:getByte(105)
        tableTone2[106] = programData:getByte(106)
        tableTone2[107] = programData:getByte(107)
        tableTone2[108] = programData:getByte(108)
        tableTone2[109] = programData:getByte(109)
        tableTone2[110] = programData:getByte(110)
        tableTone2[111] = programData:getByte(111)
        tableTone2[112] = programData:getByte(112)
        tableTone2[113] = programData:getByte(113)
        tableTone2[114] = programData:getByte(114)
        tableTone2[115] = programData:getByte(115)
        tableTone2[116] = programData:getByte(116)
        tableTone2[117] = programData:getByte(117)
        tableTone2[118] = programData:getByte(118)
        tableTone2[119] = programData:getByte(119)
        tableTone2[120] = programData:getByte(120)
        tableTone2[121] = programData:getByte(121)
        tableTone2[122] = programData:getByte(122)
        tableTone2[123] = programData:getByte(123)
        tableTone2[124] = programData:getByte(124)
    
    
        panel:getModulatorByName("T2-WAVEGROUP"):setValueMapped(programData:getByte(8), false)
       
        
        -- This filter is to combine 2 bytes that contais the "Wave Number" data abd set the Internal Wave combo modulator    
      
                FilterMsb = programData:getByte(9)
                FilterLsb = programData:getByte(10)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        
        panel:getModulatorByName("T2-WAVE-INT"):setModulatorValue(FilterValue, false,false,false)
            
    
        panel:getModulatorByName("T2-SWITCH"):setValueMapped(programData:getByte(11), false)
        
        panel:getModulatorByName("T2-FXM-SW"):setValueMapped(programData:getByte(12), false)
        panel:getModulatorByName("T2-FXM-DEPTH"):setModulatorValue(programData:getByte(13)+1, false, false, false)
        
        panel:getModulatorByName("T2-VELOCITY-LOWER"):setModulatorValue(programData:getByte(14), false, false, false)
        panel:getModulatorByName("T2-VELOCITY-UPPER"):setModulatorValue(programData:getByte(15), false, false, false)
        
        panel:getModulatorByName("T2-VOL-SW"):setValueMapped(programData:getByte(16), false)
        panel:getModulatorByName("T2-HOLD-SW"):setValueMapped(programData:getByte(17), false)
        
        panel:getModulatorByName("T2-MOD-MOD1-DESTINY"):setValueMapped(programData:getByte(18), false)
        panel:getModulatorByName("T2-MOD-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(19)-64, false, false, false)
        panel:getModulatorByName("T2-MOD-MOD2-DESTINY"):setValueMapped(programData:getByte(20), false)
        panel:getModulatorByName("T2-MOD-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(21)-64, false, false, false)
        panel:getModulatorByName("T2-MOD-MOD3-DESTINY"):setValueMapped(programData:getByte(22), false)
        panel:getModulatorByName("T2-MOD-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(23)-64, false, false, false)
        panel:getModulatorByName("T2-MOD-MOD4-DESTINY"):setValueMapped(programData:getByte(24), false)
        panel:getModulatorByName("T2-MOD-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(25)-64, false, false, false)
        
        panel:getModulatorByName("T2-AFT-MOD1-DESTINY"):setValueMapped(programData:getByte(26), false)
        panel:getModulatorByName("T2-AFT-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(27)-64, false, false, false)
        panel:getModulatorByName("T2-AFT-MOD2-DESTINY"):setValueMapped(programData:getByte(28), false)
        panel:getModulatorByName("T2-AFT-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(29)-64, false, false, false)
        panel:getModulatorByName("T2-AFT-MOD3-DESTINY"):setValueMapped(programData:getByte(30), false)
        panel:getModulatorByName("T2-AFT-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(31)-64, false, false, false)
        panel:getModulatorByName("T2-AFT-MOD4-DESTINY"):setValueMapped(programData:getByte(32), false)
        panel:getModulatorByName("T2-AFT-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(33)-64, false, false, false)
        
        panel:getModulatorByName("T2-EXP-MOD1-DESTINY"):setValueMapped(programData:getByte(34), false)
        panel:getModulatorByName("T2-EXP-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(35)-64, false, false, false)
        panel:getModulatorByName("T2-EXP-MOD2-DESTINY"):setValueMapped(programData:getByte(36), false)
        panel:getModulatorByName("T2-EXP-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(37)-64, false, false, false)
        panel:getModulatorByName("T2-EXP-MOD3-DESTINY"):setValueMapped(programData:getByte(38), false)
        panel:getModulatorByName("T2-EXP-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(39)-64, false, false, false)
        panel:getModulatorByName("T2-EXP-MOD4-DESTINY"):setValueMapped(programData:getByte(40), false)
        panel:getModulatorByName("T2-EXP-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(41)-64, false, false, false)
        
        panel:getModulatorByName("T2-LFO1-WAVEFORM"):setValueMapped(programData:getByte(42), false)
        panel:getModulatorByName("T2-LFO1-OFFSET"):setValueMapped(programData:getByte(43), false)
        panel:getModulatorByName("T2-LFO1-SYNCRO-SW"):setValueMapped(programData:getByte(44), false)
        panel:getModulatorByName("T2-LFO1-RATE"):setModulatorValue(programData:getByte(45), false, false, false)
            
        
        -- This filter is to combine 2 bytes that contais a "LFO-1 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(46)
                FilterLsb = programData:getByte(47)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T2-LFO1-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T2-LFO1-FADETYPE-SW"):setValueMapped(programData:getByte(48), false)
        panel:getModulatorByName("T2-LFO1-FADETIME"):setModulatorValue(programData:getByte(49), false, false, false)
        panel:getModulatorByName("T2-LFO1-PITCHDEPTH"):setModulatorValue(programData:getByte(50)-64, false, false, false)
        panel:getModulatorByName("T2-LFO1-TVFDEPTH"):setModulatorValue(programData:getByte(51)-64, false, false, false)
        panel:getModulatorByName("T2-LFO1-TVADEPTH"):setModulatorValue(programData:getByte(52)-64, false, false, false)
        
        panel:getModulatorByName("T2-LFO2-WAVEFORM"):setValueMapped(programData:getByte(53), false)
        panel:getModulatorByName("T2-LFO2-OFFSET"):setValueMapped(programData:getByte(54), false)
        panel:getModulatorByName("T2-LFO2-SYNCRO-SW"):setValueMapped(programData:getByte(55), false)
        panel:getModulatorByName("T2-LFO2-RATE"):setModulatorValue(programData:getByte(56), false, false, false)
        
        
        -- This filter is to combine 2 bytes that contais a "LFO-2 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(57)
                FilterLsb = programData:getByte(58)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T2-LFO2-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T2-LFO2-FADETYPE-SW"):setValueMapped(programData:getByte(59), false)
        panel:getModulatorByName("T2-LFO2-FADETIME"):setModulatorValue(programData:getByte(60), false, false, false)
        panel:getModulatorByName("T2-LFO2-PITCHDEPTH"):setModulatorValue(programData:getByte(61)-64, false, false, false)
        panel:getModulatorByName("T2-LFO2-TVFDEPTH"):setModulatorValue(programData:getByte(62)-64, false, false, false)
        panel:getModulatorByName("T2-LFO2-TVADEPTH"):setModulatorValue(programData:getByte(63)-64, false, false, false)
    
        panel:getModulatorByName("T2-PITCH-PITCHCOARSE"):setModulatorValue(programData:getByte(64)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-FINEPITCH"):setModulatorValue(programData:getByte(65)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-RANDOMPITCH"):setValueMapped(programData:getByte(66), false)
        panel:getModulatorByName("T2-PITCH-KFPITCH"):setValueMapped(programData:getByte(67), false)
        panel:getModulatorByName("T2-PITCH-VELOCITYLEVEL"):setModulatorValue(programData:getByte(68)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-T1VELOCITY"):setValueMapped(programData:getByte(69), false)
        panel:getModulatorByName("T2-PITCH-T4VELOCITY"):setValueMapped(programData:getByte(70), false)
        panel:getModulatorByName("T2-PITCH-KFTIME"):setValueMapped(programData:getByte(71), false)
        panel:getModulatorByName("T2-PITCH-ENVDEPTH"):setModulatorValue(programData:getByte(72)-64, false, false, false)
    
        panel:getModulatorByName("T2-PITCH-ENV-T1"):setModulatorValue(programData:getByte(73), false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-L1"):setModulatorValue(programData:getByte(74)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-T2"):setModulatorValue(programData:getByte(75), false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-L2"):setModulatorValue(programData:getByte(76)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-T3"):setModulatorValue(programData:getByte(77), false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-L3"):setModulatorValue(programData:getByte(78)-64, false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-T4"):setModulatorValue(programData:getByte(79), false, false, false)
        panel:getModulatorByName("T2-PITCH-ENV-L4"):setModulatorValue(programData:getByte(80)-64, false, false, false)
    
        panel:getModulatorByName("T2-TVF-FILTERMODE"):setValueMapped(programData:getByte(81), false)
        panel:getModulatorByName("T2-TVF-CUTOFFFREQ"):setModulatorValue(programData:getByte(82), false, false, false)
        panel:getModulatorByName("T2-TVF-RESONANCE"):setModulatorValue(programData:getByte(83), false, false, false)
        panel:getModulatorByName("T2-TVF-RESONANCETYPE"):setValueMapped(programData:getByte(84), false)
        panel:getModulatorByName("T2-TVF-KFCUTOFF"):setValueMapped(programData:getByte(85), false)
        panel:getModulatorByName("T2-TVF-VELOCITYCURVE"):setValueMapped(programData:getByte(86), false)
        panel:getModulatorByName("T2-TVF-ENVVELOCITY"):setModulatorValue(programData:getByte(87)-64, false, false, false)
        panel:getModulatorByName("T2-TVF-T1VELOCITY"):setValueMapped(programData:getByte(88), false)
        panel:getModulatorByName("T2-TVF-T4VELOCITY"):setValueMapped(programData:getByte(89), false)
        panel:getModulatorByName("T2-TVF-KFTIME"):setValueMapped(programData:getByte(90), false)
        panel:getModulatorByName("T2-TVF-ENVDEPTH"):setModulatorValue(programData:getByte(91)-64, false, false, false)
    
        panel:getModulatorByName("T2-TVF-ENV-T1"):setModulatorValue(programData:getByte(92), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-L1"):setModulatorValue(programData:getByte(93), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-T2"):setModulatorValue(programData:getByte(94), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-L2"):setModulatorValue(programData:getByte(95), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-T3"):setModulatorValue(programData:getByte(96), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-L3"):setModulatorValue(programData:getByte(97), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-T4"):setModulatorValue(programData:getByte(98), false, false, false)
        panel:getModulatorByName("T2-TVF-ENV-L4"):setModulatorValue(programData:getByte(99), false, false, false)
             
        panel:getModulatorByName("T2-LEVEL"):setModulatorValue(programData:getByte(100), false, false, false)
        
        panel:getModulatorByName("T2-TVA-KFLEVEL"):setValueMapped(programData:getByte(101), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Pan" data and set slide modulator
    
                FilterMsb = programData:getByte(102)
                FilterLsb = programData:getByte(103)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)-64  
    
        panel:getModulatorByName("T2-PAN"):setModulatorValue(FilterValue, false, false, false)
    
        
        panel:getModulatorByName("T2-TVA-KFPAN"):setValueMapped(programData:getByte(104), false)
        panel:getModulatorByName("T2-TVA-TONEDELAY"):setValueMapped(programData:getByte(105), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Tone Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(106)
                FilterLsb = programData:getByte(107)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T2-TVA-DELAYTIME"):setModulatorValue(FilterValue, false, false, false)
            
        
        panel:getModulatorByName("T2-TVA-VELOCITYCURVE"):setValueMapped(programData:getByte(108), false)
        panel:getModulatorByName("T2-TVA-VELOCITYLEVEL"):setModulatorValue(programData:getByte(109)-64, false, false, false)
        panel:getModulatorByName("T2-TVA-T1VELOCITY"):setValueMapped(programData:getByte(110), false)
        panel:getModulatorByName("T2-TVA-T4VELOCITY"):setValueMapped(programData:getByte(111), false)
        panel:getModulatorByName("T2-TVA-KFTIME"):setValueMapped(programData:getByte(112), false)
        
        panel:getModulatorByName("T2-TVA-ENV-T1"):setModulatorValue(programData:getByte(113), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-L1"):setModulatorValue(programData:getByte(114), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-T2"):setModulatorValue(programData:getByte(115), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-L2"):setModulatorValue(programData:getByte(116), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-T3"):setModulatorValue(programData:getByte(117), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-L3"):setModulatorValue(programData:getByte(118), false, false, false)
        panel:getModulatorByName("T2-TVA-ENV-T4"):setModulatorValue(programData:getByte(119), false, false, false)
        
        panel:getModulatorByName("T2-DRY"):setModulatorValue(programData:getByte(120), false, false, false)
        panel:getModulatorByName("T2-REVERB"):setModulatorValue(programData:getByte(121), false, false, false)
        panel:getModulatorByName("T2-CHORUS"):setModulatorValue(programData:getByte(122), false, false, false)
        panel:getModulatorByName("T2-BUS"):setValueMapped(programData:getByte(123), false)
            
    
        end
    
    
    
    
    -- #### Tone 3 ####   
    
       
        if SelectTone==42 then -- Test if is Tone-3 Data from patch
    
        
        --Table to store on table All Tone 3 Data
    
        tableTone3 = {}
    
        tableTone3[0] = 0x41
        tableTone3[1] = programData:getByte(1)
        tableTone3[2] = programData:getByte(2)
        tableTone3[3] = programData:getByte(3)
        tableTone3[4] = programData:getByte(4)
        tableTone3[5] = programData:getByte(5)
        tableTone3[6] = programData:getByte(6)
        tableTone3[7] = programData:getByte(7)
        tableTone3[8] = programData:getByte(8)
        tableTone3[9] = programData:getByte(9)
        tableTone3[10] = programData:getByte(10)
        tableTone3[11] = programData:getByte(11)
        tableTone3[12] = programData:getByte(12)
        tableTone3[13] = programData:getByte(13)
        tableTone3[14] = programData:getByte(14)
        tableTone3[15] = programData:getByte(15)
        tableTone3[16] = programData:getByte(16)
        tableTone3[17] = programData:getByte(17)
        tableTone3[18] = programData:getByte(18)
        tableTone3[19] = programData:getByte(19)
        tableTone3[20] = programData:getByte(20)
        tableTone3[21] = programData:getByte(21)
        tableTone3[22] = programData:getByte(22)
        tableTone3[23] = programData:getByte(23)
        tableTone3[24] = programData:getByte(24)
        tableTone3[25] = programData:getByte(25)
        tableTone3[26] = programData:getByte(26)
        tableTone3[27] = programData:getByte(27)
        tableTone3[28] = programData:getByte(28)
        tableTone3[29] = programData:getByte(29)
        tableTone3[30] = programData:getByte(30)
        tableTone3[31] = programData:getByte(31)
        tableTone3[32] = programData:getByte(32)
        tableTone3[33] = programData:getByte(33)
        tableTone3[34] = programData:getByte(34)
        tableTone3[35] = programData:getByte(35)
        tableTone3[36] = programData:getByte(36)
        tableTone3[37] = programData:getByte(37)
        tableTone3[38] = programData:getByte(38)
        tableTone3[39] = programData:getByte(39)
        tableTone3[40] = programData:getByte(40)
        tableTone3[41] = programData:getByte(41)
        tableTone3[42] = programData:getByte(42)
        tableTone3[43] = programData:getByte(43)
        tableTone3[44] = programData:getByte(44)
        tableTone3[45] = programData:getByte(45)
        tableTone3[46] = programData:getByte(46)
        tableTone3[47] = programData:getByte(47)
        tableTone3[48] = programData:getByte(48)
        tableTone3[49] = programData:getByte(49)
        tableTone3[50] = programData:getByte(50)
        tableTone3[51] = programData:getByte(51)
        tableTone3[52] = programData:getByte(52)
        tableTone3[53] = programData:getByte(53)
        tableTone3[54] = programData:getByte(54)
        tableTone3[55] = programData:getByte(55)
        tableTone3[56] = programData:getByte(56)
        tableTone3[57] = programData:getByte(57)
        tableTone3[58] = programData:getByte(58)
        tableTone3[59] = programData:getByte(59)
        tableTone3[60] = programData:getByte(60)
        tableTone3[61] = programData:getByte(61)
        tableTone3[62] = programData:getByte(62)
        tableTone3[63] = programData:getByte(63)
        tableTone3[64] = programData:getByte(64)
        tableTone3[65] = programData:getByte(65)
        tableTone3[66] = programData:getByte(66)
        tableTone3[67] = programData:getByte(67)
        tableTone3[68] = programData:getByte(68)
        tableTone3[69] = programData:getByte(69)
        tableTone3[70] = programData:getByte(70)
        tableTone3[71] = programData:getByte(71)
        tableTone3[72] = programData:getByte(72)
        tableTone3[73] = programData:getByte(73)
        tableTone3[74] = programData:getByte(74)
        tableTone3[75] = programData:getByte(75)
        tableTone3[76] = programData:getByte(76)
        tableTone3[77] = programData:getByte(77)
        tableTone3[78] = programData:getByte(78)
        tableTone3[79] = programData:getByte(79)
        tableTone3[80] = programData:getByte(80)
        tableTone3[81] = programData:getByte(81)
        tableTone3[82] = programData:getByte(82)
        tableTone3[83] = programData:getByte(83)
        tableTone3[84] = programData:getByte(84)
        tableTone3[85] = programData:getByte(85)
        tableTone3[86] = programData:getByte(86)
        tableTone3[87] = programData:getByte(87)
        tableTone3[88] = programData:getByte(88)
        tableTone3[89] = programData:getByte(89)
        tableTone3[90] = programData:getByte(90)
        tableTone3[91] = programData:getByte(91)
        tableTone3[92] = programData:getByte(92)
        tableTone3[93] = programData:getByte(93)
        tableTone3[94] = programData:getByte(94)
        tableTone3[95] = programData:getByte(95)
        tableTone3[96] = programData:getByte(96)
        tableTone3[97] = programData:getByte(97)
        tableTone3[98] = programData:getByte(98)
        tableTone3[99] = programData:getByte(99)
        tableTone3[100] = programData:getByte(100)
        tableTone3[101] = programData:getByte(101)
        tableTone3[102] = programData:getByte(102)
        tableTone3[103] = programData:getByte(103)
        tableTone3[104] = programData:getByte(104)
        tableTone3[105] = programData:getByte(105)
        tableTone3[106] = programData:getByte(106)
        tableTone3[107] = programData:getByte(107)
        tableTone3[108] = programData:getByte(108)
        tableTone3[109] = programData:getByte(109)
        tableTone3[110] = programData:getByte(110)
        tableTone3[111] = programData:getByte(111)
        tableTone3[112] = programData:getByte(112)
        tableTone3[113] = programData:getByte(113)
        tableTone3[114] = programData:getByte(114)
        tableTone3[115] = programData:getByte(115)
        tableTone3[116] = programData:getByte(116)
        tableTone3[117] = programData:getByte(117)
        tableTone3[118] = programData:getByte(118)
        tableTone3[119] = programData:getByte(119)
        tableTone3[120] = programData:getByte(120)
        tableTone3[121] = programData:getByte(121)
        tableTone3[122] = programData:getByte(122)
        tableTone3[123] = programData:getByte(123)
        tableTone3[124] = programData:getByte(124)
    
    
        panel:getModulatorByName("T3-WAVEGROUP"):setValueMapped(programData:getByte(8), false)
        
        
        -- This filter is to combine 2 bytes that contais the "Wave Number" data abd set the Internal Wave combo modulator    
      
                FilterMsb = programData:getByte(9)
                FilterLsb = programData:getByte(10)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        
        panel:getModulatorByName("T3-WAVE-INT"):setModulatorValue(FilterValue, false,false,false)
    
    
        panel:getModulatorByName("T3-SWITCH"):setValueMapped(programData:getByte(11), false)
        
        panel:getModulatorByName("T3-FXM-SW"):setValueMapped(programData:getByte(12), false)
        panel:getModulatorByName("T3-FXM-DEPTH"):setModulatorValue(programData:getByte(13)+1, false, false, false)
        
        panel:getModulatorByName("T3-VELOCITY-LOWER"):setModulatorValue(programData:getByte(14), false, false, false)
        panel:getModulatorByName("T3-VELOCITY-UPPER"):setModulatorValue(programData:getByte(15), false, false, false)
        
        panel:getModulatorByName("T3-VOL-SW"):setValueMapped(programData:getByte(16), false)
        panel:getModulatorByName("T3-HOLD-SW"):setValueMapped(programData:getByte(17), false)
        
        panel:getModulatorByName("T3-MOD-MOD1-DESTINY"):setValueMapped(programData:getByte(18), false)
        panel:getModulatorByName("T3-MOD-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(19)-64, false, false, false)
        panel:getModulatorByName("T3-MOD-MOD2-DESTINY"):setValueMapped(programData:getByte(20), false)
        panel:getModulatorByName("T3-MOD-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(21)-64, false, false, false)
        panel:getModulatorByName("T3-MOD-MOD3-DESTINY"):setValueMapped(programData:getByte(22), false)
        panel:getModulatorByName("T3-MOD-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(23)-64, false, false, false)
        panel:getModulatorByName("T3-MOD-MOD4-DESTINY"):setValueMapped(programData:getByte(24), false)
        panel:getModulatorByName("T3-MOD-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(25)-64, false, false, false)
        
        panel:getModulatorByName("T3-AFT-MOD1-DESTINY"):setValueMapped(programData:getByte(26), false)
        panel:getModulatorByName("T3-AFT-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(27)-64, false, false, false)
        panel:getModulatorByName("T3-AFT-MOD2-DESTINY"):setValueMapped(programData:getByte(28), false)
        panel:getModulatorByName("T3-AFT-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(29)-64, false, false, false)
        panel:getModulatorByName("T3-AFT-MOD3-DESTINY"):setValueMapped(programData:getByte(30), false)
        panel:getModulatorByName("T3-AFT-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(31)-64, false, false, false)
        panel:getModulatorByName("T3-AFT-MOD4-DESTINY"):setValueMapped(programData:getByte(32), false)
        panel:getModulatorByName("T3-AFT-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(33)-64, false, false, false)
        
        panel:getModulatorByName("T3-EXP-MOD1-DESTINY"):setValueMapped(programData:getByte(34), false)
        panel:getModulatorByName("T3-EXP-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(35)-64, false, false, false)
        panel:getModulatorByName("T3-EXP-MOD2-DESTINY"):setValueMapped(programData:getByte(36), false)
        panel:getModulatorByName("T3-EXP-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(37)-64, false, false, false)
        panel:getModulatorByName("T3-EXP-MOD3-DESTINY"):setValueMapped(programData:getByte(38), false)
        panel:getModulatorByName("T3-EXP-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(39)-64, false, false, false)
        panel:getModulatorByName("T3-EXP-MOD4-DESTINY"):setValueMapped(programData:getByte(40), false)
        panel:getModulatorByName("T3-EXP-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(41)-64, false, false, false)
        
        panel:getModulatorByName("T3-LFO1-WAVEFORM"):setValueMapped(programData:getByte(42), false)
        panel:getModulatorByName("T3-LFO1-OFFSET"):setValueMapped(programData:getByte(43), false)
        panel:getModulatorByName("T3-LFO1-SYNCRO-SW"):setValueMapped(programData:getByte(44), false)
        panel:getModulatorByName("T3-LFO1-RATE"):setModulatorValue(programData:getByte(45), false, false, false)
            
        
        -- This filter is to combine 2 bytes that contais a "LFO-1 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(46)
                FilterLsb = programData:getByte(47)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T3-LFO1-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T3-LFO1-FADETYPE-SW"):setValueMapped(programData:getByte(48), false)
        panel:getModulatorByName("T3-LFO1-FADETIME"):setModulatorValue(programData:getByte(49), false, false, false)
        panel:getModulatorByName("T3-LFO1-PITCHDEPTH"):setModulatorValue(programData:getByte(50)-64, false, false, false)
        panel:getModulatorByName("T3-LFO1-TVFDEPTH"):setModulatorValue(programData:getByte(51)-64, false, false, false)
        panel:getModulatorByName("T3-LFO1-TVADEPTH"):setModulatorValue(programData:getByte(52)-64, false, false, false)
        
        panel:getModulatorByName("T3-LFO2-WAVEFORM"):setValueMapped(programData:getByte(53), false)
        panel:getModulatorByName("T3-LFO2-OFFSET"):setValueMapped(programData:getByte(54), false)
        panel:getModulatorByName("T3-LFO2-SYNCRO-SW"):setValueMapped(programData:getByte(55), false)
        panel:getModulatorByName("T3-LFO2-RATE"):setModulatorValue(programData:getByte(56), false, false, false)
        
        
        -- This filter is to combine 2 bytes that contais a "LFO-2 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(57)
                FilterLsb = programData:getByte(58)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T2-LFO2-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T3-LFO2-FADETYPE-SW"):setValueMapped(programData:getByte(59), false)
        panel:getModulatorByName("T3-LFO2-FADETIME"):setModulatorValue(programData:getByte(60), false, false, false)
        panel:getModulatorByName("T3-LFO2-PITCHDEPTH"):setModulatorValue(programData:getByte(61)-64, false, false, false)
        panel:getModulatorByName("T3-LFO2-TVFDEPTH"):setModulatorValue(programData:getByte(62)-64, false, false, false)
        panel:getModulatorByName("T3-LFO2-TVADEPTH"):setModulatorValue(programData:getByte(63)-64, false, false, false)
    
        panel:getModulatorByName("T3-PITCH-PITCHCOARSE"):setModulatorValue(programData:getByte(64)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-FINEPITCH"):setModulatorValue(programData:getByte(65)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-RANDOMPITCH"):setValueMapped(programData:getByte(66), false)
        panel:getModulatorByName("T3-PITCH-KFPITCH"):setValueMapped(programData:getByte(67), false)
        panel:getModulatorByName("T3-PITCH-VELOCITYLEVEL"):setModulatorValue(programData:getByte(68)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-T1VELOCITY"):setValueMapped(programData:getByte(69), false)
        panel:getModulatorByName("T3-PITCH-T4VELOCITY"):setValueMapped(programData:getByte(70), false)
        panel:getModulatorByName("T3-PITCH-KFTIME"):setValueMapped(programData:getByte(71), false)
        panel:getModulatorByName("T3-PITCH-ENVDEPTH"):setModulatorValue(programData:getByte(72)-64, false, false, false)
    
        panel:getModulatorByName("T3-PITCH-ENV-T1"):setModulatorValue(programData:getByte(73), false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-L1"):setModulatorValue(programData:getByte(74)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-T2"):setModulatorValue(programData:getByte(75), false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-L2"):setModulatorValue(programData:getByte(76)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-T3"):setModulatorValue(programData:getByte(77), false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-L3"):setModulatorValue(programData:getByte(78)-64, false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-T4"):setModulatorValue(programData:getByte(79), false, false, false)
        panel:getModulatorByName("T3-PITCH-ENV-L4"):setModulatorValue(programData:getByte(80)-64, false, false, false)
    
        panel:getModulatorByName("T3-TVF-FILTERMODE"):setValueMapped(programData:getByte(81), false)
        panel:getModulatorByName("T3-TVF-CUTOFFFREQ"):setModulatorValue(programData:getByte(82), false, false, false)
        panel:getModulatorByName("T3-TVF-RESONANCE"):setModulatorValue(programData:getByte(83), false, false, false)
        panel:getModulatorByName("T3-TVF-RESONANCETYPE"):setValueMapped(programData:getByte(84), false)
        panel:getModulatorByName("T3-TVF-KFCUTOFF"):setValueMapped(programData:getByte(85), false)
        panel:getModulatorByName("T3-TVF-VELOCITYCURVE"):setValueMapped(programData:getByte(86), false)
        panel:getModulatorByName("T3-TVF-ENVVELOCITY"):setModulatorValue(programData:getByte(87)-64, false, false, false)
        panel:getModulatorByName("T3-TVF-T1VELOCITY"):setValueMapped(programData:getByte(88), false)
        panel:getModulatorByName("T3-TVF-T4VELOCITY"):setValueMapped(programData:getByte(89), false)
        panel:getModulatorByName("T3-TVF-KFTIME"):setValueMapped(programData:getByte(90), false)
        panel:getModulatorByName("T3-TVF-ENVDEPTH"):setModulatorValue(programData:getByte(91)-64, false, false, false)
    
        panel:getModulatorByName("T3-TVF-ENV-T1"):setModulatorValue(programData:getByte(92), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-L1"):setModulatorValue(programData:getByte(93), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-T2"):setModulatorValue(programData:getByte(94), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-L2"):setModulatorValue(programData:getByte(95), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-T3"):setModulatorValue(programData:getByte(96), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-L3"):setModulatorValue(programData:getByte(97), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-T4"):setModulatorValue(programData:getByte(98), false, false, false)
        panel:getModulatorByName("T3-TVF-ENV-L4"):setModulatorValue(programData:getByte(99), false, false, false)
             
        panel:getModulatorByName("T3-LEVEL"):setModulatorValue(programData:getByte(100), false, false, false)
        
        panel:getModulatorByName("T3-TVA-KFLEVEL"):setValueMapped(programData:getByte(101), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Pan" data and set slide modulator
    
                FilterMsb = programData:getByte(102)
                FilterLsb = programData:getByte(103)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)-64  
    
        panel:getModulatorByName("T3-PAN"):setModulatorValue(FilterValue, false, false, false)
    
        
        panel:getModulatorByName("T3-TVA-KFPAN"):setValueMapped(programData:getByte(104), false)
        panel:getModulatorByName("T3-TVA-TONEDELAY"):setValueMapped(programData:getByte(105), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Tone Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(106)
                FilterLsb = programData:getByte(107)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T3-TVA-DELAYTIME"):setModulatorValue(FilterValue, false, false, false)
            
        
        panel:getModulatorByName("T3-TVA-VELOCITYCURVE"):setValueMapped(programData:getByte(108), false)
        panel:getModulatorByName("T3-TVA-VELOCITYLEVEL"):setModulatorValue(programData:getByte(109)-64, false, false, false)
        panel:getModulatorByName("T3-TVA-T1VELOCITY"):setValueMapped(programData:getByte(110), false)
        panel:getModulatorByName("T3-TVA-T4VELOCITY"):setValueMapped(programData:getByte(111), false)
        panel:getModulatorByName("T3-TVA-KFTIME"):setValueMapped(programData:getByte(112), false)
        
        panel:getModulatorByName("T3-TVA-ENV-T1"):setModulatorValue(programData:getByte(113), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-L1"):setModulatorValue(programData:getByte(114), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-T2"):setModulatorValue(programData:getByte(115), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-L2"):setModulatorValue(programData:getByte(116), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-T3"):setModulatorValue(programData:getByte(117), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-L3"):setModulatorValue(programData:getByte(118), false, false, false)
        panel:getModulatorByName("T3-TVA-ENV-T4"):setModulatorValue(programData:getByte(119), false, false, false)
        
        panel:getModulatorByName("T3-DRY"):setModulatorValue(programData:getByte(120), false, false, false)
        panel:getModulatorByName("T3-REVERB"):setModulatorValue(programData:getByte(121), false, false, false)
        panel:getModulatorByName("T3-CHORUS"):setModulatorValue(programData:getByte(122), false, false, false)
        panel:getModulatorByName("T3-BUS"):setValueMapped(programData:getByte(123), false)
            
    
        end
    
    
    
    
    -- #### Tone 4 ####   
    
       
        if SelectTone==43 then -- Test if is Tone-4 Data from patch
    
        
        --Table to store on table All Tone 4 Data
        
        tableTone4 = {}
    
        tableTone4[0] = 0x41
        tableTone4[1] = programData:getByte(1)
        tableTone4[2] = programData:getByte(2)
        tableTone4[3] = programData:getByte(3)
        tableTone4[4] = programData:getByte(4)
        tableTone4[5] = programData:getByte(5)
        tableTone4[6] = programData:getByte(6)
        tableTone4[7] = programData:getByte(7)
        tableTone4[8] = programData:getByte(8)
        tableTone4[9] = programData:getByte(9)
        tableTone4[10] = programData:getByte(10)
        tableTone4[11] = programData:getByte(11)
        tableTone4[12] = programData:getByte(12)
        tableTone4[13] = programData:getByte(13)
        tableTone4[14] = programData:getByte(14)
        tableTone4[15] = programData:getByte(15)
        tableTone4[16] = programData:getByte(16)
        tableTone4[17] = programData:getByte(17)
        tableTone4[18] = programData:getByte(18)
        tableTone4[19] = programData:getByte(19)
        tableTone4[20] = programData:getByte(20)
        tableTone4[21] = programData:getByte(21)
        tableTone4[22] = programData:getByte(22)
        tableTone4[23] = programData:getByte(23)
        tableTone4[24] = programData:getByte(24)
        tableTone4[25] = programData:getByte(25)
        tableTone4[26] = programData:getByte(26)
        tableTone4[27] = programData:getByte(27)
        tableTone4[28] = programData:getByte(28)
        tableTone4[29] = programData:getByte(29)
        tableTone4[30] = programData:getByte(30)
        tableTone4[31] = programData:getByte(31)
        tableTone4[32] = programData:getByte(32)
        tableTone4[33] = programData:getByte(33)
        tableTone4[34] = programData:getByte(34)
        tableTone4[35] = programData:getByte(35)
        tableTone4[36] = programData:getByte(36)
        tableTone4[37] = programData:getByte(37)
        tableTone4[38] = programData:getByte(38)
        tableTone4[39] = programData:getByte(39)
        tableTone4[40] = programData:getByte(40)
        tableTone4[41] = programData:getByte(41)
        tableTone4[42] = programData:getByte(42)
        tableTone4[43] = programData:getByte(43)
        tableTone4[44] = programData:getByte(44)
        tableTone4[45] = programData:getByte(45)
        tableTone4[46] = programData:getByte(46)
        tableTone4[47] = programData:getByte(47)
        tableTone4[48] = programData:getByte(48)
        tableTone4[49] = programData:getByte(49)
        tableTone4[50] = programData:getByte(50)
        tableTone4[51] = programData:getByte(51)
        tableTone4[52] = programData:getByte(52)
        tableTone4[53] = programData:getByte(53)
        tableTone4[54] = programData:getByte(54)
        tableTone4[55] = programData:getByte(55)
        tableTone4[56] = programData:getByte(56)
        tableTone4[57] = programData:getByte(57)
        tableTone4[58] = programData:getByte(58)
        tableTone4[59] = programData:getByte(59)
        tableTone4[60] = programData:getByte(60)
        tableTone4[61] = programData:getByte(61)
        tableTone4[62] = programData:getByte(62)
        tableTone4[63] = programData:getByte(63)
        tableTone4[64] = programData:getByte(64)
        tableTone4[65] = programData:getByte(65)
        tableTone4[66] = programData:getByte(66)
        tableTone4[67] = programData:getByte(67)
        tableTone4[68] = programData:getByte(68)
        tableTone4[69] = programData:getByte(69)
        tableTone4[70] = programData:getByte(70)
        tableTone4[71] = programData:getByte(71)
        tableTone4[72] = programData:getByte(72)
        tableTone4[73] = programData:getByte(73)
        tableTone4[74] = programData:getByte(74)
        tableTone4[75] = programData:getByte(75)
        tableTone4[76] = programData:getByte(76)
        tableTone4[77] = programData:getByte(77)
        tableTone4[78] = programData:getByte(78)
        tableTone4[79] = programData:getByte(79)
        tableTone4[80] = programData:getByte(80)
        tableTone4[81] = programData:getByte(81)
        tableTone4[82] = programData:getByte(82)
        tableTone4[83] = programData:getByte(83)
        tableTone4[84] = programData:getByte(84)
        tableTone4[85] = programData:getByte(85)
        tableTone4[86] = programData:getByte(86)
        tableTone4[87] = programData:getByte(87)
        tableTone4[88] = programData:getByte(88)
        tableTone4[89] = programData:getByte(89)
        tableTone4[90] = programData:getByte(90)
        tableTone4[91] = programData:getByte(91)
        tableTone4[92] = programData:getByte(92)
        tableTone4[93] = programData:getByte(93)
        tableTone4[94] = programData:getByte(94)
        tableTone4[95] = programData:getByte(95)
        tableTone4[96] = programData:getByte(96)
        tableTone4[97] = programData:getByte(97)
        tableTone4[98] = programData:getByte(98)
        tableTone4[99] = programData:getByte(99)
        tableTone4[100] = programData:getByte(100)
        tableTone4[101] = programData:getByte(101)
        tableTone4[102] = programData:getByte(102)
        tableTone4[103] = programData:getByte(103)
        tableTone4[104] = programData:getByte(104)
        tableTone4[105] = programData:getByte(105)
        tableTone4[106] = programData:getByte(106)
        tableTone4[107] = programData:getByte(107)
        tableTone4[108] = programData:getByte(108)
        tableTone4[109] = programData:getByte(109)
        tableTone4[110] = programData:getByte(110)
        tableTone4[111] = programData:getByte(111)
        tableTone4[112] = programData:getByte(112)
        tableTone4[113] = programData:getByte(113)
        tableTone4[114] = programData:getByte(114)
        tableTone4[115] = programData:getByte(115)
        tableTone4[116] = programData:getByte(116)
        tableTone4[117] = programData:getByte(117)
        tableTone4[118] = programData:getByte(118)
        tableTone4[119] = programData:getByte(119)
        tableTone4[120] = programData:getByte(120)
        tableTone4[121] = programData:getByte(121)
        tableTone4[122] = programData:getByte(122)
        tableTone4[123] = programData:getByte(123)
        tableTone4[124] = programData:getByte(124)
        
    
        panel:getModulatorByName("T4-WAVEGROUP"):setValueMapped(programData:getByte(8), false)
        
        
        -- This filter is to combine 2 bytes that contais the "Wave Number" data abd set the Internal Wave combo modulator    
      
                FilterMsb = programData:getByte(9)
                FilterLsb = programData:getByte(10)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
    
        panel:getModulatorByName("T4-WAVE-INT"):setModulatorValue(FilterValue, false,false,false)
    
    
        panel:getModulatorByName("T4-SWITCH"):setValueMapped(programData:getByte(11), false)
        
        panel:getModulatorByName("T4-FXM-SW"):setValueMapped(programData:getByte(12), false)
        panel:getModulatorByName("T4-FXM-DEPTH"):setModulatorValue(programData:getByte(13)+1, false, false, false)
        
        panel:getModulatorByName("T4-VELOCITY-LOWER"):setModulatorValue(programData:getByte(14), false, false, false)
        panel:getModulatorByName("T4-VELOCITY-UPPER"):setModulatorValue(programData:getByte(15), false, false, false)
        
        panel:getModulatorByName("T4-VOL-SW"):setValueMapped(programData:getByte(16), false)
        panel:getModulatorByName("T4-HOLD-SW"):setValueMapped(programData:getByte(17), false)
        
        panel:getModulatorByName("T4-MOD-MOD1-DESTINY"):setValueMapped(programData:getByte(18), false)
        panel:getModulatorByName("T4-MOD-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(19)-64, false, false, false)
        panel:getModulatorByName("T4-MOD-MOD2-DESTINY"):setValueMapped(programData:getByte(20), false)
        panel:getModulatorByName("T4-MOD-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(21)-64, false, false, false)
        panel:getModulatorByName("T4-MOD-MOD3-DESTINY"):setValueMapped(programData:getByte(22), false)
        panel:getModulatorByName("T4-MOD-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(23)-64, false, false, false)
        panel:getModulatorByName("T4-MOD-MOD4-DESTINY"):setValueMapped(programData:getByte(24), false)
        panel:getModulatorByName("T4-MOD-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(25)-64, false, false, false)
        
        panel:getModulatorByName("T4-AFT-MOD1-DESTINY"):setValueMapped(programData:getByte(26), false)
        panel:getModulatorByName("T4-AFT-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(27)-64, false, false, false)
        panel:getModulatorByName("T4-AFT-MOD2-DESTINY"):setValueMapped(programData:getByte(28), false)
        panel:getModulatorByName("T4-AFT-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(29)-64, false, false, false)
        panel:getModulatorByName("T4-AFT-MOD3-DESTINY"):setValueMapped(programData:getByte(30), false)
        panel:getModulatorByName("T4-AFT-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(31)-64, false, false, false)
        panel:getModulatorByName("T4-AFT-MOD4-DESTINY"):setValueMapped(programData:getByte(32), false)
        panel:getModulatorByName("T4-AFT-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(33)-64, false, false, false)
        
        panel:getModulatorByName("T4-EXP-MOD1-DESTINY"):setValueMapped(programData:getByte(34), false)
        panel:getModulatorByName("T4-EXP-MOD1-SENSITIVITY"):setModulatorValue(programData:getByte(35)-64, false, false, false)
        panel:getModulatorByName("T4-EXP-MOD2-DESTINY"):setValueMapped(programData:getByte(36), false)
        panel:getModulatorByName("T4-EXP-MOD2-SENSITIVITY"):setModulatorValue(programData:getByte(37)-64, false, false, false)
        panel:getModulatorByName("T4-EXP-MOD3-DESTINY"):setValueMapped(programData:getByte(38), false)
        panel:getModulatorByName("T4-EXP-MOD3-SENSITIVITY"):setModulatorValue(programData:getByte(39)-64, false, false, false)
        panel:getModulatorByName("T4-EXP-MOD4-DESTINY"):setValueMapped(programData:getByte(40), false)
        panel:getModulatorByName("T4-EXP-MOD4-SENSITIVITY"):setModulatorValue(programData:getByte(41)-64, false, false, false)
        
        panel:getModulatorByName("T4-LFO1-WAVEFORM"):setValueMapped(programData:getByte(42), false)
        panel:getModulatorByName("T4-LFO1-OFFSET"):setValueMapped(programData:getByte(43), false)
        panel:getModulatorByName("T4-LFO1-SYNCRO-SW"):setValueMapped(programData:getByte(44), false)
        panel:getModulatorByName("T4-LFO1-RATE"):setModulatorValue(programData:getByte(45), false, false, false)
            
        
        -- This filter is to combine 2 bytes that contais a "LFO-1 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(46)
                FilterLsb = programData:getByte(47)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T4-LFO1-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T4-LFO1-FADETYPE-SW"):setValueMapped(programData:getByte(48), false)
        panel:getModulatorByName("T4-LFO1-FADETIME"):setModulatorValue(programData:getByte(49), false, false, false)
        panel:getModulatorByName("T4-LFO1-PITCHDEPTH"):setModulatorValue(programData:getByte(50)-64, false, false, false)
        panel:getModulatorByName("T4-LFO1-TVFDEPTH"):setModulatorValue(programData:getByte(51)-64, false, false, false)
        panel:getModulatorByName("T4-LFO1-TVADEPTH"):setModulatorValue(programData:getByte(52)-64, false, false, false)
        
        panel:getModulatorByName("T4-LFO2-WAVEFORM"):setValueMapped(programData:getByte(53), false)
        panel:getModulatorByName("T4-LFO2-OFFSET"):setValueMapped(programData:getByte(54), false)
        panel:getModulatorByName("T4-LFO2-SYNCRO-SW"):setValueMapped(programData:getByte(55), false)
        panel:getModulatorByName("T4-LFO2-RATE"):setModulatorValue(programData:getByte(56), false, false, false)
        
        
        -- This filter is to combine 2 bytes that contais a "LFO-2 Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(57)
                FilterLsb = programData:getByte(58)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T4-LFO2-DELAY"):setModulatorValue(FilterValue, false, false, false)
                                
        
        panel:getModulatorByName("T4-LFO2-FADETYPE-SW"):setValueMapped(programData:getByte(59), false)
        panel:getModulatorByName("T4-LFO2-FADETIME"):setModulatorValue(programData:getByte(60), false, false, false)
        panel:getModulatorByName("T4-LFO2-PITCHDEPTH"):setModulatorValue(programData:getByte(61)-64, false, false, false)
        panel:getModulatorByName("T4-LFO2-TVFDEPTH"):setModulatorValue(programData:getByte(62)-64, false, false, false)
        panel:getModulatorByName("T4-LFO2-TVADEPTH"):setModulatorValue(programData:getByte(63)-64, false, false, false)
    
        panel:getModulatorByName("T4-PITCH-PITCHCOARSE"):setModulatorValue(programData:getByte(64)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-FINEPITCH"):setModulatorValue(programData:getByte(65)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-RANDOMPITCH"):setValueMapped(programData:getByte(66), false)
        panel:getModulatorByName("T4-PITCH-KFPITCH"):setValueMapped(programData:getByte(67), false)
        panel:getModulatorByName("T4-PITCH-VELOCITYLEVEL"):setModulatorValue(programData:getByte(68)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-T1VELOCITY"):setValueMapped(programData:getByte(69), false)
        panel:getModulatorByName("T4-PITCH-T4VELOCITY"):setValueMapped(programData:getByte(70), false)
        panel:getModulatorByName("T4-PITCH-KFTIME"):setValueMapped(programData:getByte(71), false)
        panel:getModulatorByName("T4-PITCH-ENVDEPTH"):setModulatorValue(programData:getByte(72)-64, false, false, false)
    
        panel:getModulatorByName("T4-PITCH-ENV-T1"):setModulatorValue(programData:getByte(73), false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-L1"):setModulatorValue(programData:getByte(74)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-T2"):setModulatorValue(programData:getByte(75), false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-L2"):setModulatorValue(programData:getByte(76)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-T3"):setModulatorValue(programData:getByte(77), false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-L3"):setModulatorValue(programData:getByte(78)-64, false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-T4"):setModulatorValue(programData:getByte(79), false, false, false)
        panel:getModulatorByName("T4-PITCH-ENV-L4"):setModulatorValue(programData:getByte(80)-64, false, false, false)
    
        panel:getModulatorByName("T4-TVF-FILTERMODE"):setValueMapped(programData:getByte(81), false)
        panel:getModulatorByName("T4-TVF-CUTOFFFREQ"):setModulatorValue(programData:getByte(82), false, false, false)
        panel:getModulatorByName("T4-TVF-RESONANCE"):setModulatorValue(programData:getByte(83), false, false, false)
        panel:getModulatorByName("T4-TVF-RESONANCETYPE"):setValueMapped(programData:getByte(84), false)
        panel:getModulatorByName("T4-TVF-KFCUTOFF"):setValueMapped(programData:getByte(85), false)
        panel:getModulatorByName("T4-TVF-VELOCITYCURVE"):setValueMapped(programData:getByte(86), false)
        panel:getModulatorByName("T4-TVF-ENVVELOCITY"):setModulatorValue(programData:getByte(87)-64, false, false, false)
        panel:getModulatorByName("T4-TVF-T1VELOCITY"):setValueMapped(programData:getByte(88), false)
        panel:getModulatorByName("T4-TVF-T4VELOCITY"):setValueMapped(programData:getByte(89), false)
        panel:getModulatorByName("T4-TVF-KFTIME"):setValueMapped(programData:getByte(90), false)
        panel:getModulatorByName("T4-TVF-ENVDEPTH"):setModulatorValue(programData:getByte(91)-64, false, false, false)
    
        panel:getModulatorByName("T4-TVF-ENV-T1"):setModulatorValue(programData:getByte(92), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-L1"):setModulatorValue(programData:getByte(93), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-T2"):setModulatorValue(programData:getByte(94), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-L2"):setModulatorValue(programData:getByte(95), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-T3"):setModulatorValue(programData:getByte(96), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-L3"):setModulatorValue(programData:getByte(97), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-T4"):setModulatorValue(programData:getByte(98), false, false, false)
        panel:getModulatorByName("T4-TVF-ENV-L4"):setModulatorValue(programData:getByte(99), false, false, false)
             
        panel:getModulatorByName("T4-LEVEL"):setModulatorValue(programData:getByte(100), false, false, false)
        
        panel:getModulatorByName("T4-TVA-KFLEVEL"):setValueMapped(programData:getByte(101), false)
        
        
        -- This filter is to combine 2 bytes that contais a "Pan" data and set slide modulator
    
                FilterMsb = programData:getByte(102)
                FilterLsb = programData:getByte(103)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)-64  
    
        panel:getModulatorByName("T4-PAN"):setModulatorValue(FilterValue, false, false, false)
    
        
        panel:getModulatorByName("T4-TVA-KFPAN"):setValueMapped(programData:getByte(104), false)
        panel:getModulatorByName("T4-TVA-TONEDELAY"):setValueMapped(programData:getByte(105), false)
    
        
        -- This filter is to combine 2 bytes that contais a "Tone Delay Time" data and set the slide modulator
    
                FilterMsb = programData:getByte(106)
                FilterLsb = programData:getByte(107)
    
                FilterValue = (FilterMsb*16)+(FilterLsb)  
    
        panel:getModulatorByName("T4-TVA-DELAYTIME"):setModulatorValue(FilterValue, false, false, false)
            
        
        panel:getModulatorByName("T4-TVA-VELOCITYCURVE"):setValueMapped(programData:getByte(108), false)
        panel:getModulatorByName("T4-TVA-VELOCITYLEVEL"):setModulatorValue(programData:getByte(109)-64, false, false, false)
        panel:getModulatorByName("T4-TVA-T1VELOCITY"):setValueMapped(programData:getByte(110), false)
        panel:getModulatorByName("T4-TVA-T4VELOCITY"):setValueMapped(programData:getByte(111), false)
        panel:getModulatorByName("T4-TVA-KFTIME"):setValueMapped(programData:getByte(112), false)
        
        panel:getModulatorByName("T4-TVA-ENV-T1"):setModulatorValue(programData:getByte(113), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-L1"):setModulatorValue(programData:getByte(114), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-T2"):setModulatorValue(programData:getByte(115), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-L2"):setModulatorValue(programData:getByte(116), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-T3"):setModulatorValue(programData:getByte(117), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-L3"):setModulatorValue(programData:getByte(118), false, false, false)
        panel:getModulatorByName("T4-TVA-ENV-T4"):setModulatorValue(programData:getByte(119), false, false, false)
        
        panel:getModulatorByName("T4-DRY"):setModulatorValue(programData:getByte(120), false, false, false)
        panel:getModulatorByName("T4-REVERB"):setModulatorValue(programData:getByte(121), false, false, false)
        panel:getModulatorByName("T4-CHORUS"):setModulatorValue(programData:getByte(122), false, false, false)
        panel:getModulatorByName("T4-BUS"):setValueMapped(programData:getByte(123), false)
            
    
        end
    
    
    end