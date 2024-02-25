


function objectUtils()
	-- Your method code here

end

--[[ sniffByCompName("cb-PresetLayerSelect") ]]--
function sniffByCompName(compName)
local msg = string.format("Sniffing on ComponentName:[%s]",tostring(compName))
p(msg)
msg = string.format("Geting ObjectTree...")
result = panel:getComponent(compName):getObjectTree() 
what(result)

p("Geting ObjectTree...")
console(tostring(result:getNumProperties())) 
msg = "" --clear message var
result = panel:getComponent(compName):getObjectTree()  
for i=1,result:getNumProperties(),1 do 
  p(string.format("%-20s %-10s",
    tostring(result:getPropertyName(i)),
    tostring(result:getProperty(result:getPropertyName(i)))
    ))
end
end



--[[ sniffMod("cb-PresetLayerSelect") ]]--
function sniffByModName(modName)
local msg = string.format("Sniffing on ModulatorName:[%s]",tostring(modName))
p(msg)
msg = string.format("Geting ObjectTree...")
result = panel:getModulator(modName):getObjectTree() 
what(result)

p("Geting ObjectTree...")
console(tostring(result:getNumProperties())) 
msg = "" --clear message var
result = panel:getModulator(modName):getObjectTree()  
for i=1,result:getNumProperties(),1 do 
  p(string.format("%-20s %-10s",
    tostring(result:getPropertyName(i)),
    tostring(result:getProperty(result:getPropertyName(i)))
    ))
end
end

--[[ sniffMod("cb-PresetLayerSelect") 
  sniffMod(panel:getModulator("controller-1"))
]]--
function sniffMod(mod)
local msg = string.format("Sniffing on Modulator[%s]",tostring(mod:getProperty("name")))
p(msg)
msg = string.format("Geting ObjectTree...")
result = mod:getObjectTree() 
what(result)

p("Geting ObjectTree...")
console(tostring(result:getNumProperties())) 
msg = "" --clear message var
result = mod:getObjectTree()  
for i=1,result:getNumProperties(),1 do 
  p(string.format("%-20s %-10s",
    tostring(result:getPropertyName(i)),
    tostring(result:getProperty(result:getPropertyName(i)))
    ))
end
end


--[[ sniffComp("cb-PresetLayerSelect") ]]--
function sniffComp(comp)
local msg = string.format("Sniffing on Component:[%s]",tostring(comp:getProperty("name")))
p(msg)
msg = string.format("Geting ObjectTree...")
result = comp:getObjectTree() 
what(result)

p("Geting ObjectTree...")
console(tostring(result:getNumProperties())) 
msg = "" --clear message var
result = comp:getObjectTree()  
for i=1,result:getNumProperties(),1 do 
  p(string.format("%-20s %-10s",
    tostring(result:getPropertyName(i)),
    tostring(result:getProperty(result:getPropertyName(i)))
    ))
end
end









--[[
function getCtrlrPanelModulators()
  local result = panel:getNumModulators()
  for i=1, result,1 do
    --what(panel:getModulatorByIndex(i))   --sniff functions
    local m = panel:getModulatorByIndex(i)
    m:getName()
    m:getValue()
    --m:getObjectTree():getNumProperties()
    for j=1,m:getObjectTree():getNumProperties(),1 do
        p(m:getObjectTree():getPropertyName(i))
        p(m:getObjectTree(m:getObjectTree():getPropertyName(i)))
    end
  end
--getModulatorValue
--p(tostring(panel:getNumModulators()))
end
]]--


function getCtrlrPanelModulatorValuesAsData()
    local result = panel:getModulatorValuesAsData()
    what(result)
--[[
>>> p(tostring(panel:getModulatorValuesAsData()))

ERROR: No matching overload found, candidates:
MemoryBlock getModulatorValuesAsData(CtrlrPanel&,String const&,custom [enum CtrlrByteEncoding],int,int,int,bool)
MemoryBlock getModulatorValuesAsData(CtrlrPanel&,ValueTree const&,String const&,custom [enum CtrlrByteEncoding],int,bool)
MemoryBlock getModulatorValuesAsData(CtrlrPanel&,String const&,custom [enum CtrlrByteEncoding],int,bool)
]]--
end


function sniffPanel()

what(panel)
p("==========================================================")


for i=1,panel:getNumProperties(),1 do
  panel:getProperty(panel:getPropertyName(i))
end

--[[

getNumModulators
getNumModulator
getModulatorValuesAsData
getComponent
getModulatorsWithProperty
getComboComponent
getObjectTree
getModulator
getToggleButtonComponent
getPanelEditor
sendMidiMessageNow
getProperty
]]--
end






function SniffPanelEditorWithNilHandling()
    result = panel:getPanelEditor():getObjectTree() for i=1,result:getNumProperties(),1 do local pname = result:getPropertyName(i) local pval = result:getProperty(result:getPropertyName(i)) if pval == nil then pval = "" end p(string.format("%-20s %-10s",pname,pval)) end
end

--[[

result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do p(string.format("%-20s %-10s",tostring(result:getPropertyName(i)),result:getProperty(result:getPropertyName(i)) )) end



result = panel:getPanelEditor():getObjectTree()) for i=1,result:getNumProperties(),1 do p(string.format("%-20s %-10s",tostring(result:getPropertyName(i)),result:getProperty(result:getPropertyName(i)) )) end


for i=1,result:getNumProperties(),1 do 

msg = msg.."\n" .. string.format("%-30s : %-10s",tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i)):getValue())
console(tostring(result:getPropertyName(i))) 
end

result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  

for i=1,result:getNumProperties(),1 do   
p(
p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  ))
done

result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  )) end
result = panel:getComponent("cb-PresetLayerSelect"):getObjectTree()  for i=1,result:getNumProperties(),1 do   p( string.format("%-30s : %-10s",       tostring(result:getPropertyName(i)),       tostring(result:getPropertyName(i):getValue())  )) end
]]--