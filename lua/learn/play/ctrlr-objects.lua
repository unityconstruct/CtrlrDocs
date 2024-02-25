#!/usr/bin/lua
print("hi")


-- function getComponent()

-- end

-- function getModulator()

-- end

Component = {
    type = "component"
}
Modulator = {
    type = "modulator"
}


function Component:new()
    setmetatable({},Component)
    
    self.name = "CompName"
    self.isVisible = true
    self.isDisabled = false
    return self
end

function getComponent()
    return Component.new()
end




function Modulator:new()
    setmetatable({},Modulator)
    self.isVisible = true
    self.isDisabled = false
    self.visibleName = "ModName"
    self.getComponent = getComponent()
    return self
end



local modulator = Modulator:new()
local result = modulator:getComponent()
    local visible = result.isVisible
print(result)
