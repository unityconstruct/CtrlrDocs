#!/usr/bin/lua
--- coverter utility functions



--- converts a decimal number to its binary analog.
--- Uses a for loop to count down from 7 to 0
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 255
--- @return string binary representation of the decimal number
function dec2bin(decNum)
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

    -- error checking for valid binary: values 0-255
    if (decNum > 255) or (decNum < 0) then return "00000000" end

	local t = {}
	local i

    -- iterate from 7 to 0 to populate each element with a 0 or 1
    -- divide the number by a power of 2 and assign to table
    -- the remainder reassigned to decNum using modulus
    -- in this way a binary number is built from highest bit to lowest
  	for i = 7, 0, -1 do

    	t[#t + 1] = math.floor(decNum / 2^i)
    	decNum = decNum % 2^i
  	end

    -- join all table values without delimeters
	return table.concat(t)
end

--- converts a decimal number to its binary analog.
--- splits number into msb and lsb by dividing by 256
--- Index is used for both the table index & the power of 2: 2^i
--- @param decNum integer number 0 to 65536
--- @return string binary represent
function dec2byte(decNum)
    if (decNum < 0) or (decNum >= 65536) then return "00000000,00000000" end
    local msb = math.floor(decNum / 256)
    local lsb = decNum % 256
    print("msb: " .. msb .. " lsb: " .. lsb)
    -- return byte in form of "00000000,00000000"
    return dec2bin(msb) .. "," .. dec2bin(lsb)
end

--- print a list of binary values
--- @param power integer specifying max power to iterate to
function printBinaryPowersList( --[[ optional ]] power)
    power = power or 16 -- enables power to be an optional parameter. if power=nil, then assignment fail
    for i=0,power do
        print("2^" .. i .. ": " .. 2^i)
    end
end



printBinaryPowersList(16)
-- print(dec2bin(255))
-- print(math.floor(65535/256))
-- print(65535%256)
-- print(dec2byte(65533))

-- print(2^16)  -- 65536
-- print(2^8)  -- 256
-- print(2^7)  -- 128
-- print(2^6)  -- 641
-- print(2^5)  -- 32
-- print(2^4)  -- 16
-- print(2^3)  -- 8
-- print(2^2)  -- 4
-- print(2^1)  -- 2
-- print(2^0)  -- 1

--[[
2^0: 1
2^1: 2
2^2: 4
2^3: 8
2^4: 16
2^5: 32
2^6: 64
2^7: 128
2^8: 256
2^9: 512
2^10: 1024
2^11: 2048
2^12: 4096
2^13: 8192
2^14: 16384
2^15: 32768
2^16: 65536
]]



