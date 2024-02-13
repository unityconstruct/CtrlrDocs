-- assign a value to a modulator
-- if the value is -1, fetch the modulators default value, then assign
function assertSingleParameter(modNm, modVl)

	-- Set value - Default value if -1
	if modVl == -1 then
		panel:getComponent(modNm):setValue(tonumber(panel:getComponent(modNm):getProperty("uiSliderDoubleClickValue")), true)
	else
		panel:getComponent(modNm):setValue(modVl, true)
	end
end