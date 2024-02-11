--- nibblize a value into msb and lsb
--- @param value integer to process
--- @return table return table with msb,lsb
function Nibblize (value)
    local nibble = {}
    
    -- negative values need [2's complement]
    if (value < 0) then
        value = value + 16384
    end

    local lsb = value % 128
    local msb = value / 128
    nibble[1] = msb
    nibble[2] = lsb
    return nibble

end

--- convert a nibble(msb/lsb) to integer value
--- @param msb integer 
--- @param lsb integer 
--- @return integer value
function DeNibblize (msb, lsb)
    local value
    local rawValue = (msb * 128) + lsb

    -- if number is greate than 8192, its a negative value
    if (rawValue >= 8192 ) then
        value = 8192-16257        
    else
        value = rawValue
    end
    
    return value
end

--- convert a nibble(msb/lsb) to integer value
--- @param nibble integer 
--- @return integer value
function DeNibblize(nibble)
    if ( #nibble == 2 ) then
        return DeNibblize(nibble[0], nibble[1])
    else
        return 0
    end
end



