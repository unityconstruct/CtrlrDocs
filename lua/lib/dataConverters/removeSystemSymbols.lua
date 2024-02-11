function removeSystemSymbols(origStr)
	
	local  newStr = string.gsub(origStr, '[/\\*:?"<>|]',  '') -- or is it /\*
	return newStr
end