#!/usr/bin/lua
--- file-io utils



-- WORKING -------------------------------------------------------------------------
-- f = utils.openFileWindow("prompt",File("/home/setup/data"), "*.*", true)
-- console(tostring(f.getFileName(f)))
-- filedata = f.loadFileAsString(f)
-- console( filedata )
-- WORKING -------------------------------------------------------------------------


--- open a file and save to string
--- @param filename string - file to open
function fileIO(filename)

	f = utils.openFileWindow ("open file", File(filename), "*.*", true)
	
	filedata = MemoryBlock()
	filedata = f:loadFileAsData()
	
	--- data = f:loadFileAsData()
	-- data is a CtrlrLuaMemoryBlock with the contents of the file
	-- console (data:toHexString(1))

end

-- m = MemoryBlock({1,2,3})

fileIO("/home/setup/data/git-ctrlr/testdata.csv")




-- m = MemoryBlock()