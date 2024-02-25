#!/usr/local/bin

--[[
string.format
Returns a formatted version of its variable number of arguments following the description given in its first argument, which must be a string. The format string follows the same rules as the ISO C function sprintf. The only differences are that the conversion specifiers and modifiers F, n, *, h, L, and l are not supported and that there is an extra specifier, q. Both width and precision, when present, are limited to two digits.

The specifier q formats booleans, nil, numbers, and strings in a way that the result is a valid constant in Lua source code. Booleans and nil are written in the obvious way (true, false, nil). Floats are written in hexadecimal, to preserve full precision. A string is written between double quotes, using escape sequences when necessary to ensure that it can safely be read back by the Lua interpreter. For instance, the call

     string.format('%q', 'a string with "quotes" and \n new line')
may produce the string:

     "a string with \"quotes\" and \
      new line"
This specifier does not support modifiers (flags, width, precision).

The conversion specifiers A, a, E, e, f, G, and g all expect a number as argument. The specifiers c, d, i, o, u, X, and x expect an integer. When Lua is compiled with a C89 compiler, the specifiers A and a (hexadecimal floats) do not support modifiers.

The specifier s expects a string; if its argument is not a string, it is converted to one following the same rules of tostring. If the specifier has any modifier, the corresponding string argument should not contain embedded zeros.

The specifier p formats the pointer returned by lua_topointer. That gives a unique string identifier for tables, userdata, threads, strings, and functions. For other values (numbers, nil, booleans), this specifier results in a string representing the pointer NULL.

q formats booleans, nil, numbers, and strings in a way that the result is a valid constant in Lua source code
A, a, E, e, f, G, and g all expect a number as argumen
c, d, i, o, u, X, and x expect an integer.
s expects a string;
p formats the pointer returned by lua_topointer. That gives a unique string identifier for tables, userdata, threads, strings, and functions

-- any
q
-- numbers
A
a
E
e
f
G
g
-- integer
c
d
i
u
X
x
-- string
s

string.format()
-- any
string.format('%q',"")
-- numbers
string.format(%A',"")
string.format(%a',"")
string.format(%E',"")
string.format(%e',"")
string.format(%f',"")
string.format(%G',"")
string.format(%g',"")
-- integer
string.format(%c',"")
string.format(%d',"")
string.format(%i',"")
string.format(%u',"")
string.format(%X',"")
string.format(%x',"")
-- string
string.format(%s',"")

]]--


-- not used
function formatter()
  local valueAny = 'Here\'s a quote: "Hi!". Done!'
  local valueNumber = 1.05
  local valueInteger = -20
  local valueString = 'Here\'s a quote: "Hi!". Done!"'

  local values = {}
  -- any
  values[#values+1] = string.format('%q',valueAny)
  -- numbers
  --values[#values+1] = string.format('%A',valueNumber)
  --values[#values+1] = string.format('%a',valueNumber)
  values[#values+1] = string.format('%E',valueNumber)
  --values[#values+1] = string.format('%e',valueNumber)
  values[#values+1] = string.format('%f',valueNumber) --floating point
  values[#values+1] = string.format('%.4f',valueNumber) --floating point with precision specified
  values[#values+1] = string.format('%.8f',valueNumber) --floating point with precision specified
  --values[#values+1] = string.format('%G',valueNumber)
  --values[#values+1] = string.format('%g',valueNumber)
  -- integer
  values[#values+1] = string.format('%c',valueInteger) -- character
  values[#values+1] = string.format('%d',valueInteger) -- decimal
  values[#values+1] = string.format('%i',valueInteger) -- integer
  values[#values+1] = string.format('%u',valueInteger) -- unsigned int
  values[#values+1] = string.format('%X',valueInteger) -- hex
  values[#values+1] = string.format('%x',valueInteger) -- hex
  -- string
  values[#values+1] = string.format('%s',valueString)
  return values
end

---creates table of formatted strings from string
---@param valueString string - string to format
---@return table - table of values
function formatString(valueString)
  local values = {}
  values[#values+1] = "formatString----------"
  values[#values+1] = "[raw ]: " .. valueString
  -- any
  values[#values+1] = "[%q  ]: " .. string.format('%q',valueString)
  --string
  values[#values+1] = "[%s  ]: " .. string.format('%s',valueString)
  return values
end

---creates table of formatted strings from any
---@param valueAny any - string to format
---@return table - table of values
function formatAny(valueAny)
  local values = {}
  values[#values+1] = "formatAny-------------"
  -- any
  values[#values+1] = string.format('%q',valueAny)
  return values
end

---creates table of formatted string from number
---@param valueNumber number - number to format
---@return table - table of values
function formatNumber(valueNumber)
  local values = {}
  values[#values+1] = "formatNumber----------"
  values[#values+1]   = "[raw ]: " .. valueNumber
  -- any
  values[#values+1]   = "[%q  ]: " .. string.format('%q',valueNumber)
  -- numbers
  --values[#values+1] = "[%A  ]: " .. string.format('%A',valueNumber)
  --values[#values+1] = "[%a  ]: " .. string.format('%a',valueNumber)
  values[#values+1]   = "[%E  ]: " .. string.format('%E',valueNumber)
  --values[#values+1] = "[%e  ]: " .. string.format('%e',valueNumber)
  values[#values+1]   = "[%f  ]: " .. string.format('%f',valueNumber) --floating point
  values[#values+1]   = "[%.4f]: " .. string.format('%.4f',valueNumber) --floating point with precision specified
  values[#values+1]   = "[%.8f]: " .. string.format('%.8f',valueNumber) --floating point with precision specified
  --values[#values+1] = "[%G  ]: " .. string.format('%G',valueNumber)
  --values[#values+1] = "[%g  ]: " .. string.format('%g',valueNumber)  
  return values
end

---creates table of formatted string from integer
---@param valueInteger integer - integer to format
---@return table - table of values
function formatInteger(valueInteger)
  local values = {}
  values[#values+1] = "formatInteger----------"
  values[#values+1] = "Raw Value    [  ]: " .. valueInteger
  -- any
  values[#values+1] = "format const [%q]: " ..  string.format('%q',valueInteger)
  -- integer
  values[#values+1] = "char         [%c]: " .. string.format('%c',valueInteger) -- character
  values[#values+1] = "decimal      [%d]: " .. string.format('%d',valueInteger) -- decimal
  values[#values+1] = "integer      [%i]: " .. string.format('%i',valueInteger) -- integer
  values[#values+1] = "unsigned int [%u]: " .. string.format('%u',valueInteger) -- unsigned int
  values[#values+1] = "hex          [%X]: " .. string.format('%X',valueInteger) -- hex
  values[#values+1] = "hex          [%x]: " .. string.format('%x',valueInteger) -- hex
  return values
end

--- print any value to string
---@param valueAny any
function p(valueAny)
    print(tostring(valueAny))
end

---print table values to
---@param valueTable table - table of values
function pt(valueTable)
    for i=1,#valueTable,1 do
        p(tostring(valueTable[i]))
    end
end


local valueAny = "asdf"
local valueNumber = "asdf"
local valueInteger = "asdf"
local valueString = "asdf"
local result

result = formatAny("Once upon one's time...")
pt(result)

result = formatInteger(20)
pt(result)

result = formatNumber(20)
pt(result)

p(string.format('%-10s:%4s:%10s',"field", 15,16)  )
--local result formatter()
-- result = string.format('%s',"a string")

-- result = string.format('%c',6)
--print(#result)