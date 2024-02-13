function getSelectedPresetName(sPreset)
	
	local i
	local pName = ""

	-- 16 preset name bytes
	for i = 165, 180 do

		pName = pName .. string.char(programBank[sPreset][i])
	end

	return pName
end