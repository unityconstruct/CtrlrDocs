
Successfully built `ctrlr-5.6.0:master` & `CtrlrX-latest:master`
### Version links?
- Ran into what I think is a known 'MIDI not implemented' situation with the tip revisions.
  - for Standalone that is
  - **Note:** might be that MIDI issue only matters for standalone with VST Host providing ports
    - so designing PANELS and export to VST are unaffected by lack of MIDI ports in standalone runtime
- Parsing the board in pursuit of 'due diligence', found 3/4 releases commonly mentioned.
- The more I look at it the more I'm getting turned around on where to pull code from for the various releases
  - though I think I understand 2 versions _(that are mentioned less for the various workflows)_
- **Anyone have links to these versions?**

### Version usage
- saw some conversations about working around the version limitations, based on needed target

_table under dev_
| Feature | Operation | mac | pc | Comment |
| -- | -- | -- | -- | -- |
| VST3 | PANEL DEV | `5.6.23+`  | `5.6.23+`  |  |
| VST3 | PANEL EXPORT | `5.6.23+`  | `5.6.23+` | VST3 builds require at least the Ctrlr version moddified by @jmechnich to work properly with xcode. <br/> https://github.com/jmechnich/ctrlr/releases/tag/5.6-f452347 |
| VST2 | PANEL DEV | PC: `5.3.201` | MAC: `5.3.198` |  |
| VST2 | PANEL EXPORT | PC: `5.3.201` | MAC: `5.3.198` |  |
| AU | PANEL DEV | PC: `5.3.201` | MAC: `5.3.198` |  |
| AU | PANEL EXPORT | PC: `5.3.201` | MAC: `5.3.198` |  |
| STANDALONE | PANEL EXPORT | PC: `5.3.201` | MAC: `5.3.198` |  |
| STANDALONE | PANEL EXPORT | PC: `5.3.201` | MAC: `5.3.198` |  |
| CTRLR | DEV | `CtrlrX-5.6.29` | `CtrlrX-5.6.29` |  |
|  | PANEL |  |  |  |

- My takeways
  - VST3: PANEL DEV: `6.0.26` _(to pick up JUCE or other enhancements + stability.. BUT, no MIDI(?))_
    - requires project rebuild to pick up VST3 instrument names, etc
  - VST3: PANEL EXPORT: `Ctrlr-5.6.23`,`CtrlrX-5.6.29`
  - VST2: PANEL DEV: PC: `5.3.201` | MAC: `5.3.198` 
  - VST2: PANEL EXPORT: PC: `5.3.201` | MAC: `5.3.198`
  - AU: PANEL DEV: `5.3.201` | MAC: `5.3.198`
  - AU: PANEL EXPORT: `5.3.201` | MAC: `5.3.198`
  - STANDALONE: PANEL DEV: `5.3.201` | MAC: `5.3.198`
  - STANDALONE: PANEL EXPORT: `5.3.201` | MAC: `5.3.198`
  - CTRLR DEV: Latest development work is at CtrlrX-`5.6.29`



### Old-Old Official Builds_(ctrlr.org)_
- https://ctrlr.org/nightly/?C=M;O=D
### New-Old Official Releases _(github)_
- https://github.com/RomanKubiak/ctrlr/releases

<hr/>

### Current Tip Revisions [as of 2024-01-29] :
- ctrlr - `5.6.0`= `5.6.23`
- CtrlrX - `5.6.29` _(forked from `5.6.23`)_ _( master merge a few days ago )_


### Ctrlr Versions

_table under dev_

| Repo | Version | Lua | JUCE | Features | Comment |
| -- | -- | -- | -- | -- | -- |
| Ctrlr | `5.3.198` | ???? | ????? | VST2.4,STANDALONE | for MAC |
| Ctrlr | `5.3.201` | ????,| ????? | VST2.4,STANDALONE | for PC |
| Ctrlr | `5.6.0` | `5.1.4` | `6.0.8` |  |  |
| Ctrlr | `5.6.0` | `5.1.4` | `6.0.8` |  |  |
| Ctrlr | `5.6.23` | `5.1.4` | `6.0.8` |  |  |
| CtrlrX | `5.6.29` | `5.1.4` | `6.0.8` |  |  |
| Ctrlr | `6.0.26` | `5.1.4` | `6.0.8` |  |  |


