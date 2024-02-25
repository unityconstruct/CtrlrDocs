# Parameter DataType Engine Design
_note: throw the Lua code into VSCode to see the dot-syntax making life easy_
I'm lazy, so jacking with parameter bundles & doing the logic in a sea of If/then's doesn't seem appealing, so... curious on something.

It's likely this has been brought up & laughed back into a hole, but sure seems like it would work... & provide a reusable means of working with parameters with very little end-user coding .... should be more giving objects property values & simply calling a function with it... without ANY care in the world as to the details.. ( ONCE you know enough about the hardware & its comm style). 

- is there a finite set of methods for parameters?
- while there are many ways parameters can be packed for hardware with tons of parameters to account for
  - aren't there a finite number of methods used?
  - for example:
    - a unit might pack multiple parameters in groups of 3,4,5,6
    - each of these groups might be packed in the same way such that once knowing:
      - PARAM_ID
      - PARAM_DATA_TYPE
      - PARAM_VALUE_MIN
      - PARAM_VALUE_MAX
      - MIDI_PACKING_STRATEGY_TYPE
      - MIDI_PACKING_STATEGY_PARAM_COUNT
    - Seems that even if the number of parameters packed changes, 
      - the number of strategy types, param counts, and MIDI bit count are finite
      - and once the logic is created for packing ADSR Voice2
      - the same logic is used for ADSR Voice1

### Data Normalization & Supporting Objects

#### hardware comm type
- This table enumerates the shuttle in which parameters are carried to/from a destination/source
- it doesn't care about about the parameter values/data type
- only cares about what Chinese Math to use & how many params there are

| MIDI_COMM_BITS | MIDI_PACKING_STRATEGY_TYPE | MIDI_PACKING_STATEGY_PARAM_COUNT | 
| - | - | - |
| 7 | A | 1 |
| 7 | A | 2 |
| 7 | A | 3 |
| 7 | A | 4 |
| 7 | A | 5 |

#### the parameter
- the parameter doesn't care about the package, only its DataType & value
- the Type determins the Chinese Math to convert VALUE in the UI & what needs to be stuffed in the pacakge

| PARAM_ID | PARAM_DATA_TYPE | PARAM_VALUE_MIN | PARAM_VALUE_MAX |
| - | - | - | - |
| VOICE1_FILTER_CUTOFF | PARAM_128VALUE_-64_63 | -64 | 63  |
| VOICE1_FILTER_RESONANCE | PARAM_128VALUE_0_127 | 0 | 127  |
| VOICE1_FILTER_TYPE | PARAM_128VALUE_1_128 | 1 | 128  |


#### the objects
- so things are broken up by Possibilities
  - and Objects combine those Possibilities into a Definition
- The Conversion engine parses these, applies the Chinese Math using A LIBRARY of Packing routines
- This works GREAT!! IF the number of routines is finite.
- If the number of methods of packing only ever handles 1-10 parameters, then that's 10 routines.. it doesn't care about translating UI VALUE to MIDI MESSAGE DATA TYPE
  - nor what destintation params are bundled

### Mockup
- the varieties might be near infinite, if so, second best case is maybe theres 20 different types that account for 80%... 
- might be laughable, but just throwing it out there for a feasibilty check.
- I don't know what the options are, nor the calculations, but wiring up the DataStructs, Objects and Methods seems fairly straight forward.
- If it is broken down into modular pieces, no one piece is doing more than one or two calculations - that themselves are in objects or a function lib.

```lua

--- Enum for the Parameter's  Real-World MIN/MAX values
MidiParameterDataType = {
    "PARAM_128VALUE_-64_63",
    "PARAM_128VALUE_0_127",
    "PARAM_128VALUE_1_128"
}

--- Enum for Hardwards Packing Logic type
PackingStrategy = {
    "BIT7_MSB_LSB",
    "BIT7_LSB_MSB",
    "BIT7_LSB_MSB_1_PARAMS",
    "BIT7_LSB_MSB_2_PARAMS",
    "BIT7_LSB_MSB_3_PARAMS",
    "BIT7_LSB_MSB_4_PARAMS"
}

--- Enum for Comm Direction
CtrlrMidiCommDirection = {
    "ToHardware",
    "ToCtrlr"
}

--- MidiParameter Object
CtrlrMidiParameter = {
    PARAM_NAME = "DEFAULT",
    PARAM_ID = "2580",
    PARAM_DATA_TYPE = MidiParameterDataType.PARAM_128VALUE_0_127,
    PARAM_VALUE = 15,
}

--- MidiMessage Package containing MidiParameterObjects
CtrlrMidiParameterPackage = {
    Parameters = CtrlrMidiParameter{},
    PackingStrategyToHardware = PackingStrategy.BIT7_MSB_LSB,
    PackingStrategyToCtrlr = PackingStrategy.BIT7_LSB_MSB_3_PARAMS
}


--[[
    DO THE CONVERSION..!! WORK THAT MAGIC!!! I DON'T CARE WHAT IT DOES!! I GAVE IT CORRECT VALUES!!!
--]]

---Convert Parameters to a MidiMessage using a CtrlrMidiParameterPackage containing one or more parameters and a comm direction
---function will call needed conversion function based on the Package's PackagingStrategy, direction, number & datatypes of the parameter
---@param package CtrlrMidiParameterPackage
---@param direction CtrlrMidiCommDirection
function CtrlrMidiPackagerConvert( package, direction )
    -- call MidiParameterPackerPrep(package) -- to get PackingStrategy & direction
    -- foreach CtrlrMidiParameter in package -- to translate Parameter VALUE to its MidiParameterDataType used for communication
      -- paramHexValues[i] = call MidiParameterPacker(package.Parameters.Count)
    -- end
    -- midiPayload = call MidiPackage(paramHexValues)
    -- call MidiSend(midiPayload)
end



-- CtrlrMidiParameterDataTypeConversionType = {
--     PARAM_DATA_TYPE = "", 
--     MIDI_PACKING_STRATEGY_TYPE = CtrlrMidiParameterPackage.PackingStrategyToCtrlr
-- }






-- MidiParamterMinMaxType = {
--     "MIN__64_MAX63",
--     "MIN0_MAX127,
--     "MIN1_MAX128"

-- }
```

