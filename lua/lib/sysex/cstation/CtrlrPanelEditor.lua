#!/usr/bin/lua

local CtrlrModulator = require "CtrlrDocs.lua.lib.sysex.cstation.CtrlrModulator"
local panel = require "CtrlrDocs.lua.lib.sysex.cstation.CtrlrPanel"

print(tostring(panel:getComponent():isVisible()))