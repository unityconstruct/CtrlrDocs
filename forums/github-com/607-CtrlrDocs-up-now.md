### CtrlrDocs Repo
- Created CtrlrDocs Repo for aggregating "all things Ctrlr" besides the actual Code
  -  https://github.com/unityconstruct/CtrlrDocs
  - Steal at will, but probably recommend on waiting a month or two while I get it settled and populated with well-formed files.
  - That `60-lesson.zip` package has been FULLY ported ( minus 2 PDFs that are in queue )
    - I'm about to figure out wtf to do with the accompanying panels as the naming is wildly out of bounds and counter intuitive
    - If anyone has panels from the old site( or here for that matter ) please ping me _( obviously not the pay-to-play panels )_
      - I'm scraping the old site now, but know login is required for the links to be generated on page load, so don't know what all I can get from htTrack.
      - I know there are tons under the downloads and plowed through that a year or two ago - the UI buttons were flaky & hit-or miss, so don't know if I gave up at some point or made it all the way through. I do have several from there.
- As is, there's a wealth of info for BOTH devs ( class diagrams, lua methods ported to table form that makes life easier if needing to quickly reference/copy.. 
- the `blog-##-*.md` files have a ton of lua examples & `battles of wit against Ctrlr Panel Challenges` where devs seem to always defeat that week's nemesis, so the value extends way beyond just lua code.

### Wiki
- Wiki has (redundant copies of) PDF Ports and other high-value information
  - https://github.com/unityconstruct/CtrlrDocs/wiki

### markdown files
- Original Plan was to fork `CtrlrX`, then add KnowledgeBase stuff to the Wiki, but the wiki `SUX` on a level I can't describe in a public setting, but will just ask "we're in 2024 right? How is it that the Wiki doesn't have page-nesting support".. Anyway, I digress.
  - Once I got started using Wiki it became readily apparent that adding another 60 pages for the 'blog-lessons' port to MD wasn't going come close to yielding anything usable.
  - So no sooner than I was comfortable in my fork, I Created `CtrlrDocs` & pushed everything over there.

- I port most everything to Markdown *.md instead of using PDFs now that most everything has built-in rendering/preview - yet that are still usable in text format.
  - the biggest WIN is that VSCode and other IDEs will actually apply syntax-highlighting to damn near all filetypes from bash to yaml.
  - this results in text files that are portable, but still render to HTML/Word formatting when needed.
  - in the case of github, it renders them just as if they were a web page.
  - So instead of the SUX Wiki, this repo works as though its a web site, and I have the nesting I want

### gitmodules
- so just like the Panels folder in Ctrlr[X], CtrlrDocs can be added by adding a spec for it in `.gitmodules`
- there really no need for it at present, but when properly cleaned up, adding it to releases would arm the end-use with plenty of information to build & create panels from noob-guru & I can only assume it would reduce Help Requests, as sad as that might make some.
- also nothing prevents Ctrlr from having a build-in renderer that opens PDF/IMG/MD/TXT using C++ libraries
```gitmodules
[submodule "Panels"]
	path = Panels
	url = https://github.com/RomanKubiak/Panels.git

[submodule "CtrlrDocs"]
	path = CtrlrDocs
	url = https://github.com/unityconstruct/CtrlrDocs.git
```
- a custom path in the implementing project as be specified, such as `path = Docs/ctrlr-docs`
```gitmodules
[submodule "CtrlrDocs"]
	path = Docs/ctrlr-docs
	url = https://github.com/unityconstruct/CtrlrDocs.git
```


### File Hierarchy
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/07d8e944-e6da-4326-9ac1-b23b6317ae53)

### Markdown Rendering Example
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/6527d5d6-c545-4bb4-a1a6-a238601ea544)

### Lua lib
- About to start extracting the RAW Lua code from these blog entries into some sort of reference.
  - if there are snippets or other forms - such as saved discussions/emails/whateva - feel free to pass these on; I'll probably create a sandbox folder to store things so they will be saved while they are pending disposition.
- I'll be aggregating everything to this repo initially, but once I things are shaping up and have a hierarchy in place where methods/classes are well organized, will be standing up yet another repo LuaLib or CtrlrLuaLib in the same model.

Anyway, guess this is just FYI
Cheers! 
...and wish me luck. haha
![dyn-o-mite](https://imgs.search.brave.com/ycD2Sx-Kprc_FS5suLTDbhj-Z8IdA-DHfRpZS1QMPMM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLmV0/c3lzdGF0aWMuY29t/LzI2OTIxODE1L3Iv/aWwvYjFkOWI0LzM0/NjU5MzMzNDAvaWxf/NjAweDYwMC4zNDY1/OTMzMzQwX2Mzamsu/anBn)