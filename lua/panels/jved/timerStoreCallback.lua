
--### This function store a patch on JV-880  on user defined postion ###



function timerStoreCallback(timerId)

        
    
	if timerId == 1 then
        
				
		-- ### This functions store a patch on PCM Card, Internal Memory or Computer ###


		storeDef = panel:getModulatorByName("STORE-PLACE"):getValue()
		
			
		--Define by user a place to store a patch

		
		if storeDef==0 then  -- Store Internal

			storePlace = panel:getModulatorByName("STORE-PLACE"):getValue()+0x01 --define a place to store, Internal
		
		end

		
		if storeDef==1 then -- Store on Data Card

			storePlace = panel:getModulatorByName("STORE-PLACE"):getValue()+0x01 --define a place to store, Data Card
		
		end


		if storeDef==2 then -- Store on Computer

			timer:stopTimer(timerId)
					
			
			local t={}

			t1={0xF0, tableCommon[0], tableCommon[1], tableCommon[2], tableCommon[3], tableCommon[4], tableCommon[5], tableCommon[6], tableCommon[7], tableCommon[8], tableCommon[9], tableCommon[10], tableCommon[11], tableCommon[12], tableCommon[13], tableCommon[14], tableCommon[15], tableCommon[16], tableCommon[17], tableCommon[18], tableCommon[19], tableCommon[20], tableCommon[21], tableCommon[22], tableCommon[23], tableCommon[24], tableCommon[25], tableCommon[26], tableCommon[27], tableCommon[28], tableCommon[29], tableCommon[30], tableCommon[31], tableCommon[32], tableCommon[33], tableCommon[34], tableCommon[35], tableCommon[36], tableCommon[37], tableCommon[38], tableCommon[39], tableCommon[40], tableCommon[41], tableCommon[42], 0xF7} -- these are your 5 global
			t2={0xF0, tableTone1[0], tableTone1[1], tableTone1[2], tableTone1[3], tableTone1[4], tableTone1[5], tableTone1[6], tableTone1[7], tableTone1[8], tableTone1[9], tableTone1[10], tableTone1[11], tableTone1[12], tableTone1[13], tableTone1[14], tableTone1[15], tableTone1[16], tableTone1[17], tableTone1[18], tableTone1[19], tableTone1[20], tableTone1[21], tableTone1[22], tableTone1[23], tableTone1[24], tableTone1[25], tableTone1[26], tableTone1[27], tableTone1[28], tableTone1[29], tableTone1[30], tableTone1[31], tableTone1[32], tableTone1[33], tableTone1[34], tableTone1[35], tableTone1[36], tableTone1[37], tableTone1[38], tableTone1[39], tableTone1[40], tableTone1[41], tableTone1[42], tableTone1[43], tableTone1[44], tableTone1[45], tableTone1[46], tableTone1[47], tableTone1[48], tableTone1[49], tableTone1[50], tableTone1[51], tableTone1[52], tableTone1[53], tableTone1[54], tableTone1[55], tableTone1[56], tableTone1[57], tableTone1[58], tableTone1[59], tableTone1[60], tableTone1[61], tableTone1[62], tableTone1[63], tableTone1[64], tableTone1[65], tableTone1[66], tableTone1[67], tableTone1[68], tableTone1[69], tableTone1[70], tableTone1[71], tableTone1[72], tableTone1[73], tableTone1[74], tableTone1[75], tableTone1[76], tableTone1[77], tableTone1[78], tableTone1[79], tableTone1[80], tableTone1[81], tableTone1[82], tableTone1[83], tableTone1[84], tableTone1[85], tableTone1[86], tableTone1[87], tableTone1[88], tableTone1[89], tableTone1[90], tableTone1[91], tableTone1[92], tableTone1[93], tableTone1[94], tableTone1[95], tableTone1[96], tableTone1[97], tableTone1[98], tableTone1[99], tableTone1[100], tableTone1[101], tableTone1[102], tableTone1[103], tableTone1[104], tableTone1[105], tableTone1[106], tableTone1[107], tableTone1[108], tableTone1[109], tableTone1[110], tableTone1[111], tableTone1[112], tableTone1[113], tableTone1[114], tableTone1[115], tableTone1[116], tableTone1[117], tableTone1[118], tableTone1[119], tableTone1[120], tableTone1[121], tableTone1[122], tableTone1[123], tableTone1[124], 0xF7} -- sysex tables
			t3={0xF0, tableTone2[0], tableTone2[1], tableTone2[2], tableTone2[3], tableTone1[4], tableTone2[5], tableTone2[6], tableTone2[7], tableTone2[8], tableTone2[9], tableTone2[10], tableTone2[11], tableTone2[12], tableTone2[13], tableTone2[14], tableTone2[15], tableTone2[16], tableTone2[17], tableTone2[18], tableTone2[19], tableTone2[20], tableTone2[21], tableTone2[22], tableTone2[23], tableTone2[24], tableTone2[25], tableTone2[26], tableTone2[27], tableTone2[28], tableTone2[29], tableTone2[30], tableTone2[31], tableTone2[32], tableTone2[33], tableTone2[34], tableTone2[35], tableTone2[36], tableTone2[37], tableTone2[38], tableTone2[39], tableTone2[40], tableTone2[41], tableTone2[42], tableTone2[43], tableTone2[44], tableTone2[45], tableTone2[46], tableTone2[47], tableTone2[48], tableTone2[49], tableTone2[50], tableTone2[51], tableTone2[52], tableTone2[53], tableTone2[54], tableTone2[55], tableTone2[56], tableTone2[57], tableTone2[58], tableTone2[59], tableTone2[60], tableTone2[61], tableTone2[62], tableTone2[63], tableTone2[64], tableTone2[65], tableTone2[66], tableTone2[67], tableTone2[68], tableTone2[69], tableTone2[70], tableTone2[71], tableTone2[72], tableTone2[73], tableTone2[74], tableTone2[75], tableTone2[76], tableTone2[77], tableTone2[78], tableTone2[79], tableTone2[80], tableTone2[81], tableTone2[82], tableTone2[83], tableTone2[84], tableTone2[85], tableTone2[86], tableTone2[87], tableTone2[88], tableTone2[89], tableTone2[90], tableTone2[91], tableTone2[92], tableTone2[93], tableTone2[94], tableTone2[95], tableTone2[96], tableTone2[97], tableTone2[98], tableTone2[99], tableTone2[100], tableTone2[101], tableTone2[102], tableTone2[103], tableTone2[104], tableTone2[105], tableTone2[106], tableTone2[107], tableTone2[108], tableTone2[109], tableTone2[110], tableTone2[111], tableTone2[112], tableTone2[113], tableTone2[114], tableTone2[115], tableTone2[116], tableTone2[117], tableTone2[118], tableTone2[119], tableTone2[120], tableTone2[121], tableTone2[122], tableTone2[123], tableTone2[124], 0xF7}
			t4={0xF0, tableTone3[0], tableTone3[1], tableTone3[2], tableTone3[3], tableTone1[4], tableTone3[5], tableTone3[6], tableTone3[7], tableTone3[8], tableTone3[9], tableTone3[10], tableTone3[11], tableTone3[12], tableTone3[13], tableTone3[14], tableTone3[15], tableTone3[16], tableTone3[17], tableTone3[18], tableTone3[19], tableTone3[20], tableTone3[21], tableTone3[22], tableTone3[23], tableTone3[24], tableTone3[25], tableTone3[26], tableTone3[27], tableTone3[28], tableTone3[29], tableTone3[30], tableTone3[31], tableTone3[32], tableTone3[33], tableTone3[34], tableTone3[35], tableTone3[36], tableTone3[37], tableTone3[38], tableTone3[39], tableTone3[40], tableTone3[41], tableTone3[42], tableTone3[43], tableTone3[44], tableTone3[45], tableTone3[46], tableTone3[47], tableTone3[48], tableTone3[49], tableTone3[50], tableTone3[51], tableTone3[52], tableTone3[53], tableTone3[54], tableTone3[55], tableTone3[56], tableTone3[57], tableTone3[58], tableTone3[59], tableTone3[60], tableTone3[61], tableTone3[62], tableTone3[63], tableTone3[64], tableTone3[65], tableTone3[66], tableTone3[67], tableTone3[68], tableTone3[69], tableTone3[70], tableTone3[71], tableTone3[72], tableTone3[73], tableTone3[74], tableTone3[75], tableTone3[76], tableTone3[77], tableTone3[78], tableTone3[79], tableTone3[80], tableTone3[81], tableTone3[82], tableTone3[83], tableTone3[84], tableTone3[85], tableTone3[86], tableTone3[87], tableTone3[88], tableTone3[89], tableTone3[90], tableTone3[91], tableTone3[92], tableTone3[93], tableTone3[94], tableTone3[95], tableTone3[96], tableTone3[97], tableTone3[98], tableTone3[99], tableTone3[100], tableTone3[101], tableTone3[102], tableTone3[103], tableTone3[104], tableTone3[105], tableTone3[106], tableTone3[107], tableTone3[108], tableTone3[109], tableTone3[110], tableTone3[111], tableTone3[112], tableTone3[113], tableTone3[114], tableTone3[115], tableTone3[116], tableTone3[117], tableTone3[118], tableTone3[119], tableTone3[120], tableTone3[121], tableTone3[122], tableTone3[123], tableTone3[124], 0xF7}
			t5={0xF0, tableTone4[0], tableTone4[1], tableTone4[2], tableTone4[3], tableTone1[4], tableTone4[5], tableTone4[6], tableTone4[7], tableTone4[8], tableTone4[9], tableTone4[10], tableTone4[11], tableTone4[12], tableTone4[13], tableTone4[14], tableTone4[15], tableTone4[16], tableTone4[17], tableTone4[18], tableTone4[19], tableTone4[20], tableTone4[21], tableTone4[22], tableTone4[23], tableTone4[24], tableTone4[25], tableTone4[26], tableTone4[27], tableTone4[28], tableTone4[29], tableTone4[30], tableTone4[31], tableTone4[32], tableTone4[33], tableTone4[34], tableTone4[35], tableTone4[36], tableTone4[37], tableTone4[38], tableTone4[39], tableTone4[40], tableTone4[41], tableTone4[42], tableTone4[43], tableTone4[44], tableTone4[45], tableTone4[46], tableTone4[47], tableTone4[48], tableTone4[49], tableTone4[50], tableTone4[51], tableTone4[52], tableTone4[53], tableTone4[54], tableTone4[55], tableTone4[56], tableTone4[57], tableTone4[58], tableTone4[59], tableTone4[60], tableTone4[61], tableTone4[62], tableTone4[63], tableTone4[64], tableTone4[65], tableTone4[66], tableTone4[67], tableTone4[68], tableTone4[69], tableTone4[70], tableTone4[71], tableTone4[72], tableTone4[73], tableTone4[74], tableTone4[75], tableTone4[76], tableTone4[77], tableTone4[78], tableTone4[79], tableTone4[80], tableTone4[81], tableTone4[82], tableTone4[83], tableTone4[84], tableTone4[85], tableTone4[86], tableTone4[87], tableTone4[88], tableTone4[89], tableTone4[90], tableTone4[91], tableTone4[92], tableTone4[93], tableTone4[94], tableTone4[95], tableTone4[96], tableTone4[97], tableTone4[98], tableTone4[99], tableTone4[100], tableTone4[101], tableTone4[102], tableTone4[103], tableTone4[104], tableTone4[105], tableTone4[106], tableTone4[107], tableTone4[108], tableTone4[109], tableTone4[110], tableTone4[111], tableTone4[112], tableTone4[113], tableTone4[114], tableTone4[115], tableTone4[116], tableTone4[117], tableTone4[118], tableTone4[119], tableTone4[120], tableTone4[121], tableTone4[122], tableTone4[123], tableTone4[124], 0xF7}

			local mergeTable={t1,t2,t3,t4,t5}

			for _,v in ipairs (mergeTable) do
						
				for _,val in ipairs (v) do
					table.insert(t,val)
				end -- inner loop

			end

			--console(String(table.concat(t,',')))

			local dataToSave=MemoryBlock.fromLuaTable(t)

			--console(String(dataToSave:toHexString(1)))

   				file = utils.saveFileWindow ("Save file",File.getSpecialLocation(File.userDesktopDirectory), "*.syx", true)
    			
			if file:hasWriteAccess() then
		
      			file:replaceWithData(dataToSave)

			end
		
		end				
		

		
		if storeDef~=2 then -- Internal Memory or Data Card


			storePatch = panel:getModulatorByName("STORE-PATCH"):getValue()+0x40 --define a user place to store a patch
		

			--Calculate Checksums of Common, T1, T2, T3, T4
		

		
			--### Checksum of Common Data ###

		
			checkSumCmn = {storePlace, storePatch, tableCommon[6], tableCommon[7], tableCommon[8], tableCommon[9], tableCommon[10], tableCommon[11], tableCommon[12], tableCommon[13], tableCommon[14], tableCommon[15], tableCommon[16], tableCommon[17], tableCommon[18], tableCommon[19], tableCommon[20], tableCommon[21], tableCommon[22], tableCommon[23], tableCommon[24], tableCommon[25], tableCommon[26], tableCommon[27], tableCommon[28], tableCommon[29], tableCommon[30], tableCommon[31], tableCommon[32], tableCommon[33], tableCommon[34], tableCommon[35], tableCommon[36], tableCommon[37], tableCommon[38], tableCommon[39], tableCommon[40], tableCommon[41]} -- returns the checksum of all data values

		
			local total=0
    		local result=0
    	
								
					for i,v in ipairs(checkSumCmn) do
        
						total=total+v --add up all the numbers
        
						if(total > 127) then
            				total=total - 128
        				end
    
					end

    		result=128-total
	
			if result== 128 then result = 0 end -- If the result is 128 then substitute a value of 0
    
			tableCommon[42] = tonumber(result,10)


		
		
			--### Checksum of Tone1 Data ###
		
		
			checkSumT1 = {storePlace, storePatch, tableTone1[6], tableTone1[7], tableTone1[8], tableTone1[9], tableTone1[10], tableTone1[11], tableTone1[12], tableTone1[13], tableTone1[14], tableTone1[15], tableTone1[16], tableTone1[17], tableTone1[18], tableTone1[19], tableTone1[20], tableTone1[21], tableTone1[22], tableTone1[23], tableTone1[24], tableTone1[25], tableTone1[26], tableTone1[27], tableTone1[28], tableTone1[29], tableTone1[30], tableTone1[31], tableTone1[32], tableTone1[33], tableTone1[34], tableTone1[35], tableTone1[36], tableTone1[37], tableTone1[38], tableTone1[39], tableTone1[40], tableTone1[41], tableTone1[42], tableTone1[43], tableTone1[44], tableTone1[45], tableTone1[46], tableTone1[47], tableTone1[48], tableTone1[49], tableTone1[50], tableTone1[51], tableTone1[52], tableTone1[53], tableTone1[54], tableTone1[55], tableTone1[56], tableTone1[57], tableTone1[58], tableTone1[59], tableTone1[60], tableTone1[61], tableTone1[62], tableTone1[63], tableTone1[64], tableTone1[65], tableTone1[66], tableTone1[67], tableTone1[68], tableTone1[69], tableTone1[70], tableTone1[71], tableTone1[72], tableTone1[73], tableTone1[74], tableTone1[75], tableTone1[76], tableTone1[77], tableTone1[78], tableTone1[79], tableTone1[80], tableTone1[81], tableTone1[82], tableTone1[83], tableTone1[84], tableTone1[85], tableTone1[86], tableTone1[87], tableTone1[88], tableTone1[89], tableTone1[90], tableTone1[91], tableTone1[92], tableTone1[93], tableTone1[94], tableTone1[95], tableTone1[96], tableTone1[97], tableTone1[98], tableTone1[99], tableTone1[100], tableTone1[101], tableTone1[102], tableTone1[103], tableTone1[104], tableTone1[105], tableTone1[106], tableTone1[107], tableTone1[108], tableTone1[109], tableTone1[110], tableTone1[111], tableTone1[112], tableTone1[113], tableTone1[114], tableTone1[115], tableTone1[116], tableTone1[117], tableTone1[118], tableTone1[119], tableTone1[120], tableTone1[121], tableTone1[122], tableTone1[123]} -- returns the checksum of all data values

		
			local total=0
    		local result=0
    	
								
					for i,v in ipairs(checkSumT1) do
        
						total=total+v --add up all the numbers
        
						if(total > 127) then
            				total=total - 128
        				end
    
					end

    		result=128-total
	
			if result== 128 then result = 0 end -- If the result is 128 then substitute a value of 0
    
			tableTone1[124] = tonumber(result,10)
		
		
		
			--### Checksum of Tone2 Data ###
		
		
			checkSumT2 = {storePlace, storePatch, tableTone2[6], tableTone2[7], tableTone2[8], tableTone2[9], tableTone2[10], tableTone2[11], tableTone2[12], tableTone2[13], tableTone2[14], tableTone2[15], tableTone2[16], tableTone2[17], tableTone2[18], tableTone2[19], tableTone2[20], tableTone2[21], tableTone2[22], tableTone2[23], tableTone2[24], tableTone2[25], tableTone2[26], tableTone2[27], tableTone2[28], tableTone2[29], tableTone2[30], tableTone2[31], tableTone2[32], tableTone2[33], tableTone2[34], tableTone2[35], tableTone2[36], tableTone2[37], tableTone2[38], tableTone2[39], tableTone2[40], tableTone2[41], tableTone2[42], tableTone2[43], tableTone2[44], tableTone2[45], tableTone2[46], tableTone2[47], tableTone2[48], tableTone2[49], tableTone2[50], tableTone2[51], tableTone2[52], tableTone2[53], tableTone2[54], tableTone2[55], tableTone2[56], tableTone2[57], tableTone2[58], tableTone2[59], tableTone2[60], tableTone2[61], tableTone2[62], tableTone2[63], tableTone2[64], tableTone2[65], tableTone2[66], tableTone2[67], tableTone2[68], tableTone2[69], tableTone2[70], tableTone2[71], tableTone2[72], tableTone2[73], tableTone2[74], tableTone2[75], tableTone2[76], tableTone2[77], tableTone2[78], tableTone2[79], tableTone2[80], tableTone2[81], tableTone2[82], tableTone2[83], tableTone2[84], tableTone2[85], tableTone2[86], tableTone2[87], tableTone2[88], tableTone2[89], tableTone2[90], tableTone2[91], tableTone2[92], tableTone2[93], tableTone2[94], tableTone2[95], tableTone2[96], tableTone2[97], tableTone2[98], tableTone2[99], tableTone2[100], tableTone2[101], tableTone2[102], tableTone2[103], tableTone2[104], tableTone2[105], tableTone2[106], tableTone2[107], tableTone2[108], tableTone2[109], tableTone2[110], tableTone2[111], tableTone2[112], tableTone2[113], tableTone2[114], tableTone2[115], tableTone2[116], tableTone2[117], tableTone2[118], tableTone2[119], tableTone2[120], tableTone2[121], tableTone2[122], tableTone2[123]} -- returns the checksum of all data values

		
			local total=0
    		local result=0
    	
								
					for i,v in ipairs(checkSumT2) do
        
						total=total+v --add up all the numbers
        
						if(total > 127) then
            				total=total - 128
        				end
    
					end

    		result=128-total
	
			if result== 128 then result = 0 end -- If the result is 128 then substitute a value of 0
    
			tableTone2[124] = tonumber(result,10)	
		
		

			--### Checksum of Tone3 Data ###
		
		
			checkSumT3 = {storePlace, storePatch, tableTone3[6], tableTone3[7], tableTone3[8], tableTone3[9], tableTone3[10], tableTone3[11], tableTone3[12], tableTone3[13], tableTone3[14], tableTone3[15], tableTone3[16], tableTone3[17], tableTone3[18], tableTone3[19], tableTone3[20], tableTone3[21], tableTone3[22], tableTone3[23], tableTone3[24], tableTone3[25], tableTone3[26], tableTone3[27], tableTone3[28], tableTone3[29], tableTone3[30], tableTone3[31], tableTone3[32], tableTone3[33], tableTone3[34], tableTone3[35], tableTone3[36], tableTone3[37], tableTone3[38], tableTone3[39], tableTone3[40], tableTone3[41], tableTone3[42], tableTone3[43], tableTone3[44], tableTone3[45], tableTone3[46], tableTone3[47], tableTone3[48], tableTone3[49], tableTone3[50], tableTone3[51], tableTone3[52], tableTone3[53], tableTone3[54], tableTone3[55], tableTone3[56], tableTone3[57], tableTone3[58], tableTone3[59], tableTone3[60], tableTone3[61], tableTone3[62], tableTone3[63], tableTone3[64], tableTone3[65], tableTone3[66], tableTone3[67], tableTone3[68], tableTone3[69], tableTone3[70], tableTone3[71], tableTone3[72], tableTone3[73], tableTone3[74], tableTone3[75], tableTone3[76], tableTone3[77], tableTone3[78], tableTone3[79], tableTone3[80], tableTone3[81], tableTone3[82], tableTone3[83], tableTone3[84], tableTone3[85], tableTone3[86], tableTone3[87], tableTone3[88], tableTone3[89], tableTone3[90], tableTone3[91], tableTone3[92], tableTone3[93], tableTone3[94], tableTone3[95], tableTone3[96], tableTone3[97], tableTone3[98], tableTone3[99], tableTone3[100], tableTone3[101], tableTone3[102], tableTone3[103], tableTone3[104], tableTone3[105], tableTone3[106], tableTone3[107], tableTone3[108], tableTone3[109], tableTone3[110], tableTone3[111], tableTone3[112], tableTone3[113], tableTone3[114], tableTone3[115], tableTone3[116], tableTone3[117], tableTone3[118], tableTone3[119], tableTone3[120], tableTone3[121], tableTone3[122], tableTone3[123]} -- returns the checksum of all data values

		
			local total=0
    		local result=0
    	
								
					for i,v in ipairs(checkSumT3) do
        
						total=total+v --add up all the numbers
        
						if(total > 127) then
            				total=total - 128
        				end
    
					end

    		result=128-total
	
			if result== 128 then result = 0 end -- If the result is 128 then substitute a value of 0
    
			tableTone3[124] = tonumber(result,10)



			--### Checksum of Tone4 Data ###
		
		
			checkSumT4 = {storePlace, storePatch, tableTone4[6], tableTone4[7], tableTone4[8], tableTone4[9], tableTone4[10], tableTone4[11], tableTone4[12], tableTone4[13], tableTone4[14], tableTone4[15], tableTone4[16], tableTone4[17], tableTone4[18], tableTone4[19], tableTone4[20], tableTone4[21], tableTone4[22], tableTone4[23], tableTone4[24], tableTone4[25], tableTone4[26], tableTone4[27], tableTone4[28], tableTone4[29], tableTone4[30], tableTone4[31], tableTone4[32], tableTone4[33], tableTone4[34], tableTone4[35], tableTone4[36], tableTone4[37], tableTone4[38], tableTone4[39], tableTone4[40], tableTone4[41], tableTone4[42], tableTone4[43], tableTone4[44], tableTone4[45], tableTone4[46], tableTone4[47], tableTone4[48], tableTone4[49], tableTone4[50], tableTone4[51], tableTone4[52], tableTone4[53], tableTone4[54], tableTone4[55], tableTone4[56], tableTone4[57], tableTone4[58], tableTone4[59], tableTone4[60], tableTone4[61], tableTone4[62], tableTone4[63], tableTone4[64], tableTone4[65], tableTone4[66], tableTone4[67], tableTone4[68], tableTone4[69], tableTone4[70], tableTone4[71], tableTone4[72], tableTone4[73], tableTone4[74], tableTone4[75], tableTone4[76], tableTone4[77], tableTone4[78], tableTone4[79], tableTone4[80], tableTone4[81], tableTone4[82], tableTone4[83], tableTone4[84], tableTone4[85], tableTone4[86], tableTone4[87], tableTone4[88], tableTone4[89], tableTone4[90], tableTone4[91], tableTone4[92], tableTone4[93], tableTone4[94], tableTone4[95], tableTone4[96], tableTone4[97], tableTone4[98], tableTone4[99], tableTone4[100], tableTone4[101], tableTone4[102], tableTone4[103], tableTone4[104], tableTone4[105], tableTone4[106], tableTone4[107], tableTone4[108], tableTone4[109], tableTone4[110], tableTone4[111], tableTone4[112], tableTone4[113], tableTone4[114], tableTone4[115], tableTone4[116], tableTone4[117], tableTone4[118], tableTone4[119], tableTone4[120], tableTone4[121], tableTone4[122], tableTone4[123]} -- returns the checksum of all data values

		
			local total=0
    		local result=0
    	
								
					for i,v in ipairs(checkSumT4) do
        
						total=total+v --add up all the numbers
        
						if(total > 127) then
            				total=total - 128
        				end
    
					end

    		result=128-total
	
			if result== 128 then result = 0 end -- If the result is 128 then substitute a value of 0
    
			tableTone4[124] = tonumber(result,10)

		
			--### Send Sysex Messages ###
		

			--Send Common Patch Data to be stored
        		
			commonSysex = CtrlrMidiMessage({0xF0, tableCommon[0], tableCommon[1], tableCommon[2], tableCommon[3], storePlace, storePatch, tableCommon[6], tableCommon[7], tableCommon[8], tableCommon[9], tableCommon[10], tableCommon[11], tableCommon[12], tableCommon[13], tableCommon[14], tableCommon[15], tableCommon[16], tableCommon[17], tableCommon[18], tableCommon[19], tableCommon[20], tableCommon[21], tableCommon[22], tableCommon[23], tableCommon[24], tableCommon[25], tableCommon[26], tableCommon[27], tableCommon[28], tableCommon[29], tableCommon[30], tableCommon[31], tableCommon[32], tableCommon[33], tableCommon[34], tableCommon[35], tableCommon[36], tableCommon[37], tableCommon[38], tableCommon[39], tableCommon[40], tableCommon[41], tableCommon[42], 0xF7})
	    
    		panel:sendMidiMessageNow(commonSysex)

        					
		
			--Send Tone1 Patch Data to be stored

			tone1Sysex = CtrlrMidiMessage({0xF0, tableTone1[0], tableTone1[1], tableTone1[2], tableTone1[3], storePlace, storePatch, tableTone1[6], tableTone1[7], tableTone1[8], tableTone1[9], tableTone1[10], tableTone1[11], tableTone1[12], tableTone1[13], tableTone1[14], tableTone1[15], tableTone1[16], tableTone1[17], tableTone1[18], tableTone1[19], tableTone1[20], tableTone1[21], tableTone1[22], tableTone1[23], tableTone1[24], tableTone1[25], tableTone1[26], tableTone1[27], tableTone1[28], tableTone1[29], tableTone1[30], tableTone1[31], tableTone1[32], tableTone1[33], tableTone1[34], tableTone1[35], tableTone1[36], tableTone1[37], tableTone1[38], tableTone1[39], tableTone1[40], tableTone1[41], tableTone1[42], tableTone1[43], tableTone1[44], tableTone1[45], tableTone1[46], tableTone1[47], tableTone1[48], tableTone1[49], tableTone1[50], tableTone1[51], tableTone1[52], tableTone1[53], tableTone1[54], tableTone1[55], tableTone1[56], tableTone1[57], tableTone1[58], tableTone1[59], tableTone1[60], tableTone1[61], tableTone1[62], tableTone1[63], tableTone1[64], tableTone1[65], tableTone1[66], tableTone1[67], tableTone1[68], tableTone1[69], tableTone1[70], tableTone1[71], tableTone1[72], tableTone1[73], tableTone1[74], tableTone1[75], tableTone1[76], tableTone1[77], tableTone1[78], tableTone1[79], tableTone1[80], tableTone1[81], tableTone1[82], tableTone1[83], tableTone1[84], tableTone1[85], tableTone1[86], tableTone1[87], tableTone1[88], tableTone1[89], tableTone1[90], tableTone1[91], tableTone1[92], tableTone1[93], tableTone1[94], tableTone1[95], tableTone1[96], tableTone1[97], tableTone1[98], tableTone1[99], tableTone1[100], tableTone1[101], tableTone1[102], tableTone1[103], tableTone1[104], tableTone1[105], tableTone1[106], tableTone1[107], tableTone1[108], tableTone1[109], tableTone1[110], tableTone1[111], tableTone1[112], tableTone1[113], tableTone1[114], tableTone1[115], tableTone1[116], tableTone1[117], tableTone1[118], tableTone1[119], tableTone1[120], tableTone1[121], tableTone1[122], tableTone1[123], tableTone1[124], 0xF7})
	    
    		panel:sendMidiMessageNow(tone1Sysex)

						
		
			--Send Tone2 Patch Data to be stored

			tone2Sysex = CtrlrMidiMessage({0xF0, tableTone2[0], tableTone2[1], tableTone2[2], tableTone2[3], storePlace, storePatch, tableTone2[6], tableTone2[7], tableTone2[8], tableTone2[9], tableTone2[10], tableTone2[11], tableTone2[12], tableTone2[13], tableTone2[14], tableTone2[15], tableTone2[16], tableTone2[17], tableTone2[18], tableTone2[19], tableTone2[20], tableTone2[21], tableTone2[22], tableTone2[23], tableTone2[24], tableTone2[25], tableTone2[26], tableTone2[27], tableTone2[28], tableTone2[29], tableTone2[30], tableTone2[31], tableTone2[32], tableTone2[33], tableTone2[34], tableTone2[35], tableTone2[36], tableTone2[37], tableTone2[38], tableTone2[39], tableTone2[40], tableTone2[41], tableTone2[42], tableTone2[43], tableTone2[44], tableTone2[45], tableTone2[46], tableTone2[47], tableTone2[48], tableTone2[49], tableTone2[50], tableTone2[51], tableTone2[52], tableTone2[53], tableTone2[54], tableTone2[55], tableTone2[56], tableTone2[57], tableTone2[58], tableTone2[59], tableTone2[60], tableTone2[61], tableTone2[62], tableTone2[63], tableTone2[64], tableTone2[65], tableTone2[66], tableTone2[67], tableTone2[68], tableTone2[69], tableTone2[70], tableTone2[71], tableTone2[72], tableTone2[73], tableTone2[74], tableTone2[75], tableTone2[76], tableTone2[77], tableTone2[78], tableTone2[79], tableTone2[80], tableTone2[81], tableTone2[82], tableTone2[83], tableTone2[84], tableTone2[85], tableTone2[86], tableTone2[87], tableTone2[88], tableTone2[89], tableTone2[90], tableTone2[91], tableTone2[92], tableTone2[93], tableTone2[94], tableTone2[95], tableTone2[96], tableTone2[97], tableTone2[98], tableTone2[99], tableTone2[100], tableTone2[101], tableTone2[102], tableTone2[103], tableTone2[104], tableTone2[105], tableTone2[106], tableTone2[107], tableTone2[108], tableTone2[109], tableTone2[110], tableTone2[111], tableTone2[112], tableTone2[113], tableTone2[114], tableTone2[115], tableTone2[116], tableTone2[117], tableTone2[118], tableTone2[119], tableTone2[120], tableTone2[121], tableTone2[122], tableTone2[123], tableTone2[124], 0xF7})

			panel:sendMidiMessageNow(tone2Sysex)

		
		
			--Send Tone3 Patch Data to be stored

			tone3Sysex = CtrlrMidiMessage({0xF0, tableTone3[0], tableTone3[1], tableTone3[2], tableTone3[3], storePlace, storePatch, tableTone3[6], tableTone3[7], tableTone3[8], tableTone3[9], tableTone3[10], tableTone3[11], tableTone3[12], tableTone3[13], tableTone3[14], tableTone3[15], tableTone3[16], tableTone3[17], tableTone3[18], tableTone3[19], tableTone3[20], tableTone3[21], tableTone3[22], tableTone3[23], tableTone3[24], tableTone3[25], tableTone3[26], tableTone3[27], tableTone3[28], tableTone3[29], tableTone3[30], tableTone3[31], tableTone3[32], tableTone3[33], tableTone3[34], tableTone3[35], tableTone3[36], tableTone3[37], tableTone3[38], tableTone3[39], tableTone3[40], tableTone3[41], tableTone3[42], tableTone3[43], tableTone3[44], tableTone3[45], tableTone3[46], tableTone3[47], tableTone3[48], tableTone3[49], tableTone3[50], tableTone3[51], tableTone3[52], tableTone3[53], tableTone3[54], tableTone3[55], tableTone3[56], tableTone3[57], tableTone3[58], tableTone3[59], tableTone3[60], tableTone3[61], tableTone3[62], tableTone3[63], tableTone3[64], tableTone3[65], tableTone3[66], tableTone3[67], tableTone3[68], tableTone3[69], tableTone3[70], tableTone3[71], tableTone3[72], tableTone3[73], tableTone3[74], tableTone3[75], tableTone3[76], tableTone3[77], tableTone3[78], tableTone3[79], tableTone3[80], tableTone3[81], tableTone3[82], tableTone3[83], tableTone3[84], tableTone3[85], tableTone3[86], tableTone3[87], tableTone3[88], tableTone3[89], tableTone3[90], tableTone3[91], tableTone3[92], tableTone3[93], tableTone3[94], tableTone3[95], tableTone3[96], tableTone3[97], tableTone3[98], tableTone3[99], tableTone3[100], tableTone3[101], tableTone3[102], tableTone3[103], tableTone3[104], tableTone3[105], tableTone3[106], tableTone3[107], tableTone3[108], tableTone3[109], tableTone3[110], tableTone3[111], tableTone3[112], tableTone3[113], tableTone3[114], tableTone3[115], tableTone3[116], tableTone3[117], tableTone3[118], tableTone3[119], tableTone3[120], tableTone3[121], tableTone3[122], tableTone3[123], tableTone3[124], 0xF7})
		
			panel:sendMidiMessageNow(tone3Sysex)

			

			--Send Tone4 Patch Data to be stored
		
			tone4Sysex = CtrlrMidiMessage({0xF0, tableTone4[0], tableTone4[1], tableTone4[2], tableTone4[3], storePlace, storePatch, tableTone4[6], tableTone4[7], tableTone4[8], tableTone4[9], tableTone4[10], tableTone4[11], tableTone4[12], tableTone4[13], tableTone4[14], tableTone4[15], tableTone4[16], tableTone4[17], tableTone4[18], tableTone4[19], tableTone4[20], tableTone4[21], tableTone4[22], tableTone4[23], tableTone4[24], tableTone4[25], tableTone4[26], tableTone4[27], tableTone4[28], tableTone4[29], tableTone4[30], tableTone4[31], tableTone4[32], tableTone4[33], tableTone4[34], tableTone4[35], tableTone4[36], tableTone4[37], tableTone4[38], tableTone4[39], tableTone4[40], tableTone4[41], tableTone4[42], tableTone4[43], tableTone4[44], tableTone4[45], tableTone4[46], tableTone4[47], tableTone4[48], tableTone4[49], tableTone4[50], tableTone4[51], tableTone4[52], tableTone4[53], tableTone4[54], tableTone4[55], tableTone4[56], tableTone4[57], tableTone4[58], tableTone4[59], tableTone4[60], tableTone4[61], tableTone4[62], tableTone4[63], tableTone4[64], tableTone4[65], tableTone4[66], tableTone4[67], tableTone4[68], tableTone4[69], tableTone4[70], tableTone4[71], tableTone4[72], tableTone4[73], tableTone4[74], tableTone4[75], tableTone4[76], tableTone4[77], tableTone4[78], tableTone4[79], tableTone4[80], tableTone4[81], tableTone4[82], tableTone4[83], tableTone4[84], tableTone4[85], tableTone4[86], tableTone4[87], tableTone4[88], tableTone4[89], tableTone4[90], tableTone4[91], tableTone4[92], tableTone4[93], tableTone4[94], tableTone4[95], tableTone4[96], tableTone4[97], tableTone4[98], tableTone4[99], tableTone4[100], tableTone4[101], tableTone4[102], tableTone4[103], tableTone4[104], tableTone4[105], tableTone4[106], tableTone4[107], tableTone4[108], tableTone4[109], tableTone4[110], tableTone4[111], tableTone4[112], tableTone4[113], tableTone4[114], tableTone4[115], tableTone4[116], tableTone4[117], tableTone4[118], tableTone4[119], tableTone4[120], tableTone4[121], tableTone4[122], tableTone4[123], tableTone4[124], 0xF7})

			panel:sendMidiMessageNow(tone4Sysex)

		
			timer:stopTimer(timerId)

			utils.infoWindow("Patch Stored!","The patch was sent to synth")

		end
	        		
	
	end


end