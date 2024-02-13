function fillRangeWithInitBytes(bArr, bFrom, bTo)
	
	-- May be more useful to fill data range with default values
	local initArr = getInitPatchData()
	local i

	for i = bFrom, bTo do

		bArr[i] = initArr[i]
	end

	return bArr
end