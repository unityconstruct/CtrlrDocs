## blog-08 Label to Hex

### How to get label content and send it via SysEx?

### FantomXR

- Hey people,
- I’m very new to CTRLR and I must say that the control surface is not that user friendly 🙂
- I’d like to set up a bunch of labels. I’d like to be able to enter a text inside this label (at least this part was easy). Now I want to convert this text to HEX, put it into a SysEx-Stream and - send it out.
- Are you guys able to help me? I don’t have a clue where to start…

Thanks,
Chris

March 28, 2018 at 8:07 pm#83199REPLY | REPORT | QUOTE

### human fly

- you can do this but i foresee a problem if the user enters a non-number character ie: won’t be a number you can convert to hex (maybe someone can come up with a filter to exclude alphabet - characters)
- oh dear, i’ll have a go..
- off top of head, you’d fetch the text with something like this.
- someone else can fill in/correct?

```lua
function myFetchTextToHex () --[ when modulator value changes ]--
local myValue  = nil --[ initialise local variables ]--
local myHexVal = nil
myValue = panel:getComponent("myLabel"):getProperty("uiLabelText")
--console(String(myValue)) --[ see what you've got, will return a 'string' ]--
myHexVal = string.format("%.2X",myValue)
--console(String(myHexVal)) --[ see what you've got ]--
end
```

- it’s probably wrong 🙂
- this is the 1st part. then you have to build the midi message, where you’d insert myHexVal where you want your value. gets a whole lot more complicated of course if it’s more than 0-127 value range, or exotic value ranges.
- why not have a ‘combo’ with a dropdown list of displayed values?

March 28, 2018 at 8:10 pm#83200REPLY | REPORT | QUOTE

### human fly

- %.2X is the expression for 2-character hexadecimal, so it performs ‘string.format’ on the variable after the comma.

March 28, 2018 at 8:13 pm#83201REPLY | REPORT | QUOTE

### FantomXR

hey,

thanks for your reply!
Meanwhile I stepped through the DEMO-files that come with CTRLR. I found the DEMO “Send Patch Name”. This does pretty exactly what I need. 🙂 I just added a panel:sendMidiMessageNow-Command to send the string to the midi output of the plugin. So that’s done.

But what I now ask myself: Is it possible to export the content of a label to the host? Just like exporting the status of a slider f.e.? Then I could use my Host to switch between different labels.

Best,
Chris

March 28, 2018 at 8:46 pm#83202REPLY | REPORT | QUOTE

### human fly

you mean to send the patch name?
here’s the code i’ve seen and used for that (Possemo’s, i think), this is for sending the name to a label, so you’ll have to fiddle with it, but it’s got the elements in it (been a while since i looked at it)
```lua
-- Called when a modulator value changes
enterToneName = function(mod, value)

	-- This variable stops index issues during panel bootup
	if panel:getRestoreState() == true or panel:getProgramState() == true then
		return
	end
	-- //////////////////////////// RETRIEVING PATCH NAME ///////////////////////////////
	-- we take the text from the LCD_Text modulator and convert it to Lua type of string, that's why 
	-- there is the L() macro, otherwise we'd get a String() instance, that might not work well with 
	-- the native Lua library

	NewPatchName = L(panel:getModulatorByName("lcd_ToneName"):getComponent():getProperty("uiLabelText"))

-- Store each character in variable --and convert it from ASCII to numerical code
	character1 = string.byte(NewPatchName,1)
	character2 = string.byte(NewPatchName,2)
	character3 = string.byte(NewPatchName,3)
	character4 = string.byte(NewPatchName,4)
	character5 = string.byte(NewPatchName,5)
	character6 = string.byte(NewPatchName,6)
	character7 = string.byte(NewPatchName,7)
	character8 = string.byte(NewPatchName,8)
	character9 = string.byte(NewPatchName,9)
	character10 = string.byte(NewPatchName,10)

-- insert space for empty characters --or method crashes at nil value
	if character1 == nil then character1 = "32" else character1 	= ""..character1 end
	if character2 == nil then character2 = "32" else character2 	= ""..character2 end
	if character3 == nil then character3 = "32" else character3 	= ""..character3 end
	if character4 == nil then character4 = "32" else character4 	= ""..character4 end
	if character5 == nil then character5 = "32" else character5 	= ""..character5 end
	if character6 == nil then character6 = "32" else character6 	= ""..character6 end
	if character7 == nil then character7 = "32" else character7 	= ""..character7 end
	if character8 == nil then character8 = "32" else character8 	= ""..character8 end
	if character9 == nil then character9 = "32" else character9 	= ""..character9 end
	if character10 == nil then character10 = "32" else character10 = ""..character10 end

      panel:getComponent("label_ToneNameDest"):setPropertyString("uiLabelText","i11-"..(NewPatchName))
	end
end
```

- ugh, i might have misunderstood your question actually -and i think the code was by Carl Licroy. but it’s still relevant for handling ascii names.

March 28, 2018 at 10:06 pm#83204REPLY | REPORT | QUOTE


### goodweather

- Instead to isolate each character and treating it with an if, you can treat the complete string at once with:
```lua
--
-- Returns HEX representation of a DECimal number
--
dec2hex = function(num)

    local hexstr = '0123456789ABCDEF'
    local s = ''

    while num > 0 do
        local mod = math.fmod(num, 16)
        s = string.sub(hexstr, mod+1, mod+1) .. s
        num = math.floor(num / 16)
    end
    if s == '' then s = '0' end
    return s

end

--
-- 	For the conversion of a DECimal number to anything else
--	it is just needed to use the built-in Lua function tonumber(string, base)
--
--	print(tonumber("0100",2))
--	4
-- 	print(tonumber("3F",16))
-- 	63

--
-- Returns HEX representation of a String
--
function str2hex(str)
    local hex = ''
    while #str > 0 do
        local hb = dec2hex(string.byte(str, 1, 1))
        if #hb < 2 then hb = '0' .. hb end
        hex = hex .. hb
        str = string.sub(str, 2)
    end
    return hex
end

Then to use it it is as simple as:
str2hex(txtLayerBName:getComponent():getProperty(“uiLabelText”))
```

March 28, 2018 at 10:29 pm#83207REPLY | REPORT | QUOTE


### FantomXR

Like I said: This is already solved.
But I’m still looking for an alternative to “store” or export those labels to the host.

March 28, 2018 at 11:05 pm#83208REPLY | REPORT | QUOTE


### dasfaker

>FantomXR wrote:
>But what I now ask myself: Is it possible to export the content of a label to the host? Just like exporting the status of a slider f.e.? Then I could use my Host to switch between different labels.

No, the uiLabel doesn’t have modulatorValue, the only property that is sent to the host.
