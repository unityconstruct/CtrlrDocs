Checking sentiment if Ctrlr SMEs would be interested in a video(well my screenshare) conference for purposes of creating one or more architectural diagrams delineating the tech stack and relationships. Side benefits beyond our own selfish aims, might include encouraging more noobs like myself to dive in, reduce redundant 101-type questions, _(insert something cool here)_. I'll close this out in a couple weeks if SMEs are not really available - or collectively there's just no SMEs for this type of thing.
- _Note: I'm on Gab which provides anonymous conferencing from what I can tell. Brave has something similar, but I haven't tried it. Google might be an option. Teams no longer has free tooling & don't know if Skype has screen share._
- thoughts? Thanks in advance to any respondents!

### Musings
- In a prior inquiry regarding updating Lua to 5.4.6, it was mentioned that boost is decrepit and likely not an option in such a migration &  Sol2(v3) or Luajit might be better options for C++ binding.
- So with most of that shooting right over my head, understanding the architecture & key files/gateways between the technologies might encourage myself (or others) to investigate by eliminating the 90-degree learning curve & narrow down areas one needs to focus on to conduct the integration
- For example, the Lua bindings to C++ look like a bunch of boilerplate code, such that once you figure one out, the rest is largely data entry - then some debugging for Lua language deltas/statements.
- It might take a week of scanning to reverse engineer the ONE key file/interface needed to do something that might actually be trivial to implement.
- Generally speaking I have a loose idea of how things piece together & have been parsing the Lua bindings -> C++ classes in an attempt to understand what EXACTLY is taking place for certain callbacks,etc.
- Can conduct 1:1 sessions to build up drafts or a dogpile with everyone at once - or anyone else can play ringleader.

### half-arsed understanding
```
JUCE ( UI components with C++/Lua hooks ) --> JUCE Exporter --> VS2019SLN+PROJ/C++/Lua code --> Lua Classes --> Lua C++ bindings (--> boost?) --> Ctrlr Core C++
```
### Diagrams / Artifacts
- Assuming this is generally representative, diagrams in mind are:
  - Block Diagram denoting functionality/technology
  - Component Diagram denoting interfaces/classes/methods/files
  - Flow Diagram for Building or maybe other use cases
- Will probably do it Live in Gliffy(Confluence) for quickly creating mocks
  - then dust off Visio for official artifacts
  - then create several versioned exports so anyone may import into their tool of choice & check in to their respective repos
  - then attach everything to this topic or a sticky if anyone has those perms

```
About the Lua subject. It's not an easy task to upgrade the Lua version just because the boost library it depends on to do the Luabind hasn't been maintained for years, the same goes for Luabind. So, if you want to update the Lua version, you might as well look at Sol2 (v3) or Luajit to do the binding to C++ without the need for Boost.
```
### Lua method/class library
- the other thing I'm working on tentatively is aggregating Lua scripts into a structured library
- objective is to fashion the library in a generic enough fashion as to be purpose/vendor agnostic
- with vendor folders for more specific implementation
- the X-Station panel seems to embody the way my mind thinks
- also parsing the 60 Ctrlr Tutorials zip file & it has tons of cool stuff
- adding comments, params, results to each method
- improving method/variable names for more intuitive-intellisense-tastic experience
- not sure of workflows others use, but I'm working out of VSCode ( and would like to get it wired up to be aware of the Ctrlr codebase... it already does nice Ctrl-Click navigation for many things.

ok... end of this novel
cheers!

<hr/>

### Example of Lua Lib improvements

![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/acea7f20-dca3-4cc8-8895-8d16796012ac)

<hr/>

Example: XStation - Seems a model of best practice, but Lua Lib not too approachable ( & likely no there was intention for it to be approachable... just functional )
- _Note: mostly note to self here_
- Think this panel was the reason I even found Ctrlr, then spazzed when I found that Ctrlr was an open source env for this type of stuff
- After parsing several panels, seemed this creator had a solid grasp of design principles/patterns & organization.
- Most methods were device agnostic, but vague on their purpose & have no intellisense-tastic action for understanding design/implementation.
- uses some advance principles, such as the LCD on-the-fly graphics generation
- Extracting methods out so I have a nice re-useable toolkit that is self-documenting and intuitive to draw from.
- The larger the library, the more self-documenting it is & more examples available for learning
- [ ] Lua Lib appears to live in the XML panel definition... 

![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/b5967030-047c-4286-a79c-9afff8eaed53)

<hr/>

### Example of Doxygen Comments
Note: Doxygen encourages these in headers vs source files
![image](https://github.com/RomanKubiak/ctrlr/assets/40268430/d5d16371-3a13-4f91-bbd1-9aa0b8048443)

<hr/>



