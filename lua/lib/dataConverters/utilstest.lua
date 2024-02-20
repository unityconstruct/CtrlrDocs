#!/usr/bin/lua
local utils = require "CtrlrDocs.lua.lib.dataConverters.utils"
--local utils = require "utils"

function presults(result,msg)
    local message = tostring(result) .. ':'.. msg
    utils.p(message)
end


utils.p(utils.bin2dec("11100110", 2))
utils.p(utils.dec2bin(230))
utils.p("something")
presults(utils.assertEquals(1,1))
presults(utils.assertEquals(true,true))
presults(utils.assertEquals(1,0))
presults(utils.assertEquals(true,false))
