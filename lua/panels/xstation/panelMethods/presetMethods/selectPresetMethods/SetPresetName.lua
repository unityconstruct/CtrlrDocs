function setPresetName(newName, newNum)
	
	panel:getComponent("lblProgramName"):setPropertyString("uiLabelText", newName)
	panel:getComponent("lblAdditionalInfo"):setPropertyString("uiLabelText", tostring(newNum))
end