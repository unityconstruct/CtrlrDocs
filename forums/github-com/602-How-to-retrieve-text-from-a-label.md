# 602-How-to-retrieve-text-from-a-label
> https://github.com/RomanKubiak/ctrlr/discussions/602


## How to retrieve text from a label? #602
> Answered by damiensellier
> bijlevel asked this question in Q&A
> bijlevel
> 2 weeks ago
I'm a bit ashamed to ask this, because it seems rather straighforward, but I don't seem to accomplish to get text from a label.

The obvious code would be:
```
labelText = panel:getLabel("labelName"):getText()
```

but as soon as I use console to display the value of the variable labelText, CTRLR crashes.

When I use
```
labelText = panel:getModulatorByName("labelName"):getText()
```

I get an error "attempt to call method 'getText' ( a nil value)"
It's no problem to set the the text of the label:
```
panel:getLabel("labelName"):setText("I'm fine")
```

So the question is: what am I missing?


### bijlevel
> 2 weeks ago
I did find the answer (and as so many times, provided by dnaldoog!) by searching the old cltrlr site. This is the way the code should look like:
```
local val = L(panel:getLabel("modulator-1"):getText())
```
the trick is adding "L"! How can one know when to add "L"?

### Ted-juh
>2 weeks ago
Explained by Possemo as:

AFAIK “L” stands for Lua. It will prepare a string gotten from a component for using within Lua.

Also from Possemo:

L() prepares a string for Lua string manipulations (that’s why it is called “L”). In some cases when you get a string from a component it won’t work without L() sometimes it does. I guess it depends what you want to do with the string. Commands like e.g. string.gmatch probably need a “converted” string by L().

Edit again.. sorry:

From DnalDoog himself:

As far as I know the L() macro converts a string to a Lua ‘friendly’ string – I don’t know the details of this at all, but I think getComponent(ledtext1) is a reference to an object, therefore not a const string, which is what L() is for. When you do sName=L(mod:getName()) that’s a string you are formatting with L(), but ledtext1 etc is a variable:

Something like that!

I read a post by Atom stating:
text = L(panel:getLabel("nameInputLabel"):getText())
-- we take the text from the "nameInputLabel" and convert it to Lua type of
-- string, that's why there is the L() macro, otherwise we'd get a String()
-- instance, that might not work well with the native Lua library


### damiensellier
>2 weeks ago
- L calls "luabind" wrapper associated to the component.
- this is why in the ctrlr code you have a list of Luabind functions.
- For exemple this is the function for the component (slider, button etc)
```lua
void CtrlrComponent::wrapForLua (lua_State *L)
{
    using namespace luabind;

    module(L)
    [
        class_<CtrlrComponent, bases<CtrlrLuaObject, Component> >("CtrlrComponent")
            .def("repaint", (void (Component::*)()) &Component::repaint)
            .def("getWidth", &Component::getWidth)
            .def("getHeight", &Component::getHeight)
            .def("setSize", &Component::setSize)
            .def("getX", &Component::getX)
            .def("getY", &Component::getY)
            .def("isVisible", &Component::isVisible)
            .def("setVisible", &Component::setVisible)
            .def("mouseUp", &Component::mouseUp)
            .def("isMouseButtonDown", &Component::isMouseButtonDown)
            .def("isMouseOver", &Component::isMouseOver)
            .def("isMouseOverOrDragging", &Component::isMouseOverOrDragging)
            .def("mouseEnter", &Component::mouseEnter)
            .def("mouseExit", &Component::mouseExit)
            .def("keyPressed", &Component::keyPressed)
            .def("getBounds", &Component::getBounds)
            .def("getRect", &CtrlrComponent::getBounds)
            .def("setBounds", (void (Component::*)(const Rectangle<int> ) )&Component::setBounds)
            .def("setBounds", (void (Component::*)(int, int, int, int))&CtrlrComponent::setBounds)
            .def("getComponentText", &CtrlrComponent::getComponentText)
            .def("setComponentText", &CtrlrComponent::setComponentText)
            .def("setTransform", &Component::setTransform)
            .def("getTransform", &Component::getTransform)
            .def("click", &CtrlrComponent::click)
            .def("setComponentValue", &CtrlrComponent::setComponentValue)
            .def("setValue", &CtrlrComponent::setComponentValue)
            .def("getComponentValue", &CtrlrComponent::getComponentValue)
            .def("getValue", &CtrlrComponent::getComponentValue)
            .def("setComponentMidiValue", &CtrlrComponent::setComponentMidiValue)
            .def("setMidiValue", &CtrlrComponent::setComponentMidiValue)
            .def("getComponentMidiValue", &CtrlrComponent::getComponentMidiValue)
            .def("getMidiValue", &CtrlrComponent::getComponentMidiValue)
            .def("getMaximum", &CtrlrComponent::getMaximum)
            .def("getMinimum", &CtrlrComponent::getMinimum)
            .def("getTextForValue", &CtrlrComponent::getTextForValue)
            .def("getOwner", &CtrlrComponent::getOwner)
            .def("setCustomLookAndFeel", (void (CtrlrComponent::*)(const luabind::object &)) &CtrlrComponent::setCustomLookAndFeel)
            .def("getLuaBounds", &CtrlrComponent::getLuaBounds)
    ];
}
```
This is what you can reach from a lua script within your ctrlr panel for this particular element.

