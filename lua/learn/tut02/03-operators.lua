#!/usr/bin/lua

-- logica
-- > < >= <= ~= ==
-- and or not

-- ternary NOT supported
age = 13
--[[

    function canIVote(age)
        canVote = age > 18 ? true : false
        print("Can I vote: [" .. age .. "]: " .. canVote)
    end
    
    canIVote(10)
    canIVote(20)
]]--
