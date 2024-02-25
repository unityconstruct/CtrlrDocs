#!/usr/local/bin


--[[ print() methods ]]--

---convenience function for print()
---@param value any
function printer(value)
    print(tostring(value))
end

---convenience function for print()
---@param value any
function p(value)
    printer(value)
end


--[[ console() methods ]]--

---convenience function for console()
---@param value any
function consoler(value)
    console(tostring(value))
end

---convenience function for console()
---@param value any
function c(value)
    consoler(value)
end


