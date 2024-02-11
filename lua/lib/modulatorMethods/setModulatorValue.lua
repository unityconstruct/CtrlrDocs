--- assign a value to a modulator
---    if the value is -1, fetch the modulators default value, then assign
--- @param modulatorName string modulator name
--- @param modulatorValue integer value to set
function setModulatorValueByName(modulatorName, modulatorValue)

	-- Set value - Default value if -1
	if modulatorValue == -1 then
		panel:getComponent(modulatorName):setValue(tonumber(panel:getComponent(modulatorName):getProperty("uiSliderDoubleClickValue")), true)
	else
		panel:getComponent(modulatorName):setValue(modulatorValue, true)
	end
end

--- assign a value to a modulator ( by Name )
--- @param modulatorName string modulator name
--- @param modulatorValue integer value to set
function setModulatorValue(modulatorName, modulatorValue)
	setModulatorValueByName(modulatorName, modulatorValue)
end

--- fetch and assign modulator's default value
--- @param modulatorName string modulator name
--- @return integer defaultValue
function setModulatorValueDefault(modulatorName)
	local defaultValue = panel:getComponent(modulatorName):getProperty("uiSliderDoubleClickValue")
	setModulatorValue(modulatorName,defaultValue)
	return defaultValue
end
