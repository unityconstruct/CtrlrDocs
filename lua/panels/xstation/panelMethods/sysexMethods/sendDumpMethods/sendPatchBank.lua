function sendPatchBank()

	local i = 0
	local j = 0
	local cBank = panel:getModulatorByName("Selected Bank"):getValue()

	for i = 1, 100 do

		storeSinglePatch(cBank, i)
		-- Need some time to rest while patch writing to memory
		os.execute(sleep(200))
	end
end