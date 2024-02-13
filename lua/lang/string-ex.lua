#!/usr/bin/lua

a = "abc"

print(a:len())
print(string.len(a))

b = "abc"
bin = "\x00\x00\xf0\xfe"
print(
      bin:gsub("\\x(%x%x)", function(hex) return string.char(tonumber(hex,16)) end)
)

decNum = 255
i=6
print ( tostring (math.floor(decNum / 2^i)))
print ( tostring ( decNum % 2^i))

-- print(
--     tonumber("01",16)

-- )

-- for i=0, 15, 1 do
--     for j=0,15,1 do
--             bin = "\\x" ..tostring(i) .. tostring(j)

--         print(bin .. " : " .. tostring(tonumber(bin,16)))
--     end

-- end
-- print(
--       bin.gsub("\\x(%x%x)")
-- )

-- print( string.byte(  bin:gsub("\\x(%x%x)", function(hex) return string.char(tonumber(hex,16)) end)   ) ,1 )

