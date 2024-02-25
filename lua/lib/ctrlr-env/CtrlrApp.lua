#!/usr/bin/lua
local panel = require 'CtrlrEnv'

local function test1()
    print("CtrlrApp:test1{}")
end

print("CtrlrApp: HI! Ctrlr")

return {
    test1 = test1
}


-- local CtrlrEnv = require "CtrlrEnv"




-- CtrlrPanel = {}
-- function CtrlrPanel.Test()
-- end
-- return CtrlrPanel
