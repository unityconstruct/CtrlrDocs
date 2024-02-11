
---convert a binary represented as string to decimal using specified base
--- base would normally be '2' for binary string
---@param binaryString string binary number represented as a string
---@param base integer base used for conversion
---@return integer .return converted decimal number
function bin2dec(binaryString, base)
	return tonumber(binaryString, base)
end

---convert a binary represented as string to decimal using base 2
---@param binNum string binary number represented as a string
---@return integer .return converted decimal number
function bin2dec(binNum)
	return bin2dec(binNum, 2)
end