- `6.0.26` - _(likely only available as executable binaries)_
- `5.6.29` _(CtrlrX: master:latest (as of 2024-01-29))_
  - fork of Ctrlr: 5.6.23
  - [master branch](https://github.com/damiensellier/CtrlrX)
  - VST3 support
- `5.6.23` _(= `5.6.0`)_
  - [master branch](https://github.com/RomanKubiak/ctrlr)

- `5.6.0`  _(ctrlr - 5.6.0 tag is on commit, not a release)_
  - VST3 support
- `5.6.1` _(DMG ONLY release for mac)_
  - [5.6.0 Release Page](https://github.com/RomanKubiak/ctrlr/releases/tag/5.6.0)
  - [Ctrlr-5.6.1.dmg](https://github.com/RomanKubiak/ctrlr/releases/download/5.6.0/Ctrlr-5.6.1.dmg)
- `5.3.201` _(likely only available as executable binaries)_
  - VST2/Standalone for PC
- `5.3.198`
  - VST2/Standalone for MAC


# CTRLR 5.6.0: Lua 5.14: References
- [Lua 5.0] 
  - [The official Lua site](https://www.lua.org/start.html)
  - [The official Lua 5.0 HTML manual: Programming in Lua](https://www.lua.org/manual/5.0/)
  - [The 'official' Lua 5.0 PDF version: Programming in Lua](https://archive.org/details/programminginlua0000ieru)
- [Lua 5.1.1] 
  - [Wiley Beginning Lua Programming](https://archive.org/details/manualzilla-id-7144032/mode/2up)



<hr/>
### Comments

## CtrlrX - `5.6.29` - new features related to the GUI lookandfeel_v4
- working on mac/intel

## CtrlrX - `5.6.29` - Canvas/Panel size/scrollbar fix
- the xlinker to give the extra space required for ilok is always added to the jucer file in the xcode mac settings :
`-Xlinker -headerpad -Xlinker 800`

## `5.6.23` - VST3
- If you want VST3, the only option is `5.6.23`, and you will need to recompile it to bake in the plugin name and manufacturer. The binaries are available here - https://godlike.com.au/index.php?id=361
- Develop in stable version, compile VST3 in this version

### benefits
#### What are the benefits of `5.6.23`?
- I only use `5.3.201`. There are documented workarounds for `5.3.201` so it’s very stable for my needs.
  - That's my question, my experience is that under v`5.3.201` all the scripts on "luaModulatorValueChange" get triggered on panel startup but with v`5.6.23` they do not ???
- Scripts don’t get triggered on startup using my code in the other post in `5.3.201` for me at least.
  - … Timer Script "unBlock" does NOT get triggered when your Panel is loaded into v`5.6.23`
- To trigger the unblock function in `5.6.23` maybe take it out of the hidden uiButton and set the timer in an init() script and make the delay 1000ms or something big?
#### I'm using `5.6.23` only to generate VST3 Restricted Instances, which I have now got to work, but that's a whole different topic!
- In the end I have a `5.6.23` specific panel where I just do something very similar to running the Timer from the init() script like you say, and that seems to work fine.
- It just seems a fundamental difference in the way the 2 versions work and wondered if anyone else had noticed?
#### testing it
- I just tried creating a simple panel with a function that sets a uiSlider to value 127. The function doesn't seem to trigger at all when I load the panel like it would in `5.3.201`
  - Exactly, fundamentally different behaviour on Panel Load!


## `6.0.26` - Stable for development
- If you are building VST3 with this, I recommend developing with `6.0.26` which is more stable. `5.6.23` will crash without showing why, unless you manually invoke functions in protected space using Assert. Once code is working, test it in `5.6.23` and then render out your VST3's

## `5.3.201`/5.3.198 - stable releases
- If you just want AU, standalone and VST2, then `5.3.201`/5.3.198 is the way to go.

## `5.6.23` and `6.0.26` - \n
- The main differences are that `5.6.23` and `6.0.26` require an extra option "\n" at the end of writeFileAsText and they won't allow tables to be used as inputs to make MIDI messages. You need to cast them as memoryBlocks first (or convert to strings)

## #162 
https://github.com/RomanKubiak/ctrlr/discussions/162
- Yes, you see it right. I was confudsed too, Roman explained it somewhere but I don't know where exactly. Version numbering got back from 6.x to 5.5. The newest v5.6.x tries to make the transition to JUCE v6.x so it is still in early state. For me v5.5.9 has some problems too, so I suggest staying on 5.3.201 or 6.0.26 for now.
- As I said on another thread I got bitten by this a year ago. 6.x changed the APIs. I developed a few panels. Hit a snag. "You should use 5.31". Ok ... bummer much of my code no longer works.
I will keep saying this until someone kindly tells me how to checkout a specific version - but if you build from source as I do on the Pi it isnt clear what one is building.
- I could be one of the guys who recommended v5.3.201. For a long time 5.3.201 looked like the only choice as developement got stuck in about 2017. Upgrade to new JUCE versions introduced more bugs than features. It looks a bit different now. I think v5.6 could develop to a mature state and could become the new preferred choice. It's cool that some other C++ developers are contributing to the project.

<hr/>


RE: CTRLR DEV
### I imagine there are at least 2 'active' tips various peeps are on: 
- 5.6+: for VST3/JUCE6.0.8, MIDI support disabled during the migration
- <5.6: for everything else
- CtrlrX seemed to have most recent updates
- 6.x: no idea where this is, what features are involved, or known issues rendering it tailored to a specific purpose.

### why I ask
- want to be able to build each project involved in the various workflows, to ensure I can make these available as needed
  - might want/need to patch/tweak projects to integrate features/fixes the community surfaces
- initially just want to develop panels until that's mastered - or minimally grasped _(thinking LUA & design patterns)_
- in the event I get up to speed and want to put hands on the CTRLR code
  - want to help myself by doing it in the correct project based on workflow/target
  - help the community & not spam boards with redundant stuff that's already been addressed
  - if I have something a value to add, it would be in the same project/version others are actively working in/on

i'm sure community grows tired of such lines of inquiry, so secondarily looking to aggregate the topic so future inquiry can be satisfied with a URL (a la Build Guides). Think I saw a NICE WIKI on CtrlrX, that might make a nice home for it... if not, I can fork and do all this there so folks aren't getting pinged on it.


<hr/>

G'day @Godlike-Productions!
- Been pooping stuff out last couple of days in a crash-course. Class Diagrams, extracting Lua API/Methods/Defs...
- I found myself getting turned around dorking in VS while fumbling in VSCode/Ctrlr to grasp the & lua code-behind.
- Extracted the 2 PDFs I know of to *.md so they're in my 100-tab browser session with everything else.
- Think I'm over the initial hump & moving over to LuaLib land.. initially to aggregate & sort, but inspired to build up something of a lua framework to abstract panel calls from the luabind API ( panel -> LuaLib -> luabind ).. doing this makes life less scary when changing c++ core stuff as you can mitigate in the abstraction layer without panels even noticing (for most scenarios)...
- This would work best if such a Lua Framework to live right next to that `inspect.lua` guy
  - was looking at MrD's look-n-feel while in the guts earlier & it seems he was doing basically this exact thing - except hooking the looky-feely stuff, one hooks that CtrlrEditor or CtrlrPanel ( whichever object has all that CtrlrModulator love ).
  - a side benefit to this ( i think ) is that I believe once that's done, one can develop Lua scripts IN visual-studio & get intellisense help & hopefully headoff exceptions before they happen AND let the IDE to you WTF it wants before you do you it
- - that `.29` looks soooooooooooo sexy.
- Steal at will brother.

My main goal is to document architecture & aggregate the knowledge base into more concise usable format - mostly so I save my political capital with the community for when I'm really hurting on something hard. But more importantly, I'd rather deal with this upfront now so I'm not just using 'brute-force' on design techniques/patterns - instead building up some Lua libs before I start implementation b/c there's nothing a fun as doing that once you have 40K lines of crap that makes no sense to me next week even though it works today. Obviously, there's an altruistic facet to it all, in that lurking over the last couple of years, there's a lot of talent & expertise, but partitioned between folks & it would be a win-win if I enable/empower others while I'm working through the 90-degree learning curve.

If anyone wants something documented, such as damien's luabind/juce-look-n-feel, I usually can run with stuff and crank it out - with the idea that people with an actual clue aren't wasting time on trivial matters & having detailed product-info tends to encourage talent to jump in. I've ran like hell probably about 3 times after taking a gander at lua and almost vomiting, but this time 'round I'm in between contracts and am just going to plow through my tasklist as fast as possible so I'm able to bounce in & out and still have a sense of fluency.

My personal TODO/Wiki is here: https://github.com/unityconstruct/CtrlrXY/wiki

Until I'm done with that list, trying to stay out of the way & happy to help out where I can.... hopefully i the realm of the above mentioned technical stuffs. I'm as hack-tastic as they come & prolific with note taking - in no small part b/c my hobbies far exceed my ability to manage them all.  :)

Parsing the boards astonishes me with many of the design patterns, beautiful UIs, and craftsmenship... hat's off to whomever for somehow managing to convince Roman not to flush it all.

ok .. end of the novel-length intro spew... . steal whatever you want from anything I have going on... sorry for length I type 90+WPM and get tarded sometimes when I'm thinking aloud.

Thanks for the inspiration!


<hr/>


> hope you'll design nice panels with those tools!

### lol... that makes 2 of us....! 

- I have a room full of synths that I'd prefer to live in my DAW - namely the E-MU line of Command Stations & several samplers ESI-4K, E4XT, E6400 & lastly Yamaha EX5... I think those before me graciously produced panels for most of the others.
- been playing on `.201`
- already Forked your `5.6.29` so I can document things without spamming everyone's repos
- and built the other 4 popular builds, including your `.28`
- Ran into Ctrlr about 2 yrs ago... realized panel dev would require some investment to yield something kool
- Found myself between contracts, so hoping to get good grasp of the c++/lua codebase ASAP so I can document it meticulously enough to be able to drop it & come back without mass confusion... and to hopefully lower the bar for any newcomers.
- the Windows build & the Step-By-Step PDFs have been invaluable for getting dev env up & understanding how Ctrlr wants you to work... I didn't have those before & reverse engineering things was .... let's say... interesting. I was building successfully on Win+Linux in about 2 hours.
- working through the Step-By-Step that is quite deep for 28 pages.
- just conquered the SetProperty vs SetPropertyInt monster for componentVisibilty, so there's hope!
- the focus on features bugfix is a very intelligent move, as avoid them often simply results in **new** broken features

### Before I freak anyone out with wanting to touch code.. :)  I'm in TechWriter mode for next several months
- my focus is really on parsing the code, lua scripts, and design patterns from the Discussion board to SAVE 2 decades of valuable information... that spans 2 decades of posts. I figure once I process all that into some sort of Knowledge Base or more concise Wiki Markup, I'll be in a better position to evaluate possible codebase contributions... 
- post on Diagrams falls under this Documentation purview as well... I'll eventually get to it on my own failing community interest, but based on last year of posts got the impression that capable people are inhibited for lack of a holistic overview.
  - I do have selfish motivations on the matter, but namely so I can cut to the chase with the documentation.
- beyond diagrams, I'm doing my best to lurk & be unseen.. there's a ton of info to sift through & not up for being a nuisance until i'm seriously hurting on something. 
- my heart is really set on an enhanced Built-In LuaLib, so will be feeling that out in my fork after the Docs thing is under control and publicly available.

Ctrlr is an amazing concept & it ACTUALLY works - even with its quirks, so would definitely like to master it to the extent I'm empowered in keeping it out of the trashbin of history. This is a project that I really believe in. Thanks to all who have put time in & somehow convinced Roman to let them invade his repo. 

Anyway your recent UI update is SLLLLIIIIICKKK sir!


<hr/>



@bijlevel ... lol! yes & no... I have Atlassian Confluence Server at home & spend quite amount of time dumping PDF manuals of my equipment into there so I don't have to search for files all the time ( though I'm finally organized my files too), so like with Guitar I have serious muscle memory & some faster workflow patterns that makes it go very quickly.. Things like REGEX search replace in VSCODE/Notepad++ make transforms of 1000 lines take seconds... I type stupid fast so that helps a bunch _(and contributes to annoyingly long messages like THIS one)_

.. but yeah.. I get desperate at times, but so is sifting through the same c++ files, & getting lost... then looking for the same crap 2 hrs later - and spending the same 20m looking for the same block of code :).. it ends up saving time, and more importantly frustration.. I decided to create a Knowledge Center THEN dive off into panel creation... I tried this about 2 years ago & found myself reverse engineering every step of the way.. This time, going to learn architecture & technique first :-P

BTW: I'm setting up a document repo instead of forking+adding files.. this will cause less confusion for everyone while allowing me to aggregate things without disturbing another repo...  If anyone wants to add it to there Ctrlr project, they can use `.gitmodules`, just like Roman is doing with the `Panels` folder.

### Example:
```gitmodules
[submodule "Panels"]
	path = Panels
	url = https://github.com/RomanKubiak/Panels.git

[submodule "CtrlDocs"]
	path = CtrlDocs
	url = https://github.com/unityconstruct/LuaLib.git
```

I'm running through the 60-lessons thing & THAT is making me desperate! But the payoff is incalculable.. There were some hotshotz in the discussions & I don't think you could pay for better info.

You'll see what I mean about benefits by going here:
https://github.com/unityconstruct/CtrlrDocs/blob/dev-init/blog/blog-02-dumps.md

Once I the "Repo Init" chaos is over, I'll reach out on your note here... (might pick you brain on anything specific to building/dev on Mac)

> @unityconstruct Great overview, must have cost you an awful lot of time! I have some additions to your overview. I have 5.6.23 to 5.6.29 compiled for **Silicon Mac** succesfully using **Juce 6.1.4**. On this Silicon Mac also the AU and VST3 do load OK in my DAW's (Digital Performer 11 and Mixbus 9 for Silicon Mac). I also compiled succesfully these CTRLR (Standalone, VST3) versions for Win 10 and Win 11, but both Windows systems are running within VMWare Fusion, because I don't have a PC. But I'm confident these CTRLR-version will also run on a "real" PC. I did look at the differences between Juce 6.0.8 and 6.1.4. and it seems mainly being about better VST3 support. So I propose to everyone to try and build CTRLR with Juce 6.1.4, because it may fix VST3 issues?






























<hr/>




### CtrlrXY Wiki updated
- Wiki Updated at: https://github.com/unityconstruct/CtrlrXY/wiki

### CtrlrDocs
- No sooner than I got started, the Wiki limitations became quite obvious, so leaving the guide/release pages up there, but created a NEW Repo CtrlrDocs that is 100% separate from the code.
- Considering that 60-lesson zip file will entail 60 pages, the wiki will become a hot mess befor end-of-month :)
- By leveraging `*.md` markdown files (with an onboard `img` to supply graphics), CtrlrDocs repo will basically be a web site, with each asset having browser rendering support.
- I really don't want to diverge off CtrlrX - or cause mass confusion... or accidentally kick off PRs to CtrlrX farting around _(never happened)_ , my main intention with that repo is have something I can play around it without mucking this repo or damien's ( any more than I already have )

### .gitmodules
```gitmodules
[submodule "Panels"]
	path = Panels
	url = https://github.com/RomanKubiak/Panels.git

[submodule "CtrlrDocs"]
	path = CtrlrDocs
	url = https://github.com/unityconstruct/CtrlrDocs.git
```

#### Example Page
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/e7918e16-966b-461e-83c8-2e40e2c64029)

- Just like `Panels` is added to Ctrlt[X] through `.gitmodules` , this repo can be optionally added, yet remain completely independent & genereally accessible:
- With a more complex URL, specific branches/commits can be targeted/frozen to avoid having documentation been 50years old on the CtrlrX master - or the other way around.

- even better yet, this allows anyone to steal CtrlrDocs wholesale (or by forking) and optionally add/remove it to any Ctrlr project/fork with complete independence.

### LuaLib ( CtrlrLuaLib? maybe )
- So keeping all that in mind, seems that my Lua script aggregation can live far & away from Ctrl[X] to void same pitfalls.
- Perhaps sometime in the future this could be quite massive, well commented/documented, and be integrated to a Ctrlr repo/project
- Concepts from CtrlrDocs will make their way here & be categorized, organized.... I'm only on the 3rd blog and there's a ton of top-notch design patterns/principles.
- Once a library is well-formed, stable, and providing full coverage of the LuaLib bindings API, then the natural progression would be to wire-up the utility clases/methods as a framework (think SprintBoot) and this framework would be a safe place to sit panel design on top of... 
- As Ctrlr matures or changes, the framework should provide not only a very intuitive workflow for designers, but act like a nimble shock-absorber that can be re-wired on the back-end with out panels knowing - or caring.
- Theoretically, this would make for a good segue to embed it all in Ctrlr, possibly allowing most everything but data structures & transformation to be done without touching Lua, only needing to type in method names for listeners/callback & dropping in values.
- This is analogous to `... I give two turds about typecasting and markup for bolding/itatlics/cell color alignment... I just click a ton of buttons in 30min and have what I need - usually i don't even have to type anything to transform data(click data>import>select file>click delimeter>OK... done..
  - if I can't click my way to happiness, then Excel has a lightweight formula engine
  - if I can't do it with that, I have macros & a full C#/VB object set to get stupid with.
### .gitmodules
```gitmodules
[submodule "LuaLib"]
	path = LuaLib
	url = https://github.com/unityconstruct/LuaLib.git
```

### CtrlrLuaVendorLib
- so I'm forcing myself to stop dreaming up endless possibilities, before I spew another novel twice as long as the last, but...
- Sure seems handy someday to have the vendor/model sysex trapped in data strucs that are fed to Lua Object Factories to produce Presets/Dumps from our lovely Excel analogy such that one could probably come damn close to doing most everything without too much coding... Like Excel itself
- Where a vendor reuses specs across models, new instrument support seems more approachable..

- I'm an SDET professionally, so my life is largely dedicated to wrapping APIs to enable succinct maintainable Test code where doing more with less is valued. So this is where all this is coming from conceptually
- That's the good news... the bad is I don't know the diff between C/C++ & a hole in the ground... and syntactically, just looks like my cat run up & down my keyboard ( but I'll manage!)


ok shutting up now before I think of something else I'll probably never get around to

Cheers!