#### Syntax Highlighting & AutoSuggestions
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/8cde265e-c662-41a2-82b8-466d2615097d)



<hr/>
BTW: I started crawling ctrlr.org yday & its picked up quite a few panels & will probably get ALL the form posts.... 
I'm not the best at it, so had Archive.org's team kick off #archivebot for it, so not sure how long it will take, but the info will be saved off for the foresable future. I'll be pushing the panels to CtrlrPanels once my crawler is done and get 'em somewhat organised, hopefully with their images

![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/b5e0748e-3014-4e77-8b16-8c199a2a38e3)

Trapping this post

- Just messing around looking at was I got, I was running into all sorts of Esoterica on data techniques
- about the most maddening thing of it all is the 'auto-correct' doing what it can to trash every Lua block of commented code with:
-   `--` => `–`  <== this useless character

- first post I looked at on my PC:
```
here’s the sysex results i’ve got from it so far, to have
a look at the format:
(this is what i discovered reading off messages with my lazy
technique of hitting ‘enter’ and picking them up with midiox)

voice bulk dump (voice #00, BD1):
43 Bytes:(highlighted voice number with asterisks)

F0 43 00 0B 00 23 4C 4D 20 20 38 35 31 35 56*00*02 78
36 07 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 36 F7

single parameter message:
(‘??’ was where i found variations, i think; must be msb)
F0 43 10 03 51 V# pp ?? vv F7

eg:(value byte as per what i found with this voice)
voice edit/job 02-05
decay F0 43 10 03 51 41 01 19 F7
brate F0 43 10 03 51 41 02 00 F7
bRange F0 43 10 03 51 41 03 00 F7
level F0 43 10 03 51 41 04 36 F7
pan F0 43 10 03 51 41 05 08 F7
(etc.)
and here’s what happens with negative values,
eg: pan:

repeat pan: -14<>+14
(4th repeat,pan = 14h (param byte)

F0 43 10 03 51 41 14 72 F7 > 72h-7Fh = <-14 - -01<0>
(last values)
F0 43 10 03 51 41 14 0E F7 > 00h-0Eh = <0> – +14>
(first values)

…
just to have a look. can’t remember off top of my head
what i concluded from the -/+ parameters, but it made
sense seen as a midiox list.
right, i’m off to make a little fader with a message
on it to see if i can get the RX7 to respond.
```

![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/c2b60422-e391-41bb-9a62-87b629ab9c6b)


@Godlike-Productions 
<hr/>

Hope I can get ahold of the crawl logs, b/c its like picking grapes off the vine
https://ctrlr.org/?ddownload=34227
https://ctrlr.org/?ddownload=34216
https://ctrlr.org/?ddownload=84369
https://ctrlr.org/?ddownload=23241
https://ctrlr.org/?ddownload=70112
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/efe0d157-be32-45d5-9a44-b5f0aa84dac8)



<hr/>

@Godlike-Productions .. yessir! That's the type of stuff I'm after... 
- at present, less concerned with valuable stuff than I am with aggregating EVERYTHING to a centralized spot... if for any other reason that I wouldn't know what's golden vs a turd at this point.
- that said, your point taken, in that where there is valuable ( CORRECT! ) information... probably a good idea to make its visibility highly pronounced.
- I'm currently running through the X-Station panel & breaking it down 100% to where I know EXACTLY what everything is doing.
  - theoretically, I can then use it for experimentation with new Lua design patterns
    - OR UI<->Lua design patterns
- my hope is that there are a handful of Design Patterns that are extremely lean, well organized, fully featured - figure them out, then create meticulous guides that walkthrough the process.
![xstation panel](https://raw.githubusercontent.com/unityconstruct/CtrlrDocs/master/ui/xstation/ctrlr-xstation-midi-sync.png)

### CtrlrPanels
- https://github.com/unityconstruct/CtrlrPanels/blob/master/README.md
- I pushed all the panels the crawler found on Ctrlr.org...
- it also picked up all the forum posts & did some initial cleanup as that site is spammed like a MOFO
  - all the form stuff is going to be archived in CtrlrDocs & left alone while I look at the code & finished panels.
 
If anyone has any additional test/proof of concept panels/code they like preserved ( or have there lua code extracted for inclusion in a LuaLib ) just lmk. X-Station implementation sure looks like its doing much of what I proposed in terms of consolidation on the parameter conversion hell MIDI is known for. 

...more to come...


<hr/>

## gitsubmodules example
- CtrlrXY that uses git submodules to optionaly pull in the other repos as needed/wanted.
- this ensures they are modular, reusable and independently updateable
- also allows implementing Ctrlr projects to declare a specific commit to avoid the master branch in a repo from trashing a project due to changes, like supporting new hooks/objects, etc.
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/26dbba1c-455e-4643-ad71-08b753fd67cf)

<hr/>



<hr/>



<hr/>