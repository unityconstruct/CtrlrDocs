function dec2bin(decNum)
	
	local t = {}
	local i

  	for i = 7, 0, -1 do

    	t[#t + 1] = math.floor(decNum / 2^i)
    	decNum = decNum % 2^i
  	end

	return table.concat(t)
end