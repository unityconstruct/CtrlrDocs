# change-midimessagetype-of-a-modulator-in-lua

And generaly how to get correct formula when you see a parameter interesting in Utility and don’t ask to others ?

I see 3 classes of modulator parameter:modulator, midi and conponent  but i remember i’ve seen a day  a request as “getConponent ” for a “modulator” parameter or the inverse so i’m not sure….

# # March 12, 2013 at 1:52 pm#7075

Your question made me curious on how this can be done , fooled around a bit and managed to get midi message types to change 🙂
Changing the values of the other properties did not work through Lua at this time, probably because i am not using the exact correct syntax of the properties, I always end up with extra properties attached to the component 😆
I guess i have to use escape characters to skip the spaces in properties like “MIDI Controller number”? Time to study those…

But setting the values of the properties by hand and the switching between types works.

Here’s an example of a combobox  changing the midi-message type of another modulator:

```lua
switchMidiType = function(mod, value)

    sel = panel:getModulatorByName("modulator-2"):getValue()
    modToChange = panel:getModulatorByName("modulator-1"):getMidiMessage()

    if sel == 0 then
        modToChange:setPropertyInt("midiMessageType",9) -- none is 9th option
    elseif sel == 1 then
        modToChange:setPropertyInt("midiMessageType",0) -- CC is 0th option
    elseif sel == 2 then
        modToChange:setPropertyInt("midiMessageType",5) -- sysex is 5th option
    elseif sel == 3 then
        modToChange:setPropertyInt("midiMessageType",1) -- aftertouch is 1st option
    end
end
```

 

I do have to say i can’t see why you would want to do it this way though. I guess you you want a modulator on one spot to “change” types, it would be easier to make multiple modulators stacked on top of eachother and switch their visibility. Imo, of course.

My weekly radioshow @ Belgium's best local radio station - - - - - -
Updates and news about the Emu eos sampler panel

# March 12, 2013 at 2:01 pm#7076

Hecticcc
As for the “general” picture:

You can access the properties of a modulator’s parts by “grabbing” the part you want to manipulate and the (try to) get/set the individual properties.

The above example gets you inside the “MIDI” part of the modulator, if you want to access the component properties you need to type:
```lua
x = panel:getModulatorByName("yourModHere"):getComponent()

-- And then you can do stuff like
x:setPropertyString("componentVisibleName", "WhateverYouWantTheNameLabelToDisplay")
x:setPropertyInt("componentVisibility", 1) -- to make a modulator visible
x:setPropertyInt("componentVisibility", 0) -- to make a modulator invisible
```

Good luck!

My weekly radioshow @ Belgium's best local radio station - - - - - -
Updates and news about the Emu eos sampler panel

# March 12, 2013 at 3:24 pm#7081

atom
Don’t do setPropertyInt setPropertyString, setProperty() is enough Ctrlr will figure out what type it is (saves typing).

Also try to avoid calling panel:getModulatorByName() at runtime, this is the biggest mistake people make, in situation where you have hundreds or thousands of modulators in the panel (those static ones count too) Ctrlr needs to go through the table to find the one you want.

If you are done with designing your panel you can type somewhere in the init method for a panel
```lua
modulator1 = panel:getModulatorByName("modulator1")
component1 = modulator1:getComponent()

-- and then later in your code do

modulator1:setProperty("whatever", 0)
component1:getProperty("whatever")
saves time and typing.
```

# March 12, 2013 at 4:01 pm#7086

Hecticcc
Thanks Atom, gonna mess with this some more now 🙂

Also good to know about the getModulatorByName being too taxing @ runtime, i do that all the time…

Knowing stuff like this will make building the next revision of my panel waaaay smoother!

My weekly radioshow @ Belgium's best local radio station - - - - - -
Updates and news about the Emu eos sampler panel

# March 12, 2013 at 4:33 pm#7089

atom
If you look and the Rendering demo in the Panels dir or in the Panels database you’ll see how i do that.

# March 12, 2013 at 7:18 pm#7095

dasfaker
atom wrote:
Also try to avoid calling panel:getModulatorByName() at runtime, this is the biggest mistake people make

Mainly because in all your examples until now you made use of this method to call a modulator 😀

This is the kind of tricks you should talk about in order to optimize a panel.

If we use panel:getModulatorByIndex() Ctrlr goes through the table too?

# March 12, 2013 at 11:37 pm#7115

atom
Ok the theory behind arrays is very interesting, if anyone is interested: http://en.wikipedia.org/wiki/Array_data_structure

In Ctrlr as in most of software in the world all modulators are kepi in a single dimension linear array of size 0 – n where n = number of modulators, when you want to fetch a modulator as fast as possible, fetch it using it’s index, this is the fastest possible method of accessing memory in a computer, you get a pointer to that modulator and you can run methods on it etc.

When trying to access modulators via some other properties (for example their names). You need to go through the array checking each modulators property and comparing it to the name you passed. Now if the modulator is somewhere on top of the array it will be considerably fast but if you have an array of 1000 modulators and the one you are fetching is on the 999 place, that will take loads of time.

