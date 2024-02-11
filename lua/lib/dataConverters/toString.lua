--- converts anything to a string
--- @param value string
--- @return string 
function ToString(value)
    return tostring(value)
end


--- coverts table to delimited string
--- @param valueTable table table to convert to string
--- @param separator string separator character
--- @return string
function ToString(valueTable,separator)

    return table.concat(valueTable,separator)
end

--- coverts table to delimited string using separator ","
--- @param valueTable table
--- @return string
function ToString(valueTable)

    return ToString(valueTable,",")
end

