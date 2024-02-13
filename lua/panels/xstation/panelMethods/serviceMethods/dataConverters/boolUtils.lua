function boolToStr(inpV)
	
	if inpV == true then
		return "1"
	else
		return "0"
	end
end

function strToBool(inpS)
	
	if inpS == "1" then
		return true
	else
		return false
	end
end