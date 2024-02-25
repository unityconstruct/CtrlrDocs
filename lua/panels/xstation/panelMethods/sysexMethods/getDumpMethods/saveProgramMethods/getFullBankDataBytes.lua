function getFullBankDataBytes()
	
	local fbData = {}
	local i = 0
	local j = 0

	for i = 1, 100 do
		for j = 1, 270 do
		  fbData[#fbData + 1] = programBank[i][j]
		end
	end

	return fbData
end