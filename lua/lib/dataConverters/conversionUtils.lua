#!/usr/bin/lua
--- coverter utility functions

--[[ decimal utils ]]--

--- converts a decimal number to its binary analog.
--- Uses a for loop to count down from 7 to 0
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 255
--- @return string binary representation of the decimal number
function Dec2bin(decNum)

	
    -- error checking for valid binary: values 0-255
    if (decNum > 255) or (decNum < 0) then return "00000000" end

    local tBinary = {}
    local i

    -- iterate from 7 to 0 to populate each element with a 0 or 1
    -- divide the number by a power of 2 and assign to table
    -- the remainder reassigned to decNum using modulus
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
	
--- converts a decimal number to its binary analog.
--- splits number into msb and lsb by dividing by 256
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 65536
--- @return string binary represent
function Dec2byte(decNum)
    if (decNum < 0) or (decNum >= 65536) then return "00000000,00000000" end
    local msb = math.floor(decNum / 256)
    local lsb = decNum % 256
    p("msb: " .. msb .. " lsb: " .. lsb)
    -- return byte in form of "00000000,00000000"
    return Dec2bin(msb) .. "," .. Dec2bin(lsb)
end

--- print a list of binary values
--- @param power integer specifying max power to iterate to
function PrintBinaryValuesList( --[[ optional ]] power)
    power = power or 16 -- enables power to be an optional parameter. if power=nil, then assignment fail
    for i=0,power do
        p("2^" .. i .. ": " .. 2^i)
    end
end

---convert a binary represented as string to decimal using specified base
--- base would normally be '2' for binary string
---@param binaryString string binary number represented as a string
---@param base integer base used for conversion
---@return integer .return converted decimal number
function Bin2dec(binaryString, base)
    base = base or 2
	return tonumber(binaryString, base)
end


--[[ boolean utils ]]--

--- convert boolean to string
---@param valueBoolean boolean boolean to parse
---@return string . returns 0 if false, 1 if true
function BoolToStr(valueBoolean)
	
	if valueBoolean == true then
		return "1"
	else
		return "0"
	end
end

---convert string to boolean
---@param valueString string string to parse
---@return boolean . returns true if 1/"true", false if 0/"false"
function StrToBool(valueString)
	if valueString == "1" or valueString == "true" then
		return true
	else
		return false
	end
end

---convert string to boolean
---@param valueString string string to parse
---@return integer . returns true if 1/"true", false if 0/"false"
function StrToBoolInt(valueString)
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
function Any2hex(value)
    local num = tonumber(value)
    if num > 127 then
        return "00", string.format("value is too large [0-127]: [%s]",num)
    end
    return string.format('%.2x',value), "conversion successful"
end

--
-- Returns HEX representation of a String
--
function Str2hex(str)
    local hex = ''
    while #str > 0 do
        local hb = dec2hex(string.byte(str, 1, 1))
        if #hb < 2 then hb = '0' .. hb end
        hex = hex .. hb
        str = string.sub(str, 2)
    end
    return hex
end

--[[ Nibble Utils]]

--- convert a decimal value to/from nibble
--- nibblize a value into msb and lsb
--- @param nibbleInt integer to process
--- @return table return table with msb,lsb integers
function Nibblize14bit (nibbleInt)
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
function DeNibblize14bit (msbInt, lsbInt)
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
function DeNibblizeTable14bit(nibbleTable)
    p(type(nibbleTable))
    if ( #nibbleTable == 2 ) then
        p("DeNibblize: " .. nibbleTable[1] .. "," .. nibbleTable[2])
        return DeNibblize14bit(--[[msb]]nibbleTable[1], --[[lsb]]nibbleTable[2])
    else
        p("DeNibblize: table size invalid: expected 2: [".. #nibbleTable .. "]")
        return 0
    end
end


--[[ string utils ]]--

--- converts anything to a string
--- @param value any
--- @return string 
function ToString(value)
    return tostring(value)
end

--- coverts table to delimited string
--- @param valueTable table table to convert to string
--- @param separator string separator character
--- @return string
function TableToString(valueTable,separator)

    return table.concat(valueTable,separator)
end

--- coverts table to delimited string using separator ","
--- @param valueTable table
--- @return string
function TableToString(valueTable)

    return ToString(valueTable,",")
end

---converts a delimited string to a table
---@param valueString any
---@return table
function StringToTable(valueString)
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
function PrintTable(valueTable,delimChar)
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

---convenience function for print
---making all calls to this function will make it easy to update just this funciton
---when needed to output in Ctrlr
---@param value any
function Printer(value)
    print(tostring(value))
end

---convenience function for Printer
---@param value any
function p(value)
    Printer(value)
end


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

print("asdfa")
print("asdfa")