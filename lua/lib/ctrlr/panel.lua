#!/usr/bin/lua
if false then -- For LuaDoc
    ---
    --- utilty classes for mocking Ctrlr
        module "panel"
end

local Modulator = {}
local Component = {}

function Modulator:new()
    setmetatable({},Modulator)
end

---comment
---@return Modulator
local getModulator = function()
    return Modulator
end
--- comment
---@return Component
local getComponent = function()
    return Component
end


return {
    getModulator = getModulator,
    getComponent = getComponent

}