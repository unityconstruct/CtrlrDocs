--- convert boolean to string
---@param valueBoolean boolean boolean to parse
---@return string . returns 0 if false, 1 if true
function boolToStr(valueBoolean)
	
	if valueBoolean == true then
		return "1"
	else
		return "0"
	end
end

---convert string to boolean
---@param valueString string string to parse
---@return boolean . returns true if 1/"true", false if 0/"false"
function strToBool(valueString)
	
	if valueString == "1" or valueString == "true" then
		return true
	else
		return false
	end
end