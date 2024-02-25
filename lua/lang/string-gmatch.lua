#!/usr/local/lua

---comment
---@param haystackString any
---@return integer
---@return integer?
GetMinMax = function(haystackString)
    for min, max in string.gmatch(haystackString,'(-%d+),(%d+)') do
        return tonunmber(min), tonumber(max)
    end
end
GetMin = function(haystackString)
    min = GetMinMax(haystackString)
    return min
end

GetMax = function(haystackString)
    min,max = GetMinMax(haystackString)
    return max
end

local haystack = "-7,0"

local resultMin, resultMax = GetMinMax(haystack)

print("MIN: "..tostring(resultMin) .. " MAX: " .. tostring(resultMax))
print("MIN: ".. GetMin(haystack) .. " MAX: " .. GetMax(haystack))