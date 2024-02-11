## blog-25-Vst-Standalone-Linux

### compiling for exported standalone/plugin instance

October 30, 2013
### msepsis

- What is the current “proper” recommended procedure for building restricted standalone and plugin instances in linux? I have a customer who wants a build of my blofeld editor specifically for crunchbang (based on debian wheezy).
- Just install the current nightly ctrlr.sh for linux and export like I normally would for os x or windows?
- I saw you had mentioned that the linux build contains both 32 and 64 bit binaries – is this a universal binary like the os x nightly or is there a separate linux ctrlr for x86 and separate binary for x64?


### atom

- No linux does not have universal binaries, they are seperate.
- There is no instance export for linux, i worked on it for a moment but i got into complications, for now you need just the Ctrlr binary and a panel, you need to load it like a panel. I still didn’t get to the point where i can implement an instance export, i need to get into how ELF binaries are built and somehow modify them without using extra libraries (libelf)

February 17, 2015

### msepsis

Hey Atom,
- on this note.. I have a user who wants a binary that will work on debian jessie x64. I have not been able to compile or install either IntroJucer or Ctrlr, To be honest I feel a bit at a loss when going about this – it’s been a LONG time for me – what’s the protocal?
- Install introJucer (how? – i downloaded the library via github but then what after extracting? I see JUCE/extras/Introjucer/Builds, JuceLibraryCode, Source and Introjucer.jucer)
- Use introJucer to compile a binary of (ctrlr?) (my panel within ctrlr?)
- I’m stuck getting IntroJucer compiled/installed, here’s what I get:
```
root@paraHP:/home/rob/JUCE/extras/Introjucer/Builds/Linux# chmod +x Makefile 
root@paraHP:/home/rob/JUCE/extras/Introjucer/Builds/Linux# ./Makefile 
./Makefile: line 3: $\r: command not found
./Makefile: command substitution: line 6: syntax error near unexpected token )
/Makefile: command substitution: line 6: if $(word 2, $(TARGET_ARCH)), , -MMD)
./Makefile: line 6: $\r: command not found
./Makefile: line 7: ifndef: command not found
./Makefile: line 9: $endif\r: command not found
./Makefile: line 10: $\r: command not found
./Makefile: line 11: syntax error near unexpected token $(CONFIG),Debug
'/Makefile: line 11: ifeq ($(CONFIG),Debug)
root@paraHP:/home/rob/JUCE/extras/Introjucer/Builds/Linux# 
```
I hope all is well, I’ve been away for a while, My wife is having a kid in… well.. any day now!!

Cheers,
Rob


### atom

- don’t execute Makefiles, run make
```bash
root@paraHP:/home/rob/JUCE/extras/Introjucer/Builds/Linux# make
```


### msepsis

- of course. so tracked down all dependencies and got IntroJucer built for debian, Could you remind me – How do I use IntroJucer along with the downloaded zip of ctrlr’s source from github to compile a ctrlr standalone and vst/so

Thanks!


### atom

- There was a post somewhere on the forums that explains all the steps.
- But if you enter the Scripts/ directory of the ctrlr repository there is a post-commit script that should do everything for you
```bash
cd ctrlr
cd Scripts
./post-commit
```

### dasfaker

- Noob alert: how to run post-commit script on winx64?

### atom

- I use the git for windows installer package, it has some basic mingw utilities that enable the script to run and do stuff.
- If you want to build the entire project with the post-commit script you might need to change some paths in it to point to msbuild.exe binary.

### dasfaker