I guess those above don't need the L() , the other unlisted luabind functions require it :)


### class_<CtrlrComponent, bases<CtrlrLuaObject, Component> >("CtrlrComponent")

| method | args |
| - | - |
| repaint | (void (Component::*)()) &Component::repaint |
| getWidth | &Component::getWidth |
| getHeight | &Component::getHeight |
| setSize | &Component::setSize |
| getX | &Component::getX |
| getY | &Component::getY |
| isVisible | &Component::isVisible |
| setVisible | &Component::setVisible |
| mouseUp | &Component::mouseUp |
| isMouseButtonDown | &Component::isMouseButtonDown |
| isMouseOver | &Component::isMouseOver |
| isMouseOverOrDragging | &Component::isMouseOverOrDragging |
| mouseEnter | &Component::mouseEnter |
| mouseExit | &Component::mouseExit |
| keyPressed | &Component::keyPressed |
| getBounds | &Component::getBounds |
| getRect | &CtrlrComponent::getBounds |
| setBounds | (void (Component::*)(const Rectangle<int> ) )&Component::setBounds |
| setBounds | (void (Component::*)(int, int, int, int))&CtrlrComponent::setBounds |
| getComponentText | &CtrlrComponent::getComponentText |
| setComponentText | &CtrlrComponent::setComponentText |
| setTransform | &Component::setTransform |
| getTransform | &Component::getTransform |
| click | &CtrlrComponent::click |
| setComponentValue | &CtrlrComponent::setComponentValue |
| setValue | &CtrlrComponent::setComponentValue |
| getComponentValue | &CtrlrComponent::getComponentValue |
| getValue | &CtrlrComponent::getComponentValue |
| setComponentMidiValue | &CtrlrComponent::setComponentMidiValue |
| setMidiValue | &CtrlrComponent::setComponentMidiValue |
| getComponentMidiValue | &CtrlrComponent::getComponentMidiValue |
| getMidiValue | &CtrlrComponent::getComponentMidiValue |
| getMaximum | &CtrlrComponent::getMaximum |
| getMinimum | &CtrlrComponent::getMinimum |
| getTextForValue | &CtrlrComponent::getTextForValue |
| getOwner | &CtrlrComponent::getOwner |
| setCustomLookAndFeel | (void (CtrlrComponent::*)(const luabind::object &)) &CtrlrComponent::setCustomLookAndFeel |
| getLuaBounds | &CtrlrComponent::getLuaBounds |



### bijlevel
>2 weeks ago
Oh, you guys are so knowledgeable! Thanks for the list, very handy, but where can I find the unbound functions and why for example is 'getname' not bound?

### damiensellier
>2 weeks ago
- I have no idea but this is all the JUCE C++ classes that have been bound to LUA by Roman Kubiak.
- https://github.com/RomanKubiak/ctrlr/tree/8aa00d82127acda42ad9ac9b7b479461e9436aa4/Source/Lua
- The amount of work done by Roman is huge. I really understand why he gave up on the updates because he spent so much time on this project on his own it's insane.
- I guess most of them are here but sometimes you want to do something very specific and you discover it's not working or is not available from where you call the function. Like the popup with option thing to apply LookAndFeel styling.
- It's mostly not related to LUABind itself but from the component structure and hierarchy of CTRLR. Calling function to a child component is 99% working but it's not the case for a parent because owners sometimes are not the one you think :) (Luke I am your father). And other are segregated from each others.
- https://github.com/damiensellier/CtrlrX/blob/master/Ctrlr-Structure.png
- And this is why in our scripts we often start from the panel down to the targeted component with: panel:getChildLevel1():getChildLevel2():...
knowing that panel is actually the panel canvas (CtrlrPanelCanvas)

### Ted-juh
- If you ask me, the Luabind classes are "almost" complete. Well, to be more specific, from Ctrlr's perspective. Lots of Juce classes deal with stuff, like audio, that Ctrlr doesn't use.
- However, some Luabind classes are missing some .def's. Some classes that "might be of use" are not bound at all. If someone here misses something, not audio related, give a shout, I'll be willing to try to bind them.
- Ctrlr 5.3.201 was built on Juce 4.something or 5 whereas Ctrlr 5.6 is built on Juce 6, if I'm right and we're now almost reaching Juce 8. So, lots of things that were added to Juce aren't bound to Lua. And probably because of the reason Damien pointed out, it's quite a task to maintain compatibility.

