# Global Persistent Variables?


Hopefully the title explains it.. I’m looking for a way to save certain global variables prior to exit and restore them again during execution.
This would use the panel functions “Called before any modulators..” for load, but I’m not sure what to use for exiting.
My bigger problem is what method I must use to store/retrieve the variables. I’d like to use the same state files that must be used when Ctrlr stores MIDI channel, etc.
I could solve this by making a standalone ini file but then I would need to store it in the profiles section which I don’t know for each operating system.
So my question is:
– How can we preserve certain variable states when the program is not being used, so they are there again at startup? Is there a special method for this?

<hr/>

You can achieve this with stateData. StateData is kept in the Ctrlr cache.

Create a method SaveStateData to store the data you want to keep. Example:

--
-- Called when data needs saving
-- StateData is saved when the user press Ctrl+Alt+S (Save Ctrlr StateData in the menu)
-- or when quitting Ctrlr while leaving the panel open.
-- At that time all modulators indicated as Dynamic are saved but by using this method 
-- it is possible to also save values of variables that can then be read when loading the panel
--
SaveStateData = function(--[[ ValueTree --]]stateData)

	-- Saving the last file loaded/saved so it can be reloaded at panel load
	-- This is needed to have all uiLabels restored
	-- If a uiLabel is set to Dynamic instead of Static then it is its value - 0 - and not its uiLabelText property that is saved
	-- Therefore, obliged to keep all uiLabels as Static and to reload the last file
	stateData:setProperty ("LastFileFullPath", sLastFileFullPath, nil)
	stateData:setProperty ("LastFileName", sLastFileName, nil)
	stateData:setProperty ("RootFolder", currentRootFolder, nil)

end
Create a method to read your stateData and put the values in variables. Example:

--
-- Called when data is restored
--
ReadStateData = function(--[[ ValueTree --]] stateData)

	-- Variables to be read
	sLastFileFullPath = stateData:getProperty("LastFileFullPath")
	sLastFileName = stateData:getProperty("LastFileName")
	currentRootFolder = stateData:getProperty("RootFolder")

end
In panel properties, set
Called when Ctrlr state is saved: SaveStateData
Called when Ctrlr is loaded: ReadStateDate

In your PanelLoaded method, you need to check if the StateDate has been restored or not. Yep, it is sometimes failing… Example:

-- Check restored statedata and, if found, inform timer to reload file to secure all uiLabels are correctly set
if sLastFileFullPath == nil or sLastFileFullPath == "" then
	sLastFileFullPath = ""
	sLastFileName = ""
	bLastFile = false
else
	-- if stateData is working then sLastFileFullPath, sLastFileName should have been restored correctly
	-- Check if file has not been moved or been deleted
	f = File(sLastFileFullPath)
	if f:existsAsFile() then
		bLastFile = true
	else
		sLastFileFullPath = ""
		sLastFileName = ""
		bLastFile = false
	end
end
Last info: please be aware that StateData is only saved when the user quit Ctrlr by keeping the panel open. Thus not when simply closing a panel. A bit tricky and for sure not perfect.
Good luck!


<hr/>

I have a follow on query that’s still within this context (sort of) and I hope you can help with too.

I have a 3 dimensional array (table?), ProgramPatch[][] where the first element is the program number, the second element is the patch number in the program. I effectively want to store this into the State Data too.
In other languages I’d serialise the array into a string, or use a JSON library to do the same. I just can’t seem to figure out the best way with LUA. What’s the best way in CTRLR of storing the array and retrieving it?

<hr/>

I have never tried but I think you can store what you want in StateData.
Just make a test 😉
I suppose this is for user patches. For factory patches, just declare your table in some TablesInit() method then call that method at panel load to initialize it.
If you load user patchs in some component, then they stay there even if you close and re-open the panel because in the cache of the panel.
Therefore, I’m not sure you really need to keep that in state data.
You need to experiment different ways and choose the one you like the best. This is Ctrlr 😉

<hr/>


Hi computerchemist,

You can store a lua table as a JSON like string:

This is in my JD-990 panel:

ccMapArray is an table of modulator names as values with CC numbers as keys. The user can build a set of pairings for controlling the panel -> synth from a keyboard.

So I have for example a modulator I named TVFCUTFR, which is the JD-990 TVF cutoff. I want to save a mapped cc number, for example 41, to that modulator on reload, along with any other pairing.

I can save this using stateLData:addChild instead of Goodweather’s stateData:setProperty by creating a new ValueTree object called ccMapping. Here I use the modulator name as a hash/key, but you could just as easily store an index too, I guess.

First I check that the table is not empty otherwise bad things happen.


SAVE CC MAPPING ARRAY TO stateData:child

if not rawequal(next(ccMapArray), nil) then
	
	local aoc=ValueTree("ccMapping")
	for k,v in pairs (ccMapArray) do
		aoc:setProperty (tostring(v),tostring(k), nil) 
	end
	stateData:addChild (aoc, -1, nil)
	
end -- table not empty
To read that ValueTree table back into Ctrlr on reload:


mi=stateData:getChildWithName("ccMapping")
for i=0,mi:getNumProperties()-1 do
	local k=mi:getPropertyName(i) -- k is the name of the control
	local v=mi:getProperty(k) -- v is the cc number
	ccMapArray[tonumber(v)]=k -- re-populate ccMapArray with data
end
Note: In my case I am reading the value back in as the key to my table. You probably would keep it the same as how it was saved, i.e.


	local k=mi:getPropertyName(k) -- k is the name of the control
	local v=mi:getProperty(i) -- v is the cc number
	ccMapArray[tonumber(k)]=v -- re-populate ccMapArray with data
I don’t seem to be checking whether mi exists . Maybe don’t have to? And mi should probably be declared local.

What Goodweather suggested is stored as <panelCustomData></panelCustomData> and <ccmapping /> will be stored within that node as XML Attributes. (I looked this all up on XML, so I may have the terminology wrong)


<panelCustomData graphlinecolour="4282400832" envbackgroundbrightness="0" <ccMapping WGBENDSW="0" WGPICHRN="10" TVFCUTFR="41"/></panelCustomData></panel>
I would leave it to you to work out how to do this with a three dimensional array or table in lua speak, but it must be doable!

<hr/>

Hi Damien,

Maybe something like this using stateData?

You can save all sysex data as one long string and on load send packets of data back to the synth by locating each F0 in the string:

“Called When Ctrlr state is saved”

m=MemoryBlock(allpaneldata)
stateData:setProperty("myBigString",m:toHexString(1))

and recover with something like:*

“Called When Ctrlr state is loaded”


local str = stateData:getProperty("myBigString")
local data = MemoryBlock(str)
for i = 0, data:getSize() - 1 do
    if data:getByte(i) == 240 then
        panel:sendMidiMessageNow(CtrlrMidiMessage(data:getRange(i, 600):toHexString(1)))
    -- i.e.sysex message = 600 bytes
    end
end
*Untested pseudocode. Let me know if this is what you mean.

Also more reading:

Global Persistent Variables?



In that example data is saved emulating a table key/value structure

See source code of my Juno Alpha panel.

<hr/>

Or just do it that way!!!


x=function()
str="F0 43 12 03 00 00 57 f7" 
m=MemoryBlock()
m:loadFromHexString(str)
end

save = function(--[[ ValueTree --]]stateData)
stateData:setProperty ("mylongsysexdump", m:toHexString(1), nil)
end
P.S. unless you need those hash key or value names recorded …


<hr/>

