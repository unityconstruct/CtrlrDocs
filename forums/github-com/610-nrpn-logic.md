### Where is the handing for this MidiMessageMultiList in the code? JUCE? Looking for Classname/MethodName
- I think the logic checks token[5] & if [-2] or [-1] DON'T do something that you would otherwise.
- I know what it does & that it works, but NEED to see the logic so I can document & explain it for various targets.


- oh! Almost forgot: The XStation Dissection Guide is being agregated here:
  - https://github.com/unityconstruct/CtrlrDocs/blob/master/ui/xstation/ui-design/xstation-ui-design-guide.md
  - things went off the rail when I was tracing the lua code to explain it

- this is the guy i'm chasing down in the code.
```
CC,ByteValue,MSB7bitValue,99,`-2`
CC,ByteValue,LSB7bitValue,98,`-2`
CC,ByteValue,LSB7bitValue,6,`-1`
```

Thanks in advance for any responses!... 
~uc


- tokenized version: I only remembered the colon thing after copying midiMMList out to document it
```
CC,ByteValue,MSB7bitValue,99,-2:CC,ByteValue,LSB7bitValue,98,-2:CC,ByteValue,LSB7bitValue,6,-1
```



# # Background
- Was sifting through  /Source earlier today dissecting the XStation panel to document good design patterns for several types of needs.
- Wanted to explain the logic to these midiMessageMultiList templates, but needed to figure it out before I could so so.
- I EVENTUALLY ran into it, but fell off in a screencap-blackhole for an hour & when I worked my way back to the original question, I now can't find it for the life of me.
- The code I found is using token[5] as an 'override' (i think), such that it seems to bail out under the conditions for, & ONLY for [-2] and [1]..
- Parsing the 50-page 'Trail of Tears' forum thread and to my amazement... in the midst of all the theory & trials of patience... there really wasn't anything other than a dogmatic statement of "this is how to you `NRPN` using the `modValue`" type stuff.
- `Not looking for an explanation, just a classname/method name/(line# would be awesome, but beggar can't be choosers :-)  )`
- On the bright side, burrowing down into the internals had me face to face with the JUCE util methods... that already have an absurd number of converters.... basically everything I was about to study-up and implement.... I'm 70% convinced what I'm look for is ultimately in the `juce_midiMessage` stuff... 
  - with the main reason it took me so long the first time being that I kept telling myself that "there's no way this logic is buried beyond `/Source/Lua`... or buried beyond `/Source`.. much less buried in `/JUCE`...."
  - now that I know the calculations are already there, pressure is off on all that work & emotionally free'd up to look into exposing things in luabind.... 
  - crashed a lua training course & looks like `setmetatable` & some `__'s`  here & there make that possible, so 

I know I'm close_(yet again)_ b/c I saw tokenization of the ' : ' & was asking myself why using that as delimiter, but then I saw this...& I remember beating my head on this long ago(for difference reasons)
```
CC,ByteValue,MSB7bitValue,99,`-2`:
CC,ByteValue,LSB7bitValue,98,`-2`:
CC,ByteValue,LSB7bitValue,6,-1
```
## Its somewhere in here... or some oddball place .. like MidiHelpers...
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/20adf32a-5695-4ada-90ce-523454ff90a7)
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/451c71eb-a80b-4e99-83c1-1d8046cc1ff0)

- ... that has 2 methods off in their own names space at the top of the MidiMessage Class
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/78807003-4ab2-4943-8810-7eb549b0728e)

