#!/usr/bin/lua
--- parse a CSV string/row & checks for paired quotes
--- just looking at string.find() and regex

local i = 12
-- csvRowString = '"aaa""AA""A","b""bb","ccc'
csvRowString = '"aaa""AAA","bbb,ccc'
repeat
    -- looks for an occurence of a quote that's NOT escaped [""]
    -- a is START index
    -- i is END index
    -- c is 
    a, i, c = string.find(csvRowString, '"("?)', i+1)
    -- print("a: "..a.." i: "..i.." c: "..c)
until c ~= '"'    -- quote not followed by quote?
local ii = i or 999
local aa = a or 999
local cc = c or "999"
print("a: "..aa.." i: "..ii.." c: "..cc)
-- assert(i~=nil,'error unmatched "')
if not i then error('unmatched "') end
print("a: "..aa.." i: "..ii.." c: "..cc)
