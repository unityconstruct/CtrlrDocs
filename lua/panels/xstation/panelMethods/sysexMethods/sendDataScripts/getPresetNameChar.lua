function getPresetNameChar(cNum)
	
	local pName = panel:getComponent("lblProgramName"):getProperty("uiLabelText")

	return string.byte(string.sub(pName, cNum, cNum))
end