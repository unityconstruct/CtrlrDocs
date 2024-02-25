#!/usr/bin/lua

-- You can easily convert to a lua table using the MemoryBlock() method toLuaTable(table):

myMidiReceived = function(--[[ CtrlrMidiMessage --]] midi)
    panel:getLabel("debug"):setText("incoming ....")
    local t={}
    local str = midi:getData():toHexString(1) -- debugging only
    panel:getLabel("debug"):append("\n"..str) -- debugging only

    midi:getData():getRange(15,5):toLuaTable(t)

    for i,v in ipairs (t) do -- debugging only
        console(String(i..","..v))
    end

    local cat=table.concat(t,'-') -- debugging only

    panel:getLabel("debug"):append("\n"..cat) -- debugging only
end

-- If you want to get all data up to, but not including F7, you would have to calculate how many bytes there are from the “offset” to the end of the message “NOT” do getSize()-1 (ignoring f7) that won’t work, so you would have to do something like. (a typical sysex header might be 8 bytes):

local offset,t=8,{}
local sizeOfData=midi:getData():getSize()-1
local result=sizeOfData-offset
midi:getData():getRange(offset,result):toLuaTable(t)

for i,v in ipairs (t) do
    console(String(i..","..v))
end



--I’m using the built-in function:
mbName:toHexString(1)

--I’m using console(mbName:toHexString(1)) to get all my memory blocks visible in an easy and fast way in the console then you just need to copy/paste in HxD for even easier analysis and counting. (HxD = hexadecimal editor)
