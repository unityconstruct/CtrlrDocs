function removeSystemSymbols(origStr)
	
	local  newStr = string.gsub(origStr, '[/\*:?"<>|]',  '')
	return newStr
end