You can create an array of modulators that indexed using their names or some other properties, for that you need something called a Hash Table: http://en.wikipedia.org/wiki/Hash_table. That takes more memory but it speeds up looking for you data in memory. I did not implement a hash array for modulators, i thought about it, but it never happened. You can do some more research and if you can give me a good reason to implement a hash table for modulators i’ll do that.

# March 13, 2013 at 3:45 pm#7141

dasfaker
Thanks for the info, worth looking.

No, I don’t need the hash table, we talked about this before and since then I call modulators by it’s index.

But there is something I miss. How to know the index of a modulator (not the VstIndex as they are not the same). Something like panel:getModulatorByName():getIndex()

# March 13, 2013 at 4:18 pm#7146

atom
That’s a weird question, cause you don’t use indexes like that, you use that usually in a loop or something similar. The modulator is not aware of it’s index in the array, so getModulatorByName():getIndex() won’t work. I can add a method like that but it would be in the panel object. But if you do:

modulatorIndex = panel:getModulatorByName("name"):getIndex()
and then use modulatorIndex it makes no sense, since it’s better to fetch the modulator

modulator = panel:getModulatorByName("name")
and then use that object.

# March 13, 2013 at 4:20 pm#7147

SWB
Probable a beginners question, but does one assign an index to a modulator in the properties panel under ‘modulator CustomIndex’?

# March 13, 2013 at 4:43 pm#7148

dasfaker
SWB wrote:
Probable a beginners question, but does one assign an index to a modulator in the properties panel under ‘modulator CustomIndex’?

No , this is a property of the modulator and is not the index I’m talking about. The index is assigned automatically once you create a modulator.

atom wrote:
That’s a weird question, cause you don’t use indexes like that, you use that usually in a loop or something similar. The modulator is not aware of it’s index in the array, so getModulatorByName():getIndex() won’t work

I use a lot panel:getModulatorByIndex() instead of panel:getModulatorByName() in methods used when the modulator value change (if I trigger any modulator with another one or link modulators) to avoid going through the list if there can be heavy automation on this modulator hoping to optimize time.

# March 13, 2013 at 9:36 pm#7155

Hecticcc
Can’t we use tables to store links to modulators (or their components/properties) and use keys to get to them when we need them? Or is this also too taxing @ runtime because you still need to iterate over alot of keys?

From what i read here this is similar to using hash tables (the part “Tables as dictionaries”)
http://lua-users.org/wiki/TablesTutorial

My weekly radioshow @ Belgium's best local radio station - - - - - -
Updates and news about the Emu eos sampler panel

# March 13, 2013 at 10:49 pm#7156

zeoka
Thanks a lot ! very interesting things

I just want disable midi of 5 on 2100 mods when the device dumps to ctrlr or the device controls ctrlr because of my methods (long to explain 🙂 )!!

I would like to use vst index but i can’t because i can’t re number EXACTLY mods it’s too boring.Tried several times : globaly re numbered but always some  resist + if i add a mod it take the number 0 ! Horrible

Modulatorbyname is enough fast for me at this time…

Question : Customindex what is it? i see all the mods are 0 , but may be with this i can make groups and modify in LUA several modulators at once instead of individual requests ? Cool for Visibility?

 

# March 14, 2013 at 12:05 am#7157

zeoka
Hmm.. Strange :

I’ve done :

cutmod1 = panel:getModulatorByName(“Trigger Sel. sound”):getComponent()
cutmod1:setProperty(“midiMessageType”, 9)  and later

cutmod1:setProperty(“midiMessageType”, 5)

setProperty does not work and disable LUA

but first i’ve done :

panel:getModulatorByName(“Trigger Sel. sound”):getComponent():setProperty(“midiMessageType”, 9) and later same thing with 5 instead of 9
And this worked nice but at the end i’ve the same LUA error

I remember i’ve tried same thing some time ago thing with PropertyInt and i had no error but the midi message is sent anyway…

Attachments:
You must be logged in to view attached files.
# March 14, 2013 at 12:15 am#7159

atom
setting MIDI properties to a Component won’t do you any good.

# March 14, 2013 at 12:45 am#7160

zeoka
You’re right i need more important things 😉

How to get “called after a panel has finished loading”  working because my panel don’t remember midi in/out ( loopback in my head ) ?

May be save that in “called before a panel is saved” ?  wah !

Good night

 

# March 14, 2013 at 11:51 am#7167

atom
What do you mean it doesn’t remeber MIDI IN OUT, those settings are always saved across loading Ctrlr at least in standalone mode.

# March 14, 2013 at 3:05 pm#7172

dasfaker
Panels exported to dll don’t save settings (modulators, midi ports and midi options) inside the Daw. Settings are always those present when the dll was exported.

Even export panel to dll says “the panel could not be created” (I’m talking from memory) but the dll is created.

# March 14, 2013 at 4:14 pm#7175

atom
Well that’s something that needs to be fixed then, i’ll look into it.