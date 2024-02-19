#!/usr/bin/lua

---converts numeric or string number 0-127 to hexstring
---@param value any - any value 0-127
---@return string, string - hex representation of passed value
function any2hex(value)
    local num = tonumber(value)
    if num > 127 then
        return "00", string.format("value is too large [0-127]: [%s]",num)
    end
    return string.format('%.2x',value), "conversion successful"
end

--[[ tests
    
    print(any2hex(1))
    print(any2hex(10))
    print(any2hex(100))
    print(any2hex(127))
    print(any2hex(128))
    
    print("test: 1   : " .. any2hex(1) .." : "..any2hex("1"))
print("test: 15  : " .. any2hex(15) .." : "..any2hex("15"))
print("test: 16  : " .. any2hex(16) .." : "..any2hex("16"))
print("test: 17  : " .. any2hex(17) .." : "..any2hex("17"))
print("test: 31  : " .. any2hex(31) .." : "..any2hex("31"))
print("test: 32  : " .. any2hex(32) .." : "..any2hex("32"))
print("test: 33  : " .. any2hex(33) .." : "..any2hex("33"))
print("test: 63  : " .. any2hex(63) .." : "..any2hex("63"))
print("test: 64  : " .. any2hex(64) .." : "..any2hex("64"))
print("test: 65  : " .. any2hex(65) .." : "..any2hex("65"))
print("test: 127 : " .. any2hex(127) .." : "..any2hex("127"))
print("test: 128 : " .. any2hex(128) .." : "..any2hex("128"))
print("test: 129 : " .. any2hex(129) .." : "..any2hex("129"))
]]--


--
-- Returns HEX representation of a String
--
function str2hex(str)
    local hex = ''
    while #str > 0 do
        local hb = dec2hex(string.byte(str, 1, 1))
        if #hb < 2 then hb = '0' .. hb end
        hex = hex .. hb
        str = string.sub(str, 2)
    end
    return hex
end