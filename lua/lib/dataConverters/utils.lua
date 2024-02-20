#!/usr/bin/lua
if false then -- For LuaDoc
    ---
    --- coverter utility functions
        module "utils"
end


--[[ decimal utils ]]--

--- converts a decimal number to its binary analog.<br/>
--- Uses a for loop to count down from 7 to 0<br/>
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 255
--- @return string binary representation of the decimal number
local function dec2bin(decNum)

	
    -- error checking for valid binary: values 0-255
    if (decNum > 255) or (decNum < 0) then return "00000000" end

    local tBinary = {}
    local i

    -- iterate from 7 to 0 to populate each element with a 0 or 1<br/>
    -- divide the number by a power of 2 and assign to table<br/>
    -- the remainder reassigned to decNum using modulus<br/>
    -- in this way a binary number is built from highest bit to lowest
        for i = 7, 0, -1 do

        tBinary[#tBinary + 1] = math.floor(decNum / 2^i)
        decNum = decNum % 2^i
        end

    -- join all table values without delimeters
    return table.concat(tBinary)

    --[[
	t[8] = num / 2^8 -- 256
	t[7] = num / 2^7 -- 128
	t[6] = num / 2^6 -- 64
	t[5] = num / 2^5 -- 32
	t[4] = num / 2^4 -- 16
	t[3] = num / 2^3 -- 8
	t[2] = num / 2^2 -- 4
	t[1] = num / 2^1 -- 2
	--]]
end
	
--- converts a decimal number to its binary analog.<br/>
--- splits number into msb and lsb by dividing by 256<br/>
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 65536
--- @return string binary represent
local function dec2byte(decNum)
    if (decNum < 0) or (decNum >= 65536) then return "00000000,00000000" end
    local msb = math.floor(decNum / 256)
    local lsb = decNum % 256
    p("msb: " .. msb .. " lsb: " .. lsb)
    -- return byte in form of "00000000,00000000"
    return dec2bin(msb) .. "," .. dec2bin(lsb)
end

--- print a list of binary values
--- @param power integer specifying max power to iterate to
local function printBinaryValuesList(power)
    power = power or 16 -- enables power to be an optional parameter. if power=nil, then assignment fail
    for i=0,power do
        p("2^" .. i .. ": " .. 2^i)
    end
end

---convert a binary represented as string to decimal using specified base<br/>
--- base would normally be '2' for binary string
---@param binaryString string binary number represented as a string
---@param base integer base used for conversion
---@return integer .return converted decimal number
local function bin2dec(binaryString, base)
    base = base or 2
	return tonumber(binaryString, base)
end


--[[ boolean utils ]]--

--- convert boolean to string
---@param valueBoolean boolean boolean to parse
---@return string . returns 0 if false, 1 if true
local function boolToStr(valueBoolean)
	
	if valueBoolean == true then
		return "1"
	else
		return "0"
	end
end

---convert string to boolean
---@param valueString string string to parse
---@return boolean . returns true if 1/"true", false if 0/"false"
local function strToBool(valueString)
	if valueString == "1" or valueString == "true" then
		return true
	else
		return false
	end
end

---convert string to boolean
---@param valueString string string to parse
---@return integer . returns true if 1/"true", false if 0/"false"
local function strToBoolInt(valueString)
	if valueString == "1" or valueString == "true" then
		return 1
	else
		return 0
	end
end


--[[ hex utils ]]--

---converts numeric or string number 0-127 to hexstring
---@param value any - any value 0-127
---@return string, string - hex representation of passed value
local function any2hex(value)
    local num = tonumber(value)
    if num > 127 then
        return "00", string.format("value is too large [0-127]: [%s]",num)
    end
    return string.format('%.2x',value), "conversion successful"
end

--
-- Returns HEX representation of a String
--
local function str2hex(str)
    local hex = ''
    while #str > 0 do
        local hb = any2hex(string.byte(str, 1, 1))
        if #hb < 2 then hb = '0' .. hb end
        hex = hex .. hb
        str = string.sub(str, 2)
    end
    return hex
end


--[[ Nibble Utils]]

--- convert a decimal value to/from nibble<br/>
--- nibblize a value into msb and lsb
--- @param nibbleInt integer to process
--- @return table return table with msb,lsb integers
local function nibblize14bit (nibbleInt)
    local nibbleTable = {}
    p("Nibblize: value: " .. nibbleInt)
    -- negative values need [2's complement]
    if (nibbleInt < 0) then
        nibbleInt = nibbleInt + 16384
    end
    p("Nibblize: value after negative check/adjust: " .. nibbleInt)
    --- @type integer - value stored in first byte. modulus removes the msb from the value
    local lsb = nibbleInt % 128
    --- @type integer - value stored in second byte. divide revmoes the lsb from the value
    local msb = math.floor(nibbleInt / 128)
    nibbleTable[1] = msb
    nibbleTable[2] = lsb
    return nibbleTable

end

--- convert a nibble(msb/lsb) to integer value
--- @param msbInt integer - MSB value
--- @param lsbInt integer - LSB value
--- @return integer value - denibbled integer value
local function deNibblize14bit (msbInt, lsbInt)
    local value
    local rawValue = (msbInt * 128) + lsbInt

    -- if number is greate than 8192, its a negative value
    if (rawValue >= 8192 ) then
        value = rawValue - 16384
    else
        value = rawValue
    end
    
    return value
end

--- convert a nibble(msb/lsb) to integer value
--- @param nibbleTable table - table with 2 elements. nibble[0] = msb, nibble[1] = lsb
--- @return integer value
local function deNibblizeTable14bit(nibbleTable)
    p(type(nibbleTable))
    if ( #nibbleTable == 2 ) then
        p("DeNibblize: " .. nibbleTable[1] .. "," .. nibbleTable[2])
        return deNibblize14bit(--[[msb]]nibbleTable[1], --[[lsb]]nibbleTable[2])
    else
        p("DeNibblize: table size invalid: expected 2: [".. #nibbleTable .. "]")
        return 0
    end
end


--[[ string utils ]]--

--- converts anything to a string
--- @param value any
--- @return string 
local function toString(value)
    return tostring(value)
end

--- coverts table to delimited string (default delim = ",")
--- @param valueTable table table to convert to string
--- @param separator string separator character
--- @return string
local function tableToString(valueTable,separator)
    separator = separator or ","
    return table.concat(valueTable,separator)
end

---converts a delimited string to a table
---@param valueString any
---@return table
local function stringToTable(valueString)
    local delim = ","

    local matchesTable = {}
    -- %a+ = alphanumeric chars: finds groups of alphanumeric chars separated by non-alphnum chars
    for alphaNumericWord in string.gmatch(valueString,'(%a+)') do
        if alphaNumericWord ~= nil then
            matchesTable[#matchesTable+1] = alphaNumericWord
        end
    end
    return matchesTable
end


--[[ output utils ]]--

---Print a table's content to console with specified delimeter ("," is default)
---@param valueTable table - table to print out. only 1-dimensional array supported
---@param delimChar string - a delimiter to print between table values
local function printTable(valueTable,delimChar)
    local delimChar = delimChar or ","
    local stringBuilder = {}
    -- cleaning table of nil values
    for j=1, #valueTable ,1 do
        if(valueTable[j] ~= nil) then
            stringBuilder[#stringBuilder+1] = valueTable[j]
        end
    end
    p(tostring(table.concat(stringBuilder,delimChar)))
    
end

---convenience function for print<br/>
---making all calls to this function will make it easy to update just this function<br/>
---when needed to output in Ctrlr
---@param value any
local function printer(value)
    print(tostring(value))
end

---convenience function for Printer
---@param value any
local function p(value)
    printer(value)
end

---Checks two values of Equality
---@param valueActual any - value to check
---@param valueExpected any - expected value
---@return boolean, string - true if values are equal
local function assertEquals(valueActual, valueExpected)
    local dataType = type(valueExpected)
    local actual
    local expected = valueExpected

    if(dataType == "number") then
        actual = tonumber(valueActual)
    elseif (dataType == "string") then
        actual = tostring(valueActual)
    elseif (dataType == "boolean") then
        actual = valueActual
    elseif (dataType == "table") then
        actual = valueActual.size()
        expected = valueActual.size()
    elseif (dataType == "nil") then
    else
    end

    if (actual == expected ) then
        return true, string.format("Equality Test:[true]: Actual:[%s] Expected:[%s]",toString(actual),toString(expected))
    else
        return false, string.format("Equality Test:[false]: Actual:[%s] Expected:[%s]",toString(actual),toString(expected))
    end
end


--[[ sysex data utils ]]--

---parse a sysex hexString into a table holding 2chars per element
---@param sysexString string - sysex string with no space delimeters
---@return table - . tabulated sysex data
local function parseSyxToTable(sysexString)
    --remove any spaces or commas frequently found in sysex strings
    --this condenses the sysex string for processing
    sysexString = string.gsub(sysexString,"[%s%,]","")
    -- check if the string has odd number of chars, denoting an invalid sysex string
    local size = #sysexString
    if ((size % 2) ~= 0) then
        return {}
    end
    local dump = {}
    local get = ""
    -- iterate the sysex string, capturing text in pairs and store in table element
    for i=1,#sysexString,2 do
        get = string.sub(sysexString,i,i+1)
        dump[#dump+1] = get
        -- log each operation
        print(tostring(i)..": ["..tostring(get).."]")
    end
    return dump
end

---format a sysex dump table to a string. <br/>
---default delimeter is a space [ ] but if a second argument is provided, it will use it instead
---@param syxDumpTable table - table of sysex hex values [F7]
---@param delim string - one or more characters to use for delimeters
---@return string - . return a string with table contents concatenated with a delimeter
local function syxDumpTableToString(syxDumpTable, delim)
    local delim = delim or " "
    local hexstring = table.concat(syxDumpTable, delim)
    print("Table Dump: \n" .. tostring(hexstring))
    return hexstring
end

---format a hextring to a delimited string. ie: [4e00] => [4e,00] or [4e 00] <br/>
---  If hexstring is 'space-delimited', it will be trimmed of all spaces, then processed
---@param sysexHexString string - hexstring to be reformated. 
---@param delim string - optional string delimeter. Defaults to ','.
---@return string - .return a string of provided concatenated table
local function sysHexStringFormatWith(sysexHexString, delim)
    syxDumpTableToString(parseSyxToTable(sysexHexString),delim)
end


--[[ table utils ]]--



--[[ table sorting ]]--

---sort and return a table
---@param tbl table - unsorted table
---@return function - returns an iterator FUNCTION to be iterated on
local function tableSort(tbl)
    local tempArray = {}
    -- iterate the table, inserting keys into a temporary array
    for k in pairs(tbl) do table.insert(tempArray,k) end
    -- then sort the temp keys array
    table.sort(tempArray)
    -- now iterate the keys array, putting the key/value pairs into the iterator
    local i = 0
    local iter = function()
        i = i+1
        -- nil value keys have no value & are simply assigned nil
        if tempArray[i] == nil then return nil
        -- otherwise return the key(tempArray[i]) and key[value](tbl[tempArray[i]])
        else return tempArray[i], tbl[tempArray[i]]
        end
    end
    return iter -- this returns a function, NOT a table
end

---sorts a table, then returns it
---@param unsortedTable table - unsorted table
---@return table - sorted table base on provided unsorted table
local function tableSortAndReturn(unsortedTable)
    local sortedTable = {}
    -- pass unsorted table to the sorting function/iterator
    -- tableSort returns a FUNCTION, NOT A TABLE
    -- so then use the for k,v... loop to recreate the now sorted table
    for k,v in tableSort(unsortedTable)
    do
        local item = tostring(k) .. " = " .. tostring(v)
        print(item)
        sortedTable[k] = v
    end
    -- now return the sorted table
    return sortedTable
end

--[[ string contains ]]--#region

---search a string for string value
---@param haystack any - value to search in
---@param needle any - value to search for
---@param startAt any - start index in the haystack
---@param boolPlain any - true = use 'plain' text search, false = use 'pattern matching'
---@return boolean - . return true if needle is found in haystack
local function isContains(haystack,needle,startAt,boolPlain)
    startAt = startAt or 1
    boolPlain = boolPlain or true
    local found = string.find(haystack,needle,startAt,boolPlain)
    if (found == nil) then
        return false
    else
        return true
    end
end


--[[ isContains tests ]]--
--[[
    print(tostring(isContains("abc", "bc",1,true)))
    print(tostring(isContains("abc", "bd",1,true)))
    print(tostring(isContains(123, 2 ,1,true)))
    print(tostring(isContains(123, 4 ,1,true)))
]]--


--[[ nibble tests 
--- test DeNibbleFunctions
--- @param nib1 integer - value 0-255
--- @param nib2 integer - value 0-255
local function deNibbleTests(nib1, nib2)
    local nib1 = nib1 or 0
    local nib2 = nib2 or 0
    local nib = {}
    nib[1] = nib1
    nib[2] = nib2
    p("nib: "..type(nib))
    local result = DeNibblizeTable14bit(nib)
    p(tostring(result))
end

--- test DeNibbleFunctions
--- @param valueTest integer - value 0-255
local function nibbleTests(valueTest)
    local valueTest = valueTest or 0
    p("valueTest: " .. type(valueTest))
    local result = Nibblize14bit(valueTest)
    p(tostring(result[1] ..":".. tostring(result[2])))
end

nibbleTests(0)
nibbleTests(1)
nibbleTests(127)
nibbleTests(128)
nibbleTests(255)
nibbleTests(256)
nibbleTests(511)
nibbleTests(512)
nibbleTests(1023)
nibbleTests(1024)
nibbleTests(2047)
nibbleTests(2048)
nibbleTests(4095)
nibbleTests(4096)
nibbleTests(8191)
nibbleTests(8192)
nibbleTests(16383)
nibbleTests(16384)

deNibbleTests(0,0)
deNibbleTests(1,1)
deNibbleTests(2,2)
deNibbleTests(3,3)
deNibbleTests(4,4)
deNibbleTests(7,7)
deNibbleTests(8,8)
deNibbleTests(15,15)
deNibbleTests(16,16)
deNibbleTests(31,31)
deNibbleTests(32,32)
deNibbleTests(63,63)
deNibbleTests(64,64)
deNibbleTests(127,127)
deNibbleTests(128,128)

deNibbleTests(0,0)
deNibbleTests(0,0)
deNibbleTests(0,0)
deNibbleTests(0,1)
deNibbleTests(0,2)
deNibbleTests(0,3)
deNibbleTests(0,4)

deNibbleTests(1,0)
deNibbleTests(1,1)
deNibbleTests(1,2)
deNibbleTests(1,3)
deNibbleTests(1,4)

deNibbleTests(2,0)
deNibbleTests(2,1)
deNibbleTests(2,2)
deNibbleTests(2,3)
deNibbleTests(2,4)


deNibbleTests(127,0)
deNibbleTests(127,1)
deNibbleTests(127,2)
deNibbleTests(127,3)
deNibbleTests(127,4)

deNibbleTests(255)
deNibbleTests(255,255)
deNibbleTests(0,0)
deNibbleTests(255,0)
deNibbleTests(0,255)
deNibbleTests(128,128)
deNibbleTests(128,0)
deNibbleTests(0,128)
deNibbleTests(1,1)

]]--


--[[ tests decimal tests
	-- printBinaryValuesList(2)
	-- p(dec2bin(255))
	-- p(math.floor(65535/256))
	-- p(65535%256)
	-- p(dec2byte(65533))
	
	-- p(2^16)  -- 65536
	-- p(2^8)  -- 256
	-- p(2^7)  -- 128
	-- p(2^6)  -- 641
	-- p(2^5)  -- 32
	-- p(2^4)  -- 16
	-- p(2^3)  -- 8
	-- p(2^2)  -- 4
	-- p(2^1)  -- 2
	-- p(2^0)  -- 1
]]--


--[[ tests any2hex
    
    p(any2hex(1))
    p(any2hex(10))
    p(any2hex(100))
    p(any2hex(127))
    p(any2hex(128))
    
    p("test: 1   : " .. any2hex(1) .." : "..any2hex("1"))
p("test: 15  : " .. any2hex(15) .." : "..any2hex("15"))
p("test: 16  : " .. any2hex(16) .." : "..any2hex("16"))
p("test: 17  : " .. any2hex(17) .." : "..any2hex("17"))
p("test: 31  : " .. any2hex(31) .." : "..any2hex("31"))
p("test: 32  : " .. any2hex(32) .." : "..any2hex("32"))
p("test: 33  : " .. any2hex(33) .." : "..any2hex("33"))
p("test: 63  : " .. any2hex(63) .." : "..any2hex("63"))
p("test: 64  : " .. any2hex(64) .." : "..any2hex("64"))
p("test: 65  : " .. any2hex(65) .." : "..any2hex("65"))
p("test: 127 : " .. any2hex(127) .." : "..any2hex("127"))
p("test: 128 : " .. any2hex(128) .." : "..any2hex("128"))
p("test: 129 : " .. any2hex(129) .." : "..any2hex("129"))
]]--


--[[ Table tests
local myTable = StringToTable("one,two,three")
PrintTable(myTable,",")
]]--

--[[ test this function
function dec2bin(decNum)
	local t = {}
	local i
    for i = 7, 0, -1 do
        t[#t + 1] = math.floor(decNum / 2^i)
    	decNum = decNum % 2^i
    end
	return table.concat(t)
end
]]--

return {
    any2hex = any2hex,
    assertEquals = assertEquals,
    bin2dec = bin2dec,
    boolToStr = boolToStr,
    dec2bin = dec2bin,
    dec2byte = dec2byte,
    deNibblize14bit = deNibblize14bit,
    deNibblizeTable14bit = deNibblizeTable14bit,
    isContains = isContains,
    nibblize14bit = nibblize14bit,
    p = p,
    printBinaryValuesList = printBinaryValuesList,
    printTable = printTable,
    printer = printer,
    str2hex = str2hex,
    stringToTable = stringToTable,
    strToBool = strToBool,
    strToBoolInt =strToBoolInt,
    syxDumpTableToString = syxDumpTableToString,
    sysHexStringFormatWith = sysHexStringFormatWith,
    tableSort = tableSort,
    tableSortAndReturn = tableSortAndReturn,
    tableToString = tableToString,
    toString = toString,
}