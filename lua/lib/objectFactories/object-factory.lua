#!/usr/bin/lua

--- modulator object factory
---@param modId integer - modulator Id in Ctrlr panel
---@param modName string - name of modulator in Ctrlr panel
---@param paramMSB number - system MSB
---@param paramLSB number - system LSB
---@return table - table as modulator object
function createMod (modId,modName,paramMSB,paramLSB) 
    mod = {
        modId = modId,
        modName = modName,
        sysexMSB = paramMSB,
        sysexLSB = paramLSB
    }
    return mod
end

--- print modulator object fields
---@param mod modBase
function printMod (mod)
    print("modId   : " .. mod.modId)
    print("modName : " .. mod.modName)
    print("paramMSB: " .. mod.sysexMSB)
    print("paramMSB: " .. mod.sysexLSB)
end

mod1 = createMod(1,"FilterCutoff",0x11,0x12)
mod2 = createMod(1,"FilterResonance",0x21,0x22)
printMod(mod1)
printMod(mod2)