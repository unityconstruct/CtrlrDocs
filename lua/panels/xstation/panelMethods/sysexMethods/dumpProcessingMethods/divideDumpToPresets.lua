function divideDumpToPresets(bDump, overridePNum)

	local i
	local j = 0
	local sByte = 0
	local mByte = bDump:getSize() - 1
	local cPres = 0
	local cBank = panel:getModulatorByName("Selected Bank"):getValue()

	local readBlock = false

	-- First of all we have to fill preset bank with init patches
	if overridePNum == nil then
		initPresetBank()
	end

	for i = 0, mByte do

		if readBlock == false then

			-- Searching for x-station signature
			if bDump:getByte(i) == 0xF0 then
				if bDump:getByte(i + 2) == 0x20 then
					if bDump:getByte(i + 3) == 0x29 then
						if (bDump:getByte(i + 5) == 0x41) or (bDump:getByte(i + 5) == 0x42) then

							readBlock = true

							-- Byte pointer
							j = 1

							-- Start byte for reading
							sByte = i

							-- Get stored preset number
							if overridePNum == nil then
								cPres = cPres + 1 --bDump:getByte(i + 12) + 1 << Might be buggy
							else
								cPres = overridePNum
							end

						end
					end
				end
			end

		end

		if readBlock == true then

			if (j < 270) and (bDump:getByte(sByte + j - 1) ~= 0xF7) then

				programBank[cPres][j] = bDump:getByte(sByte + j - 1)
				j = j + 1
			else

				if overridePNum ~= nil then
					alterPBValues(cBank, cPres)
				end

				readBlock = false
			end
		end

	end
end