- After a hell of problems with VB sdks I finally could run the script (had to rename it to post-commit.sh, otherwise it didn’t run), but I get two errors, this is more or less what I get (it’s in Spanish).
```
“c:\ctrlr\Builds\Ctrlr_Release.sln” (Rebuild destination) (1) ->
“c:\ctrlr\Builds\Generated\Windows\Standalone\Ctrlr_Standalone.vcxproj”
(Rebuild destination) (2) ->
..\..\..\..\Source\Native\Linux\keys.cpp(65):fatal error C1010: unexpected end of file while looking for precompiled header:Did you forget to add ‘#include “stdafx.h”‘ to your source? [c:\ctrlr\Builds\Generated\Windows\Standalone\Ctrlr_Standalone.vcxproj]

“c:\ctrlr\Builds\Ctrlr_Release.sln” (Rebuild destination) (1) ->
“c:\ctrlr\Builds\Generated\Windows\VST\Ctrlr_Standalone.vcxproj”
(Rebuild destination) (3) -> LINK: fatal error LNK1123: error during conversion to COFF: file invalid or corrupt [c:\ctrlr\Builds\Generated\Windows\VST\Ctrlr_Plugin_VST.vcxproj]
```

- I’ve seen in this post something related to the first error, but i didn’t used yet Introjucer nor VB, just run the script, it’s the only modified file to change paths as you suggested.


### atom

- On windows it’s a bit tricky the VS project that gets exported from Introjucer will not compile without some modifications. Some files need to be excluded from using precompiled headers (those are lua.c all the JUCE files, all the native files for linux). Also the file stdafx.cpp needs to be have an option to create the PCH when it’s compiled. Otherwise you will get errors like that.
- I do that sometimes and i commit this to the repo but whenever i have to use Introjucer to update the project this gets reset and i need to change everything and re-commit. Sometimes i forget and commit with the wrong settings, and sometimes I commit from a different platform (MAC/Linux) and running Introjucer on those re-generates the VS project files anyway, so that resets those settings again.


### Visual Studio 2010 and 2013 builds are broken


October 15, 2014 

### synth

It says :
```
Add directive to ‘stdafx.h’ or rebuild precompiled header
1>..\..\..\..\Juce\modules\juce_opengl\juce_opengl.cpp(201): warning C4627: ‘#include “native/juce_OpenGL_linux.h”‘: skipped when looking for precompiled header use
1> Add directive to ‘stdafx.h’ or rebuild precompiled header
1>..\..\..\..\Juce\modules\juce_opengl\juce_opengl.cpp(204): warning C4627: ‘#include “../juce_core/native/juce_android_JNIHelpers.h”‘: skipped when looking for precompiled header use
1> Add directive to ‘stdafx.h’ or rebuild precompiled header
1>..\..\..\..\Juce\modules\juce_opengl\juce_opengl.cpp(205): warning C4627: ‘#include “native/juce_OpenGL_android.h”‘: skipped when looking for precompiled header use
1> Add directive to ‘stdafx.h’ or rebuild precompiled header
1>..\..\..\..\Juce\modules\juce_opengl\juce_opengl.cpp(209): warning C4627: ‘#include “opengl/juce_OpenGLContext.cpp”‘: skipped when looking for precompiled header use
1> Add directive to ‘stdafx.h’ or rebuild precompiled header
1>..\..\..\..\Juce\modules\juce_opengl\juce_opengl.cpp(212): fatal error C1010: unexpected end of file while looking for precompiled header. Did you forget to add ‘#include “stdafx.h”‘ to your source?
```

- This seems to be happening for the Visual Studio 2013 project too.


### atom

- They are not broken, this is a feature not a bug 🙂
- When you save a project with Introjucer, there is not option to exclude source files from using precompiled headers (stdafx.cpp/h) so you need to do that manually everytime you re-save the Introjucer project.
- Also you may notice the x64 is not an architecture in the project, you need to add it first.
- So add the x64 arch.
- Then exclude all juce_*.cpp files, all LuaSocket files (i’ll remove those soon since we don’t need them i think), the lua.c file, and all the .c files in the Native/Linux folder.
- Then it will build.
- It’s tricky you need to select those files, right click, select C/C++ options, select “Not using precompiled headers” and then select Advanced or Command line and uncheck a small checkbox on the bottom right corner that tells something about inheriting options from parent solutions.
- THEN you need to click on stdafx.cpp and select “Create precompiled headers” in the same option.
- And yes everytime i change something in Introjucer i have to do that again (i wanted too do some kind of macro for that but never managed to get it working)