### dobo365
I remember I found some missing ones but atm don't remember which ones (and I found a workaround) but I was also thinking it would be nice to bind the missing ones.






### damiensellier
Hi Dominique, I remember some of the one you needed. Last year we talked about it, it was some from the valueTree class.
Also there was some of the File class, and some in the xmlElement class.
Popup with option would be nice as we talked about in #597


### dobo365
Thx for being my memory, Damien!
While writing I thought about the File and xmlElement classes but was unsure.
Will look at my emails but as I said, I found some workarounds. I can write and read xml files as a breeze...

### damiensellier
I think the one we needed was insertChildElement
and getAllSubText and also getChildElementAllSubText
https://docs.juce.com/master/classXmlElement.html#a7b9b9a3e739cbf28af0d569d649da776

### Ted-juh
Ok, somewhat updated the bindings to the File Class. Had to leave some out because of errors that I couldn't resolve. The ones with // in front of them are added. Also updated the special locations enum to the one in Juce. Sorry for the formatting in the code block. Not hard to find but just in case: LCore.cpp somewhere around line 60.

```lua
void LFile::wrapForLua (lua_State *L)
{
using namespace luabind;

module(L)
[
	class_<LFile>("LFile")
		,
		class_<File, bases<LFile> >("File")
		.def(constructor<const String&>())
		.def(constructor<const File&>())
		.def("exists", &File::exists)
		.def("existsAsFile", &File::existsAsFile)
		.def("isDirectory", &File::isDirectory)
		// .def("isRoot", &File::isRoot)
		.def("getSize", &LFile::getSize)
		.def("getFullPathName", &File::getFullPathName)
		.def("getFileName", &File::getFileName)
		.def("getRelativePathFrom", &File::getRelativePathFrom)
		.def("getFileExtension", &File::getFileExtension)
		.def("hasFileExtension", &File::hasFileExtension)
		.def("withFileExtension", &File::withFileExtension)
		.def("getFileNameWithoutExtension", &File::getFileNameWithoutExtension)
		.def("hashCode", &File::hashCode)
		.def("hashCode64", &File::hashCode64)
		.def("getChildFile", &File::getChildFile)
		.def("getSiblingFile", &File::getSiblingFile)
		.def("getParentDirectory", &File::getParentDirectory)
		.def("isAChildOf", &File::isAChildOf)
		.def("getNonexistentChildFile", &File::getNonexistentChildFile)
		.def("getNonexistentSibling", &File::getNonexistentSibling)
		.def("hasWriteAccess", &File::hasWriteAccess)
		// .def("hasReadAccess", &File::hasReadAccess)
		.def("setReadOnly", &File::setReadOnly)
		.def("isHidden", &File::isHidden)
		// .def("getFileIdentifier", &File::getFileIdentifier)
		.def("getLinkedTarget", &File::getLinkedTarget)
		.def("isHidden", &File::isHidden)
		.def("getLastModificationTime", &File::getLastModificationTime)
		.def("getLastAccessTime", &File::getLastAccessTime)
		.def("getCreationTime", &File::getCreationTime)
		.def("setLastModificationTime", &File::setLastModificationTime)
		.def("setLastAccessTime", &File::setLastAccessTime)
		.def("setCreationTime", &File::setCreationTime)
		.def("getVersion", &File::getVersion)
		.def("create", &File::create)
		.def("createDirectory", &File::createDirectory)
		.def("deleteFile", &File::deleteFile)
		.def("deleteRecursively", &File::deleteRecursively)
		.def("moveToTrash", &File::moveToTrash)
		.def("moveFileTo", &File::moveFileTo)
		.def("copyFileTo", &File::copyFileTo)
		.def("getNumberOfChildFiles", &File::getNumberOfChildFiles)
		.def("containsSubDirectories", &File::containsSubDirectories)
		// .def("loadFileAsData", &File::loadFileAsData)
		.def("loadFileAsString", &File::loadFileAsString)
		.def("appendData", &LFile::appendData)
		.def("replaceWithData", &File::replaceWithData)
		.def("replaceWithData", &LFile::replaceWithData)
		.def("appendText", &File::appendText)
		.def("replaceWithText", &File::replaceWithText)
		.def("hasIdenticalContentTo", &File::hasIdenticalContentTo)
		.def("getVolumeLabel", &File::getVolumeLabel)
		.def("getVolumeSerialNumber", &File::getVolumeSerialNumber)
		.def("getBytesFreeOnVolume", &File::getBytesFreeOnVolume)
		.def("getVolumeTotalSize", &File::getVolumeTotalSize)
		.def("isOnCDRomDrive", &File::isOnCDRomDrive)
		.def("isOnHardDisk", &File::isOnHardDisk)
		.def("isOnRemovableDrive", &File::isOnRemovableDrive)
		.def("startAsProcess", &File::startAsProcess)
		.def("revealToUser", &File::revealToUser)
		.def("loadFileAsData", &File::loadFileAsData)
		.def("findChildFiles", &LFile::findChildFiles)
		// .def("revealToUser", &File::revealToUser)
		.def("setAsCurrentWorkingDirectory", &File::setAsCurrentWorkingDirectory)
		.def("isValid", &LFile::isValid)
		.enum_("TypesOfFileToFind")
		[
			value("findDirectories", 1),
			value("findFiles", 2),
			value("findFilesAndDirectories", 3),
			value("ignoreHiddenFiles", 4)
		]
		.enum_("SpecialLocationType")
		[
			value("userHomeDirectory", 0),
			value("userDocumentsDirectory", 1),
			value("userDesktopDirectory", 2),
			value("userMusicDirectory", 3),
			value("userMoviesDirectory", 4),
			value("userPicturesDirectory", 5),
			value("userApplicationDataDirectory", 6),
			value("commonApplicationDataDirectory", 7),
			value("commonDocumentsDirectory", 8),
			value("tempDirectory", 9),
			value("currentExecutableFile", 10),
			value("currentApplicationFile", 11),
			value("invokedExecutableFile", 12),
			value("hostApplicationPath", 13),
			value("windowsSystemDirectory", 14),
			value("globalApplicationsDirectory", 15),
			value("globalApplicationDirectoryX86", 16),
			value("windowsLocalAppData", 17)
		]
		.scope
		[
			def("descriptionOfSizeInBytes", &LFile::descriptionOfSizeInBytes),
			def("findFileSystemRoots", &File::findFileSystemRoots),
			def("getSpecialLocation", &LFile::getSpecialLocation),
			def("createTempFile", &File::createTempFile),
			def("getCurrentWorkingDirectory", &File::getCurrentWorkingDirectory),
			def("createLegalFileName", &File::createLegalFileName),
			def("createLegalPathName", &File::createLegalPathName),
			def("areFileNamesCaseSensitive", &File::areFileNamesCaseSensitive),
			def("isAbsolutePath", &File::isAbsolutePath),
			def("createFileWithoutCheckingPath", &File::createFileWithoutCheckingPath),
			def("addTrailingSeparator", &File::addTrailingSeparator)
		]
];
}
```

