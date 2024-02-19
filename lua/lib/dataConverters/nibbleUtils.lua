#!/usr/bin/lua

--- convert a decimal value to/from nibble

--- nibblize a value into msb and lsb
--- @param value integer to process
--- @return table return table with msb,lsb integers
function Nibblize14bit (value)
    local nibble = {}
    print("Nibblize: value: " .. value)
    -- negative values need [2's complement]
    if (value < 0) then
        value = value + 16384
    end
    print("Nibblize: value after negative check/adjust: " .. value)
    --- @type integer - value stored in first byte. modulus removes the msb from the value
    local lsb = value % 128
    --- @type integer - value stored in second byte. divide revmoes the lsb from the value
    local msb = math.floor(value / 128)
    nibble[1] = msb
    nibble[2] = lsb
    return nibble

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
    print(type(nibbleTable))
    if ( #nibbleTable == 2 ) then
        print("DeNibblize: " .. nibbleTable[1] .. "," .. nibbleTable[2])
        return DeNibblize14bit(--[[msb]]nibbleTable[1], --[[lsb]]nibbleTable[2])
    else
        print("DeNibblize: table size invalid: expected 2: [".. #nibbleTable .. "]")
        return 0
    end
end


--- test DeNibbleFunctions
--- @param nib1 integer - value 0-255
--- @param nib2 integer - value 0-255
local function deNibbleTests(nib1, nib2)
    local nib1 = nib1 or 0
    local nib2 = nib2 or 0
    local nib = {}
    nib[1] = nib1
    nib[2] = nib2
    print("nib: "..type(nib))
    local result = DeNibblizeTable14bit(nib)
    print(tostring(result))
end

--- test DeNibbleFunctions
--- @param valueTest integer - value 0-255
local function nibbleTests(valueTest)
    local valueTest = valueTest or 0
    print("valueTest: " .. type(valueTest))
    local result = Nibblize14bit(valueTest)
    print(tostring(result[1] ..":".. tostring(result[2])))
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

-- deNibbleTests(,)
-- deNibbleTests(,)


-- deNibbleTests(255)
-- deNibbleTests(255,255)
-- deNibbleTests(0,0)
-- deNibbleTests(255,0)
-- deNibbleTests(0,255)
-- deNibbleTests(128,128)
-- deNibbleTests(128,0)
-- deNibbleTests(0,128)
-- deNibbleTests(1,1)


