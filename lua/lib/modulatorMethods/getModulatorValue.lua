--- fetch a modulator value by Name
--- @param modulatorName string of the modulator name
--- @return CtrlrComponent
function getModulatorValueByName(modulatorName)
	return panel:getModulatorByName(modulatorName):getValue()
end

--- fetch a modulator value (by Name)
--- @param modulatorName string of the modulator name
--- @return CtrlrComponent return a panel modulator
function getModulatorValue(modulatorName)
	return getModulatorValueByName(modulatorName)
end

--- fetch a modulator by its name, then fetch its default value from "uiSliderDoubleClickValue"
--- @param modulatorName string of the modulator name
--- @return CtrlrComponent return a panel modulator
function getModulatorValueDefault(modulatorName)
	return panel:getComponent(modulatorName):getProperty("uiSliderDoubleClickValue")
end


--- fetch a modulator value (by Name)
--- @param modulatorName string of the modulator name
-- @return CtrlrComponent return a panel modulator
function showModulator(modulatorName, boolOnOff)
	panel:getComponent("grpMainVoice5"):setProperty("componentVisibility") = true

	--return getModulatorValueByName(modulatorName)
	--return getModulatorValueByName(modulatorName)
end