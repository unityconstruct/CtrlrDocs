--- csv utilities that convert csv to from string | table

--- Used to escape "'s by toCSV
--- @param csvString string csv in string format
--- @return string - csvString that is escaped
function escapeCSV (csvString)
    -- test that string has both comma and quote
	-- then there are no commas or quotes, then delimiting is not needed
	if string.find(csvString, '[,"]') then 
		-- replace single quotes with double quotes
		csvString = '"' .. string.gsub(csvString, '"', '""') .. '"'
	end

	return csvString

end

--- Convert from CSV string to table (converts a single line of a CSV file)
--- @param csvRowString string in csv format
function fromCSV (csvRowString)

	csvRowString = csvRowString .. ','        -- ending comma
	--- @table t - table holding a csv row of data

	--- @type table - holds row field data
	local t = {}
	--- @type integer - holds index # for start of current cell
	local fieldstart = 1
	--- @type integer - holds
	local i  = fieldstart

	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(csvRowString, '^"', fieldstart) then -- regex to find quote as start of line
			local a, c

			repeat
				-- looks for an occurence of a quote that's NOT escaped [""]
				-- find start AFTER and expected quote
				-- a is START index | i is END index | c is captured match
				a, i, c = string.find(csvRowString, '"("?)', i+1)
			until c ~= '"'    -- quote not followed by quote?
			-- i = nil if no match is found
			if not i then error('unmatched "') end
			
			-- extracts data from the csv field that wrapped in quotes '"'
			-- fetching substring using [fieldstart] and [i]
			local f = string.sub(csvRowString, fieldstart+1, i-1)
			-- add cell data to table, replacing any double quotes with single
			table.insert(t, (string.gsub(f, '""', '"')))
			-- now update the START index
			-- look for the next ',' 
			fieldstart = string.find(csvRowString, ',', i) + 1
		else                -- unquoted; find next comma
			local nexti = string.find(csvRowString, ',', fieldstart)
			table.insert(t, string.sub(csvRowString, fieldstart, nexti-1))
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(csvRowString)

	for i = 1, fieldstart do
		t[i] = tonumber(t[i])
	end
	
	return t

end

--- Convert from table to CSV string
--- @param tableData
function toCSV (tableData)

	local s = ""

	-- assumption is that fromCSV and toCSV maintain data as ordered array
	for _,p in ipairs(tableData) do  
		s = s .. "," .. escapeCSV(p)
	end

	return string.sub(s, 2)      -- remove first comma

end