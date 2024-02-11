# CtrlrDocs
Ctrlr Companion Documentation

- This project is designed to be partitioned 100% from `Ctrlr`/`CtrlrX`, yet can be optionally included by using `.gitmodules`
#### .gitmodules with CtrlrDocs included
```gitmodules
[submodule "Panels"]
	path = Panels
	url = https://github.com/RomanKubiak/Panels.git

[submodule "CtrlDocs"]
	path = CtrlDocs
	url = https://github.com/unityconstruct/CtrlrDocs.git
```
#### .gitmodules with custom path in project
- .gitmodules definition allows for custom path of the project.
- applications that are 'git-aware' will show this path as an actual folder in the project and will allow it to be independently managed.
```gitmodules
[submodule "CtrlDocs"]
	path = Docs/CtrlDocs
	url = https://github.com/unityconstruct/CtrlrDocs.git
```

- Ctrlr is not exactly intuitive, but it is VERY capable & the information IS out there, just not in a digestable form
- 10 years ago, when the original developer was active on the project, there were ongoing design discussions in its forums at Ctrlr.org.
- Having all this information fragmented across years of discussions makes it overwhelming to parse & use.
- I found a `60-lessons.zip` that has 60 text files aggregated from these forums, so am porting this to `Markdown` `*.md` files that are very portable and for which `viewers` exist & normally embedded in every IDE and web browers.
- as such this repository serves functionally as a website, with github being able to render markdowns as html, including syntax highlighting for Lua and many others.

#### Example Lua block:
```lua
function sendPatch()
	for n = 0, 514, 1 do -- the amount of modulators to send 
		a = panel:getModulatorByIndex(n) -- get modulator with index n			
		b = a:getModulatorValue() -- get it's value
		a:setModulatorValue(b, false,true,false) -- set it's value, sending it to the synth.
	end
end
```

If you have tips or other information that you'd like to preserve, just post it in the Discussions & it will be placed in queue.