### synth

- Ah cool 🙂 I ll try it.
- Thanks that worked !


### Standalone mode

March 6, 2013 
### dasfaker

Hi Atom

- I would like to know if panels exported to standalone (and vst) will be what we have now (an exe that is Ctrlr with the panel loaded and fully editable) or if they will be locked in some way so no edit could be made on the panels.

### atom

- I never ment to disable all edit capabilities in exported instances, that was never the idea. So not really, the “Panel” menu will be active and you’ll be able to enter edit mode, edit lua methods etc. Do you think it should be different ?

### dasfaker

- Yes, I expected something different. Ctrlr and .panel or .bzpanel on one side, and an exe or dll on the other side, one editable, the other not editable.
- I expected this based on your own words here
- “My question is however, how to change the appearance of such a binary, i’d like it to be more end-user friendly without all the editing stuff”
- “The new feature should help all of you who want to distribute your work on other pages, forums. Even sell your work, if you test your panels with a version and pack them into a binary then you can support them yourselves etc.”
- I’d like to sell some panels, but I don’t like the idea of selling and giving support to something that can be confusing,  edited or modified.

### atom

- You are correct i’ll keep my word i’ll add some options for instance export to disable some of this editing features.


### dasfaker

- Cool, thanks.


### msepsis

- Big +1 on das’s request. This is always what I was expecting from an exported instance. Just a bare bones panel, no ability needed to edit the Lua scripts or anything behind the scenes.
- One suggestion with the standalone instance – make it auto-save midi IN/OUT settings so the user doesn’t need to make the settings then save their own instance (confusing to most users, sad but true). 
- So when the user sets their midi settings, they don’t need to save/export anything. 
- Next time they open the standalone panel the MIDI settings should be auto-saved. 
- My suggestion would be that if ctrlr needs to save these settings to an external file in order to autosave midi device settings, that’s fine just store it in the user’s home tree in a directory named the same thing as the panel name.

### atom

- Well you for now i added a “export->restricted instance” option, try that.

### msepsis

- Nice work. You sure implemented that quickly! (before my post even!)


### Dasfaker (feb 2017)

- On Win x64, you should have two Program Files folders: Program Files and Program Files(x86). Check on both folders where you installed Ctrlr.dll.
- To export a panel as .dll, you must load Ctrlr.dll inside a host and from there, export instance to get a .dll vst of the panel. Export from standalone Ctrlr.exe to get an .exe panel.
- To export a 32bit .exe or .dll you need a 32 bit Windows, and a 64bit Windows to export 64bit instances.
- What I don’t know is how to export VST3 .dll as my DAW is Ableton Live and it doesn’t support VST3.


#### When installing Ctrlr it asks where to install the dll.

- About vst indexes: each modulator must have a unique vst index, otherwise you’ll get into troubles. Bear in mind that this parameter is what the host and Ctrlr uses to assign the values stored to each modulator when recalling parameters. Just use the modulator list window for that, it’s pretty fast to change any value.
- A VM machine works like any Windows app, it host a OS windowed inside your OS, handier than a dual boot.
- Don’t confuse maxExportedParameters with the number of mods a panel can have (should be unlimited). MaxExported parameters is the number of modulators available to the host when running Ctrlr inside the host. Once you export to the panel to dll, this is ignored, and all modulators with variable “Export parameter to VST host” checked will be available to the host.
- Negative values for a vst index? Weird. Just assign a unique number for each mod, sort them the way you want.
- What is important, at least for me, is the index of the mod, not the VST index of the mod. The index of the mod is the order of creation of the mod. First mod created on the panel has index 1, second mod created, index two, and so on. This is not a variable you can change, the only way to do it is editing the .panel file and moving the code of each modulator up or down.
- When accessing mods, it’s much faster using panel:getModulatorByIndex() than any other method, like panel:getModulatorByVSTIndex(). I usually create the mods in the same order a voice dump assign values, so when you assign the values of a dump, first byte goes to first mod index, second byte to second mod index… This way, with a few lines of code you can assign all values to all mods, specially with Roland dumps where usually each byte corresponds to a unique parameter, and it’s really much faster.
- I just gave you an advice based on my experience, you can do it the way you want.
- Any mod parameter can be renumbered, yes.