### damiensellier
Nice!
So I would need to uncomment the one with // ?

I'll add it to my next release. Thanks!

### damiensellier
```lua
// .def("hasReadAccess", &File::hasReadAccess) // JUCE does not have hasReadAccess
```
I commented the one above, it doesn't link to anything in JUCE
```lua
.def("loadFileAsData", &File::loadFileAsData) is really useful for preset files etc
```

### Ted-juh
The readAccess def is just a bool to see if a file has readAccess.

### damiensellier
Hi, I was working on a panel yesterday and was thinking about a LUABIND function that would be awesome to add. I like the midnight colourScheme but a dark grey instead of dark blue/purple would be better...

Since we have all the LookAndFeel_V4 available, that would be great to be able to customize the UI default colours via the LookAndFeel_V4::colourScheme class.
It would help having popups with custom colours, menuBar following the general them etc.
https://docs.juce.com/master/classLookAndFeel__V4_1_1ColourScheme.html#a3a0b01b5a192545b3692ed288597b2f4
the setUIcolour() is the one I'm thinking about :
```lua
void LookAndFeel_V4::ColourScheme::setUIColour 	( 	[UIColour](https://docs.juce.com/master/classLookAndFeel__V4_1_1ColourScheme.html#a3a0b01b5a192545b3692ed288597b2f4)  	colourToSet,
		[Colour](https://docs.juce.com/master/classColour.html)  	newColour 
	)
```
It will allow change the default background colours for windows widgets etc and also all the highlights. So it's a nice base to customize the overall UI and all the components will follow the default LookAndFeel.
Not sure where to place it though. Let us know if you have an idea about how and where to implement that ;)


### dobo365
On this topic, it is always interesting to see how others are coding :)

I'm for example never using panel:getLabel() and setText()/getText() but always using this, whatever the modulator's type is:
```lua
mod:getComponent():setPropertyString("uiLabelText","Some text")
mod:getComponent():getPropertyString("uiLabelText") or mod:getComponent():getProperty("uiLabelText") 
```
with mod being a variable initialized for each modulator with panel:getModulatorByName().

### dnaldoog
and there's also 
```lua
L(panel:getLabelComponent("modulator-1"):getText()) which Atom seems to use a lot in his DEMO panels.
```






