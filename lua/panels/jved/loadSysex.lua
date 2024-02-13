--
-- Called when a mouse is down on this component to load a sysex file from computer
--

loadSysex = function()

				
    local x=utils.questionWindow("Load Patch?", "The patch will be loaded from computer", "Yes", "No")
    
    if x==true then


        local f = utils.openFileWindow("Open file", File.getSpecialLocation(File.userDesktopDirectory), "*.syx", true)
        fileRead = File(f)

        local 	t={}

        t1={} -- these are your 5 global
        t2={} -- sysex tables
        t3={}
        t4={}
        t5={}

        

        local mergeBack={t1,t2,t3,t4,t5}

        local buf	= MemoryBlock()
        
        fileRead:loadFileAsData(buf)
        buf:toLuaTable (t)
        sizeOfUpload=buf:getSize()
        
        --console(String(table.concat(t)))

        j=1

        message=1

        for _,v in ipairs(t) do

            if message <=5 then -- Test the number of midi messages
            
                table.insert(mergeBack[j],v)
                                
                if v == 247 then
                
                    j=j+1

                    message=message+1

                end
        
            end
        
        end


        -- Send to synth the patch readed from file .sys

        
        -- Common Data

        mySysex = CtrlrMidiMessage({t1[0], t1[1], t1[2], t1[3], t1[4], t1[5], t1[6], t1[7], t1[8], t1[9], t1[10], t1[11], t1[12], t1[13], t1[14], t1[15], t1[16], t1[17], t1[18], t1[19], t1[20], t1[21], t1[22], t1[23], t1[24], t1[25], t1[26], t1[27], t1[28], t1[29], t1[30], t1[31], t1[32], t1[33], t1[34], t1[35], t1[36], t1[37], t1[38], t1[39], t1[40], t1[41], t1[42], t1[43], t1[44], 0xF7})

        panel:sendMidiMessageNow(mySysex)
        
        -- T1 to T4 Data

        mySysex = CtrlrMidiMessage({t2[0], t2[1], t2[2], t2[3], t2[4], t2[5], t2[6], t2[7], t2[8], t2[9], t2[10], t2[11], t2[12], t2[13], t2[14], t2[15], t2[16], t2[17], t2[18], t2[19], t2[20], t2[21], t2[22], t2[23], t2[24], t2[25], t2[26], t2[27], t2[28], t2[29], t2[30], t2[31], t2[32], t2[33], t2[34], t2[35], t2[36], t2[37], t2[38], t2[39], t2[40], t2[41], t2[42], t2[43], t2[44], t2[45], t2[46], t2[47], t2[48], t2[49], t2[50], t2[51], t2[52], t2[53], t2[54], t2[55], t2[56], t2[57], t2[58], t2[59], t2[60], t2[61], t2[62], t2[63], t2[64], t2[65], t2[66], t2[67], t2[68], t2[69], t2[70], t2[71], t2[72], t2[73], t2[74], t2[75], t2[76], t2[77], t2[78], t2[79], t2[80], t2[81], t2[82], t2[83], t2[84], t2[85], t2[86], t2[87], t2[88], t2[89], t2[90], t2[91], t2[92], t2[93], t2[94], t2[95], t2[96], t2[97], t2[98], t2[99], t2[100], t2[101], t2[102], t2[103], t2[104], t2[105], t2[106], t2[107], t2[108], t2[109], t2[110], t2[111], t2[112], t2[113], t2[114], t2[115], t2[116], t2[117], t2[118], t2[119], t2[120], t2[121], t2[122], t2[123], t2[124], t2[125], t2[126], 0xF7})

        panel:sendMidiMessageNow(mySysex)


        mySysex = CtrlrMidiMessage({t3[0], t3[1], t3[2], t3[3], t3[4], t3[5], t3[6], t3[7], t3[8], t3[9], t3[10], t3[11], t3[12], t3[13], t3[14], t3[15], t3[16], t3[17], t3[18], t3[19], t3[20], t3[21], t3[22], t3[23], t3[24], t3[25], t3[26], t3[27], t3[28], t3[29], t3[30], t3[31], t3[32], t3[33], t3[34], t3[35], t3[36], t3[37], t3[38], t3[39], t3[40], t3[41], t3[42], t3[43], t3[44], t3[45], t3[46], t3[47], t3[48], t3[49], t3[50], t3[51], t3[52], t3[53], t3[54], t3[55], t3[56], t3[57], t3[58], t3[59], t3[60], t3[61], t3[62], t3[63], t3[64], t3[65], t3[66], t3[67], t3[68], t3[69], t3[70], t3[71], t3[72], t3[73], t3[74], t3[75], t3[76], t3[77], t3[78], t3[79], t3[80], t3[81], t3[82], t3[83], t3[84], t3[85], t3[86], t3[87], t3[88], t3[89], t3[90], t3[91], t3[92], t3[93], t3[94], t3[95], t3[96], t3[97], t3[98], t3[99], t3[100], t3[101], t3[102], t3[103], t3[104], t3[105], t3[106], t3[107], t3[108], t3[109], t3[110], t3[111], t3[112], t3[113], t3[114], t3[115], t3[116], t3[117], t3[118], t3[119], t3[120], t3[121], t3[122], t3[123], t3[124], t3[125], t3[126], 0xF7})

        panel:sendMidiMessageNow(mySysex)


        mySysex = CtrlrMidiMessage({t4[0], t4[1], t4[2], t4[3], t4[4], t4[5], t4[6], t4[7], t4[8], t4[9], t4[10], t4[11], t4[12], t4[13], t4[14], t4[15], t4[16], t4[17], t4[18], t4[19], t4[20], t4[21], t4[22], t4[23], t4[24], t4[25], t4[26], t4[27], t4[28], t4[29], t4[30], t4[31], t4[32], t4[33], t4[34], t4[35], t4[36], t4[37], t4[38], t4[39], t4[40], t4[41], t4[42], t4[43], t4[44], t4[45], t4[46], t4[47], t4[48], t4[49], t4[50], t4[51], t4[52], t4[53], t4[54], t4[55], t4[56], t4[57], t4[58], t4[59], t4[60], t4[61], t4[62], t4[63], t4[64], t4[65], t4[66], t4[67], t4[68], t4[69], t4[70], t4[71], t4[72], t4[73], t4[74], t4[75], t4[76], t4[77], t4[78], t4[79], t4[80], t4[81], t4[82], t4[83], t4[84], t4[85], t4[86], t4[87], t4[88], t4[89], t4[90], t4[91], t4[92], t4[93], t4[94], t4[95], t4[96], t4[97], t4[98], t4[99], t4[100], t4[101], t4[102], t4[103], t4[104], t4[105], t4[106], t4[107], t4[108], t4[109], t4[110], t4[111], t4[112], t4[113], t4[114], t4[115], t4[116], t4[117], t4[118], t4[119], t4[120], t4[121], t4[122], t4[123], t4[124], t4[125], t4[126], 0xF7})

        panel:sendMidiMessageNow(mySysex)


        mySysex = CtrlrMidiMessage({t5[0], t5[1], t5[2], t5[3], t5[4], t5[5], t5[6], t5[7], t5[8], t5[9], t5[10], t5[11], t5[12], t5[13], t5[14], t5[15], t5[16], t5[17], t5[18], t5[19], t5[20], t5[21], t5[22], t5[23], t5[24], t5[25], t5[26], t5[27], t5[28], t5[29], t5[30], t5[31], t5[32], t5[33], t5[34], t5[35], t5[36], t5[37], t5[38], t5[39], t5[40], t5[41], t5[42], t5[43], t5[44], t5[45], t5[46], t5[47], t5[48], t5[49], t5[50], t5[51], t5[52], t5[53], t5[54], t5[55], t5[56], t5[57], t5[58], t5[59], t5[60], t5[61], t5[62], t5[63], t5[64], t5[65], t5[66], t5[67], t5[68], t5[69], t5[70], t5[71], t5[72], t5[73], t5[74], t5[75], t5[76], t5[77], t5[78], t5[79], t5[80], t5[81], t5[82], t5[83], t5[84], t5[85], t5[86], t5[87], t5[88], t5[89], t5[90], t5[91], t5[92], t5[93], t5[94], t5[95], t5[96], t5[97], t5[98], t5[99], t5[100], t5[101], t5[102], t5[103], t5[104], t5[105], t5[106], t5[107], t5[108], t5[109], t5[110], t5[111], t5[112], t5[113], t5[114], t5[115], t5[116], t5[117], t5[118], t5[119], t5[120], t5[121], t5[122], t5[123], t5[124], t5[125], t5[126], 0xF7})

        panel:sendMidiMessageNow(mySysex)

                        
        -- Refresh data on panel
    
        mySysex = CtrlrMidiMessage({0xF0, 0x41, 0x10, 0x46, 0x11, 0x00, 0x08, 0x20, 0x00, 0x00, 0x01, 0x0F, 0x02, 0x46, 0xF7})

        panel:sendMidiMessageNow(mySysex)
                        

        for i,v in ipairs(mergeBack) do
            console(String("[t"..i.."] ={"..table.concat(v,",").."}"))
        end								
         

    end


    if x==false then

        return

    end
    

end