> human fly wrote:
> so MaxExported parameters are the one that show, say, in the Edit page of a host, where you can draw in automation curves? is that where there’s the default limit of 64 ?

Yes, when using Ctrlr inside host and not panel.dll.

>human fly wrote:
>i cannot see panel:getModulatorByIndex() or the other one. haven’t looked at the ‘panel’ entries much.

This is LUA code.

> human fly wrote:
> on the jv1080, where it needs 3 separate parameters,- at least 2 – or you get a ‘no selection’. you cannot just use the waveform number, it has to have its groupID as well

Yes, there are always exceptions.

### Dnaldoog

- Also Lecleto – when you export as bpanelz or standalone or VST, you must add 24 pixels to the height of the panel first, otherwise you will notice the panel gets truncated 24px at the bottom.
- So if your panel dimensions were 1280 x 1024 you would enter in 0 0 1280 1048 uiPanelCanvasRectangle


### Goodweather (2020)

- .panel is a xml file yo can open in an editor as Notepad++
- .bpanelz is a binary (b) compressed (z) file of a panel including the resources. Use that for sharing your panel otherwise people will mis the images.
- Here is a summary I made in my Step by step guide (maybe it is only in my draft 2.x version):
- Ctrlr standalone reads and can export its data in different formats:
  - XML: creates a .panel file (XML file that is thus readable/editable in Notepad or any text editor).
  - Compressed XML: creates a compressed file with extension .panelz
  - Binary: creates a binary file with extension .bpanel
  - Compressed binary: creates a compressed binary file with extension .bpanelz
  - Compressed binary + resources: creates a file containing the panel, images and fonts used as resources with extension .bpanelz (the best way to share on the net, smallest and loads quick)
  - Instance: creates an .exe file that contains the panel, its resources but also the complete Ctrlr program. It can be used to distribute your panel without having people downloading something. 
- Everything is editable, people can switch mode…
  - Restricted instance: same as Instance (an .exe file is also created) but not editable
  - Use Compressed binary + resources when you want to share your panel with other people by providing them access to all images, the Lua code… so they can modify the panel or look how you built it.
  - Use Restricted instance when you want to distribute the panel in such a way that people cannot modify the panel or look at the Lua code. In a restricted instance the Panel menu is removed and the File menu contains only Quit.

### M.Tarenskeen(nov 2014)

- Building your own binaries on your own system from the sources will solve many of the problems I guess. That’s always a problem with shared libraries.
- It would be nice if the major Linux distributions would include Ctrlr in their official repositories (and keep it up-to-date!). I am not sure if there are any licensing issues preventing that?

### Pierrotlo 

- If I compile (from svn) ctrlr all goes right but at end compilation :
- I have this messages :
```
debug1: ssh_rsa_verify: signature correct
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: Roaming not allowed by server
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey,password,keyboard-interactive
```
- The terminal request to me a password.
- If I use build.sh


### Atom

- The password is for uploading the releases to my server, forget about it.
- But the include errors are about boost, there is a boost.zip file in the Boost folder, you need to unpack it and re-compile (i use a modified version of boost to get things working)(
- Yes there is a makefile, you need to go into: Builds/Generated/Linux/Standalone/ for the standalone Makefile, and to Builds/Generated/Linux/VST for the VST version

### MrMowgli 2016

- Worked perfectly! Thanks Atom!
