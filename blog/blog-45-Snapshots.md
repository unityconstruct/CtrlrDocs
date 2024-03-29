## blog-45-Snapshots

### Possemo 2016

“Program Snapshot” saves a snapshot of all current modulator values. It is a simple way of storing patches and send them to the synth. In the newer Ctrlr releases the menu is broken so it is not possible to send the snapshot to the synth. But you can view the snapshots in the menu “Midi Library”. Not all synths will appreciate being hit by a ton of parameter values, so it is not the best way of storing and sending patches anyway.

### Wikter

Adjust the midi message timing to avoid overloads in your machine. It will take some more time but the transmission will be safer.

Sorry, I forgot to tell that with the midi library you can build entire banks, just create a bank and copy the snapshots to it.
You have to do it by keyboard or by copy+paste, drag n drop doesn’t works here.

### wildthing 2019

Hi guys, I’m trying to improve my panels and I would like to add a tab with a library made of saved snapshots. My idea is to create a kind of midi bank without using sysex but nothing than midi controls.

The first thing i need to understand is how to get all the modulators values from the panel and pack them into a single file.

I stress out that i don’t want to translate midi CC into sysex but just create a patch file unsing snapshot values.
I’ve tried to figure out how to do this thing but it’s too difficult to me so i realy need some help. Do you have any idea about how can i do that? Any hint would be much appreciated!

### Dnaldoog

Hi wildthing,

Have a look at this panel:

https://github.com/RomanKubiak/Panels/blob/1aaeb12ad9cd96a16cddb37fd2a2c8ca98f87a01/DEMO/DEMO%20-%20Files.panel

It will show you how to save and reload a set of records as a binary file.

You would collect your uiSlider values into a lua table and then convert that table into a MemoryBlock using method createFromTable({}) and write to a binary file.

One way of doing that might be to record value changes using a callback function set in [Called when any modulator changes it’s [sic] value] into a lua table, which is then converted into a file (see function saveContentAsData() in the DEMO file). You can filter which kind of modulator is to be recorded using modulator:getUiType() in that callback function.

### Demopanel

```xml
<?xml version="1.0" encoding="UTF-8"?>

<panel name="DEMO - Files" panelAuthorName="Roman Kubiak" panelAuthorEmail="kubiak.roman@gmail.com"
       panelAuthorUrl="http://ctrlr.org" panelAuthorDesc="" panelVersionMajor="1"
       panelVersionMinor="0" panelVersionName="Buttcheek" panelVendor=""
       panelDevice="" panelMidiSnapshotAfterLoad="0" panelMidiSnapshotAfterProgramChange="0"
       panelMidiSnapshotDelay="10" panelMidiInputChannelDevice="1" panelMidiInputDevice="-- None"
       panelMidiControllerChannelDevice="1" panelMidiControllerDevice="-- None"
       panelMidiOutputChannelDevice="1" panelMidiOutputDevice="-- None"
       panelMidiInputFromHost="0" panelMidiInputChannelHost="1" panelMidiOutputToHost="0"
       panelMidiOutputChannelHost="1" panelMidiThruH2H="0" panelMidiThruH2HChannelize="0"
       panelMidiThruH2D="0" panelMidiThruH2DChannelize="0" panelMidiThruD2D="0"
       panelMidiThruD2DChannelize="0" panelMidiThruD2H="0" panelMidiThruD2HChannelize="0"
       panelMidiRealtimeIgnore="1" panelMidiInputThreadPriority="7"
       panelMidiProgram="0" panelMidiBankLsb="0" panelMidiBankMsb="0"
       panelMidiSendProgramChangeOnLoad="0" panelMidiProgramCalloutOnprogramChange="0"
       panelMidiMatchCacheSize="32" luaPanelMidiReceived="-- None" luaPanelLoaded="-- None"
       luaPanelBeforeLoad="-- None" luaPanelSaved="-- None" luaPanelProgramChanged="-- None"
       luaPanelGlobalChanged="-- None" panelFilePath="C:\devel\ctrlr\Panels\DEMO - Files.panel"
       panelUID="8.iY69EcelDpL" panelModulatorListColumns="" panelModulatorListCsvDelimiter=","
       panelModulatorListXmlRoot="ctrlrModulatorList" panelModulatorListXmlModulator="ctrlrModulator"
       panelModulatorListSortOption="1" panelGlobalVariables="-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1:-1"
       panelResources="" panelPropertyDisplayIDs="0" ctrlrMenuItemBackgroundColour="ffffffff"
       ctrlrMenuItemTextColour="ff000000" ctrlrMenuItemHighlightedTextColour="ffffffff"
       ctrlrMenuItemHighlightColour="ff4364ff" ctrlrMenuItemFont="&lt;Sans-Serif&gt;;13;0;0;0;0;1"
       ctrlrMenuItemSeparatorColour="33000000" ctrlrMenuItemHeaderColour="ff000000"
       ctrlrMenuBarBackgroundColour1="fff7f7f7" ctrlrMenuBarBackgroundColour2="ffcccccc"
       ctrlrMenuBarTextColour="ff000000" ctrlrMenuBarHighlightedTextColour="ffffffff"
       ctrlrMenuBarHighlightColour="ff4364ff" ctrlrMenuBarFont="&lt;Sans-Serif&gt;;13;0;0;0;0;1"
       panelIndex="0">
  <uiWindowManager>
    <uiChildWindow uiChildWindowName="LuaMethodEditor" uiChildWindowState="716 180 1069 784">
      <uiChildWindowContentState luaMethodEditor="&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;&#13;&#10;&#13;&#10;&lt;OPEN id=&quot;LUA Method&quot; scrollPos=&quot;0&quot;&gt;&#13;&#10;  &lt;SELECTED id=&quot;/LUA Method/readFileAsText&quot;/&gt;&#13;&#10;&lt;/OPEN&gt;&#13;&#10;;0fb03b362893366ddead9cb69141ad0c:18cebd1c89867b386dea546422d67321:c758a294307623159c6139994d22a81c:3277f1ef172592248c3aa0ce603e5f87"/>
    </uiChildWindow>
  </uiWindowManager>
  <midiLibrary luaMidiLibrarySend="-- None" luaMidiLibraryRequest="-- None"
               luaMidiLibraryProcess="-- None" luaMidiLibraryConfirm="-- None"
               luaMidiLibraryUndefined="-- None" midiLibraryCustomRequests="">
    <midiLibrarySnapshots name="Snapshots"/>
    <midiLibraryFirmware midiLibraryCanGetItem="1" midiLibraryCanSendItem="1"/>
    <midiLibraryEditBuffer midiLibraryCanGetItem="1" midiLibraryCanSendItem="1"/>
  </midiLibrary>
  <luaManager>
    <luaManagerMethods>
      <luaMethod luaMethodName="readFileAsText" luaMethodCode="--&#13;-- Called when a modulator value changes&#13;-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html&#13;-- @value    new numeric value of the modulator&#13;--&#13;readFileAsText = function(mod, value)&#13;&#10;&#9;if panel:getBootstrapState() then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;fileToRead = utils.openFileWindow(&#13;&#10;&#9;&#9;&quot;Open file to read as text&quot;,&#13;&#10;&#9;&#9;File.getSpecialLocation(File.userHomeDirectory),&#13;&#10;&#9;&#9;&quot;*.*&quot;,&#13;&#10;&#9;&#9;true&#13;&#10;&#9;)&#13;&#10;&#13;&#10;&#9;if fileToRead:existsAsFile() then&#13;&#10;&#13;&#10;&#9;&#9;-- Update the file path&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;lastFileReadPathL&quot;):setText (&quot;&gt; &quot;..fileToRead:getFullPathName())&#13;&#10;&#13;&#10;&#9;&#9;if fileToRead:getSize() &gt; 8192 then&#13;&#10;&#9;&#9;&#9;&#9;utils.warnWindow(&#13;&#10;&#9;&#9;&#9;&#9;&#9;&quot;File too big&quot;, &#13;&#10;&#9;&#9;&#9;&#9;&#9;&quot;Labels are not designed to show too much data, please choose a file that's smaller then 8kb.\&#13;&#10;The file you chose is &quot;..fileToRead:getSize()..&quot; bytes&quot;&#13;&#10;&#9;&#9;&#9;&#9;)&#13;&#10;&#9;&#9;&#9;return&#13;&#10;&#9;&#9;end&#13;&#10;&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;textContentL&quot;):setText(&#13;&#10;&#9;&#9;&#9;fileToRead:loadFileAsString()&#13;&#10;&#9;&#9;)&#13;&#10;&#9;end&#13;end"
                 luaMethodLinkedProperty="" luaMethodSource="0" uuid="3277f1ef172592248c3aa0ce603e5f87"
                 luaMethodValid="1"/>
      <luaMethod luaMethodName="readFileAsData" luaMethodCode="--&#13;-- Called when a modulator value changes&#13;-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html&#13;-- @value    new numeric value of the modulator&#13;--&#13;readFileAsData = function(mod, value)&#13;&#10;&#9;if panel:getBootstrapState() then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;fileToRead = utils.openFileWindow(&#13;&#10;&#9;&#9;&quot;Open file to read as data&quot;,&#13;&#10;&#9;&#9;File.getSpecialLocation(File.userHomeDirectory),&#13;&#10;&#9;&#9;&quot;*.*&quot;,&#13;&#10;&#9;&#9;true&#13;&#10;&#9;)&#13;&#10;&#13;&#10;&#9;if fileToRead:existsAsFile() then&#13;&#10;&#13;&#10;&#9;&#9;-- Update the file path&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;lastFileReadPathL&quot;):setText (&quot;&gt; &quot;..fileToRead:getFullPathName())&#13;&#10;&#13;&#10;&#9;&#9;if fileToRead:getSize() &gt; 8192 then&#13;&#10;&#9;&#9;&#9;&#9;utils.warnWindow(&#13;&#10;&#9;&#9;&#9;&#9;&#9;&quot;File too big&quot;, &#13;&#10;&#9;&#9;&#9;&#9;&#9;&quot;Labels are not designed to show too much data, please choose a file that's smaller then 8kb.\&#13;&#10;The file you chose is &quot;..fileToRead:getSize()..&quot; bytes&quot;&#13;&#10;&#9;&#9;&#9;&#9;)&#13;&#10;&#9;&#9;&#9;return&#13;&#10;&#9;&#9;end&#13;&#10;&#13;&#10;&#9;&#9;-- We need a memory block to load our file into, this can be created at some other point in time&#13;&#10;&#9;&#9;-- if we expect the files to be big and the amount of memory we need is higher, it will pre-allocate&#13;&#10;&#9;&#9;-- that memory at the moment that MemoryBlock() is called&#13;&#10;&#9;&#9;-- here we will allocate the amount of memory that is equalt to the size of the file&#13;&#10;&#13;&#10;&#9;&#9;fileData = MemoryBlock(fileToRead:getSize())&#13;&#10;&#13;&#10;&#9;&#9;-- This method does not return a new memory block, it operates on the one provided by us&#13;&#10;&#13;&#10;&#9;&#9;fileToRead:loadFileAsData (fileData)&#13;&#10;&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;dataContentL&quot;):setText(&#13;&#10;&#9;&#9;&#9;fileData:toHexString(1)&#13;&#10;&#9;&#9;)&#13;&#10;&#9;end&#13;end"
                 luaMethodLinkedProperty="" luaMethodSource="0" uuid="2418458b642fc83088c2752392586601"
                 luaMethodValid="1"/>
      <luaMethod luaMethodName="saveContentAsText" luaMethodCode="--&#13;-- Called when a modulator value changes&#13;-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html&#13;-- @value    new numeric value of the modulator&#13;--&#13;saveContentAsText = function(mod, value)&#13;&#10;&#9;if panel:getBootstrapState() then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;fileToWrite = utils.saveFileWindow(&#13;&#10;&#9;&#9;&quot;Save content as text&quot;,&#13;&#10;&#9;&#9;File.getSpecialLocation(File.userHomeDirectory),&#13;&#10;&#9;&#9;&quot;*.txt&quot;,&#13;&#10;&#9;&#9;true&#13;&#10;&#9;)&#13;&#10;&#13;&#10;&#9;if fileToWrite:isValid() == false then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- Let's see if the file exists&#13;&#10;&#9;if fileToWrite:existsAsFile() == false then&#13;&#10;&#9;&#9;&#13;&#10;&#9;&#9;-- The file is not there, that's ok, let's try to create it&#13;&#10;&#9;&#9;if fileToWrite:create() == false then&#13;&#10;&#13;&#10;&#9;&#9;&#9;-- Ooooh we can't create it, we need to fail here&#13;&#10;&#9;&#9;&#9;utils.warnWindow (&quot;File write&quot;, &quot;The destination file does not exist, and i can't create it&quot;)&#13;&#10;&#13;&#10;&#9;&#9;&#9;return&#13;&#10;&#9;&#9;end&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- Update the file path&#13;&#10;&#9;panel:getLabelComponent(&quot;lastFileWritePathL&quot;):setText (&quot;&gt; &quot;..fileToWrite:getFullPathName())&#13;&#10;&#13;&#10;&#9;textToWrite = panel:getLabelComponent(&quot;contentToSaveL&quot;):getText()&#13;&#10;&#13;&#10;&#9;if textToWrite:length() == 0 then&#13;&#10;&#9;&#9;utils.warnWindow (&quot;Data to write&quot;, &quot;There is no data to write, we'll default to \&quot;OK\&quot;&quot;)&#13;&#10;&#9;&#9;textToWrite = &quot;OK&quot;&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- If we reached this point, we have a valid file we can try to write to&#13;&#10;&#9;&#13;&#10;&#9;-- There are two falgs when writing text&#13;&#10;&#9;-- asUnicode - if should write our text as UNICODE&#13;&#10;&#9;-- writeUnicodeHeaderBytes - if we should add a special unicode header at the beginning of the file&#13;&#10;&#9;-- we set both to false&#13;&#10;&#13;&#10;&#9;if fileToWrite:replaceWithText (textToWrite, false, false) == false then&#13;&#10;&#9;&#9;utils.warnWindow (&quot;File write&quot;, &quot;Failed to write data to file: &quot;..fileToWrite.getFullPathName())&#13;&#10;&#9;end&#13;end"
                 luaMethodLinkedProperty="" luaMethodSource="0" uuid="c758a294307623159c6139994d22a81c"
                 luaMethodValid="1"/>
      <luaMethod luaMethodName="saveContentAsData" luaMethodCode="--&#13;-- Called when a modulator value changes&#13;-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html&#13;-- @value    new numeric value of the modulator&#13;--&#13;saveContentAsData = function(mod, value)&#13;&#10;&#9;if panel:getBootstrapState() then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;fileToWrite = utils.saveFileWindow(&#13;&#10;&#9;&#9;&quot;Save content as data&quot;,&#13;&#10;&#9;&#9;File.getSpecialLocation(File.userHomeDirectory),&#13;&#10;&#9;&#9;&quot;*.bin&quot;,&#13;&#10;&#9;&#9;true&#13;&#10;&#9;)&#13;&#10;&#13;&#10;&#9;if fileToWrite:isValid() == false then&#13;&#10;&#9;&#9;return&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- Let's see if the file exists&#13;&#10;&#9;if fileToWrite:existsAsFile() == false then&#13;&#10;&#9;&#9;&#13;&#10;&#9;&#9;-- The file is not there, that's ok, let's try to create it&#13;&#10;&#9;&#9;if fileToWrite:create() == false then&#13;&#10;&#13;&#10;&#9;&#9;&#9;-- Ooooh we can't create it, we need to fail here&#13;&#10;&#9;&#9;&#9;utils.warnWindow (&quot;File write&quot;, &quot;The destination file does not exist, and i can't create it&quot;)&#13;&#10;&#13;&#10;&#9;&#9;&#9;return&#13;&#10;&#9;&#9;end&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- Update the file path&#13;&#10;&#9;panel:getLabelComponent(&quot;lastFileWritePathL&quot;):setText (&quot;&gt; &quot;..fileToWrite:getFullPathName())&#13;&#10;&#13;&#10;&#9;-- We will initialize a memory block, treating the input data as a hex representation of bytes&#13;&#10;&#9;dataToWrite = MemoryBlock (panel:getLabelComponent(&quot;contentToSaveL&quot;):getText())&#13;&#10;&#13;&#10;&#9;if dataToWrite:getSize() &lt;= 0 then&#13;&#10;&#9;&#9;utils.warnWindow (&quot;Data to write&quot;, &quot;There is no data to write, we'll default to \&quot;f0 00 f7\&quot;&quot;)&#13;&#10;&#9;&#9;dataToWrite = MemoryBlock (&quot;f0 00 f7&quot;)&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;-- If we reached this point, we have a valid file we can try to write to&#13;&#10;&#9;&#13;&#10;&#9;if fileToWrite:replaceWithData (dataToWrite) == false then&#13;&#10;&#9;&#9;utils.warnWindow (&quot;File write&quot;, &quot;Failed to write data to file: &quot;..fileToWrite.getFullPathName())&#13;&#10;&#9;end&#13;end"
                 luaMethodLinkedProperty="" luaMethodSource="0" uuid="18cebd1c89867b386dea546422d67321"
                 luaMethodValid="1"/>
      <luaMethod luaMethodName="specialLocationChanged" luaMethodCode="--&#13;-- Called when a modulator value changes&#13;-- @mod   http://ctrlr.org/api/class_ctrlr_modulator.html&#13;-- @value    new numeric value of the modulator&#13;--&#13;specialLocationChanged = function(mod, value)&#13;&#10;&#9;if value == 0 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userHomeDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 1 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userDocumentsDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 2 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userDesktopDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 3 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userApplicationDataDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 4 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.commonApplicationDataDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 5 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.tempDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 6 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.currentExecutableFile):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 7 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.currentApplicationFile):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 8 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.invokedExecutableFile):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 9 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.globalApplicationsDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 10 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userMusicDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 11 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userMoviesDirectory):getFullPathName())&#13;&#10;&#9;end&#13;&#10;&#13;&#10;&#9;if value == 12 then&#13;&#10;&#9;&#9;panel:getLabelComponent(&quot;specialLocationPathL&quot;):setText (&quot;&gt; &quot;..File.getSpecialLocation(File.userPicturesDirectory):getFullPathName())&#13;&#10;&#9;end&#13;end"
                 luaMethodLinkedProperty="" luaMethodSource="0" uuid="0fb03b362893366ddead9cb69141ad0c"
                 luaMethodValid="1"/>
    </luaManagerMethods>
  </luaManager>
  <uiPanelEditor uiPanelCanvasRectangle="0 1 361 598" uiPanelSnapSize="8" uiPanelBackgroundColour="0xffffffff"
                 uiPanelBackgroundColour1="0xffffffff" uiPanelBackgroundColour2="0xffffffff"
                 uiPanelBackgroundGradientType="1" uiPanelImageResource="-- None"
                 uiPanelEditMode="0" uiPanelViewPortSize="754" uiPanelPropertiesSize="779"
                 uiPanelLock="0" uiPanelDisabledOnEdit="0" uiPanelWidth="400"
                 uiPanelHeight="400" name="DEMO - Files" uiPanelImageAlpha="255"
                 uiPanelImageLayout="64" uiPanelSnapActive="1" uiPanelPropertiesOnRight="0"
                 luaPanelPaintBackground="-- None" luaPanelResized="-- None" uiPanelInvisibleComponentAlpha="0.5">
    <uiPanelCanvasLayer uiPanelCanvasLayerName="New layer" uiPanelCanvasLayerUid="b3092ae838000000cccccccca0339706"
                        uiPanelCanvasLayerColour="0x000000" uiPanelCanvasLayerVisibility="1"
                        uiPanelCanvasLayerIndex="0"/>
  </uiPanelEditor>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="textContentL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-2"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="0x00000000"
               uiLabelTextColour="0xff000000" uiLabelOutline="0" uiLabelOutlineColour="ff000000"
               uiLabelJustification="topLeft" uiLabelFitFont="0" uiLabelFont="Courier New;10;1;0;0;0;1"
               uiLabelText="" uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="0" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="1"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="8 40 167 151" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="dataContentL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-2"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="0x00000000"
               uiLabelTextColour="0xff000000" uiLabelOutline="0" uiLabelOutlineColour="ff000000"
               uiLabelJustification="topLeft" uiLabelFitFont="0" uiLabelFont="Courier New;10;1;0;0;0;1"
               uiLabelText="" uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="0" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="1"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="184 40 168 151" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorVstExported="1" modulatorMax="0" vstIndex="0" modulatorIsStatic="0"
             modulatorGlobalVariable="-1" modulatorMuteOnStart="0" modulatorExcludeFromSnapshot="0"
             modulatorValueExpression="modulatorValue" modulatorValueExpressionReverse="midiValue"
             luaModulatorGetValueForMIDI="-- None" luaModulatorGetValueFromMIDI="-- None"
             modulatorLinkedToPanelProperty="-- None" modulatorLinkedToModulatorProperty="-- None"
             modulatorLinkedToModulator="-- None" modulatorLinkedToModulatorSource="1"
             modulatorLinkedToComponent="0" modulatorBaseValue="0" modulatorCustomIndex="0"
             modulatorCustomIndexGroup="0" luaModulatorValueChange="readFileAsText"
             name="modulator-1" modulatorMin="0" modulatorValue="0">
    <midi midiMessageType="9" midiMessageChannelOverride="0" midiMessageChannel="1"
          midiMessageCtrlrNumber="1" midiMessageCtrlrValue="0" midiMessageMultiList=""
          midiMessageSysExFormula=""/>
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-1"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiButtonTrueValue="1" uiButtonFalseValue="0"
               uiButtonIsToggle="0" uiButtonColourOn="ff7676ff" uiButtonColourOff="ffacf2ff"
               uiButtonTextColourOn="0xff000000" uiButtonTextColourOff="0xff454545"
               uiButtonContent="Read file as Text" uiButtonConnectedLeft="0"
               uiButtonConnectedRight="0" uiButtonConnectedTop="0" uiButtonConnectedBottom="0"
               uiButtonRepeat="0" uiButtonRepeatRate="100" uiButtonTriggerOnMouseDown="0"
               componentRectangle="8 8 127 32" uiType="uiButton" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorVstExported="1" modulatorMax="0" vstIndex="1" modulatorIsStatic="0"
             modulatorGlobalVariable="-1" modulatorMuteOnStart="0" modulatorExcludeFromSnapshot="0"
             modulatorValueExpression="modulatorValue" modulatorValueExpressionReverse="midiValue"
             luaModulatorGetValueForMIDI="-- None" luaModulatorGetValueFromMIDI="-- None"
             modulatorLinkedToPanelProperty="-- None" modulatorLinkedToModulatorProperty="-- None"
             modulatorLinkedToModulator="-- None" modulatorLinkedToModulatorSource="1"
             modulatorLinkedToComponent="0" modulatorBaseValue="0" modulatorCustomIndex="0"
             modulatorCustomIndexGroup="0" luaModulatorValueChange="readFileAsData"
             name="modulator-3" modulatorMin="0" modulatorValue="0">
    <midi midiMessageType="9" midiMessageChannelOverride="0" midiMessageChannel="1"
          midiMessageCtrlrNumber="1" midiMessageCtrlrValue="0" midiMessageMultiList=""
          midiMessageSysExFormula=""/>
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-1"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiButtonTrueValue="1" uiButtonFalseValue="0"
               uiButtonIsToggle="0" uiButtonColourOn="ff7676ff" uiButtonColourOff="fff8acff"
               uiButtonTextColourOn="0xff000000" uiButtonTextColourOff="0xff454545"
               uiButtonContent="Read file as Data" uiButtonConnectedLeft="0"
               uiButtonConnectedRight="0" uiButtonConnectedTop="0" uiButtonConnectedBottom="0"
               uiButtonRepeat="0" uiButtonRepeatRate="100" uiButtonTriggerOnMouseDown="0"
               componentRectangle="184 8 133 32" uiType="uiButton" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="contentToSaveL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="1" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-2"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="0x00000000"
               uiLabelTextColour="0xff000000" uiLabelOutline="0" uiLabelOutlineColour="ff000000"
               uiLabelJustification="centred" uiLabelFitFont="0" uiLabelFont="Courier New;12;1;0;0;0;1"
               uiLabelText="00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f"
               uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="1" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="0"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="8 240 343 144" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorVstExported="1" modulatorMax="0" vstIndex="2" modulatorIsStatic="0"
             modulatorGlobalVariable="-1" modulatorMuteOnStart="0" modulatorExcludeFromSnapshot="0"
             modulatorValueExpression="modulatorValue" modulatorValueExpressionReverse="midiValue"
             luaModulatorGetValueForMIDI="-- None" luaModulatorGetValueFromMIDI="-- None"
             modulatorLinkedToPanelProperty="-- None" modulatorLinkedToModulatorProperty="-- None"
             modulatorLinkedToModulator="-- None" modulatorLinkedToModulatorSource="1"
             modulatorLinkedToComponent="0" modulatorBaseValue="0" modulatorCustomIndex="0"
             modulatorCustomIndexGroup="0" luaModulatorValueChange="saveContentAsText"
             name="modulator-4" modulatorMin="0" modulatorValue="0">
    <midi midiMessageType="9" midiMessageChannelOverride="0" midiMessageChannel="1"
          midiMessageCtrlrNumber="1" midiMessageCtrlrValue="0" midiMessageMultiList=""
          midiMessageSysExFormula=""/>
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-1"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiButtonTrueValue="1" uiButtonFalseValue="0"
               uiButtonIsToggle="0" uiButtonColourOn="ff7676ff" uiButtonColourOff="ffffacac"
               uiButtonTextColourOn="0xff000000" uiButtonTextColourOff="0xff454545"
               uiButtonContent="Save content as Text" uiButtonConnectedLeft="0"
               uiButtonConnectedRight="0" uiButtonConnectedTop="0" uiButtonConnectedBottom="0"
               uiButtonRepeat="0" uiButtonRepeatRate="100" uiButtonTriggerOnMouseDown="0"
               componentRectangle="8 384 160 32" uiType="uiButton" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorVstExported="1" modulatorMax="0" vstIndex="3" modulatorIsStatic="0"
             modulatorGlobalVariable="-1" modulatorMuteOnStart="0" modulatorExcludeFromSnapshot="0"
             modulatorValueExpression="modulatorValue" modulatorValueExpressionReverse="midiValue"
             luaModulatorGetValueForMIDI="-- None" luaModulatorGetValueFromMIDI="-- None"
             modulatorLinkedToPanelProperty="-- None" modulatorLinkedToModulatorProperty="-- None"
             modulatorLinkedToModulator="-- None" modulatorLinkedToModulatorSource="1"
             modulatorLinkedToComponent="0" modulatorBaseValue="0" modulatorCustomIndex="0"
             modulatorCustomIndexGroup="0" luaModulatorValueChange="saveContentAsData"
             name="modulator-5" modulatorMin="0" modulatorValue="0">
    <midi midiMessageType="9" midiMessageChannelOverride="0" midiMessageChannel="1"
          midiMessageCtrlrNumber="1" midiMessageCtrlrValue="0" midiMessageMultiList=""
          midiMessageSysExFormula=""/>
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-1"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiButtonTrueValue="1" uiButtonFalseValue="0"
               uiButtonIsToggle="0" uiButtonColourOn="ff7676ff" uiButtonColourOff="ffacffae"
               uiButtonTextColourOn="0xff000000" uiButtonTextColourOff="0xff454545"
               uiButtonContent="Save content as Data" uiButtonConnectedLeft="0"
               uiButtonConnectedRight="0" uiButtonConnectedTop="0" uiButtonConnectedBottom="0"
               uiButtonRepeat="0" uiButtonRepeatRate="100" uiButtonTriggerOnMouseDown="0"
               componentRectangle="192 384 160 32" uiType="uiButton" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorVstExported="1" modulatorMax="13" vstIndex="4" modulatorIsStatic="0"
             modulatorGlobalVariable="-1" modulatorMuteOnStart="0" modulatorExcludeFromSnapshot="0"
             modulatorValueExpression="modulatorValue" modulatorValueExpressionReverse="midiValue"
             luaModulatorGetValueForMIDI="-- None" luaModulatorGetValueFromMIDI="-- None"
             modulatorLinkedToPanelProperty="-- None" modulatorLinkedToModulatorProperty="-- None"
             modulatorLinkedToModulator="-- None" modulatorLinkedToModulatorSource="1"
             modulatorLinkedToComponent="0" modulatorBaseValue="0" modulatorCustomIndex="0"
             modulatorCustomIndexGroup="0" luaModulatorValueChange="specialLocationChanged"
             name="modulator-2" modulatorMin="0" modulatorValue="0">
    <midi midiMessageType="9" midiMessageChannelOverride="0" midiMessageChannel="1"
          midiMessageCtrlrNumber="1" midiMessageCtrlrValue="0" midiMessageMultiList=""
          midiMessageSysExFormula=""/>
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="1"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="Special locations available"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiComboArrowColour="0xff0000ff"
               componentRectangle="8 472 344 43" uiComboOutlineColour="0xff0000ff"
               uiComboTextColour="0xff000000" uiComboTextJustification="centred"
               uiComboFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" uiComboMenuFont="&lt;Sans-Serif&gt;;16;0;0;0;0;1"
               uiComboButtonColour="ff4376ff" uiComboBgColour="0xffffffff" uiComboMenuBackgroundColour="0xfff0f0f0"
               uiComboMenuFontColour="0xff000000" uiComboMenuHighlightColour="ffadd8e6"
               uiComboMenuFontHighlightedColour="0xff232323" uiComboContent="userHomeDirectory&#10;userDocumentsDirectory&#10;userDesktopDirectory&#10;userApplicationDataDirectory&#10;commonApplicationDataDirectory&#10;tempDirectory&#10;currentExecutableFile&#10;currentApplicationFile&#10;invokedExecutableFile&#10;hostApplicationPath&#10;globalApplicationsDirectory&#10;userMusicDirectory&#10;userMoviesDirectory&#10;userPicturesDirectory"
               uiComboMenuBackgroundRibbed="1" uiComboButtonGradient="0" uiComboButtonGradientColour1="ff0000ff"
               uiComboButtonGradientColour2="ff00008b" uiComboButtonWidthOverride="0"
               uiComboButtonWidth="16" uiComboDynamicContent="0" uiType="uiCombo"
               componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="specialLocationPathL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-6"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="ff000000" uiLabelTextColour="ffffffff"
               uiLabelOutline="0" uiLabelOutlineColour="ff000000" uiLabelJustification="left"
               uiLabelFitFont="0" uiLabelFont="Courier New;14;1;0;0;0;1" uiLabelText="&gt; C:\Users\atom"
               uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="0" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="1"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="8 520 346 37" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="lastFileReadPathL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-6"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="ad000000" uiLabelTextColour="ffffffff"
               uiLabelOutline="0" uiLabelOutlineColour="ff000000" uiLabelJustification="left"
               uiLabelFitFont="0" uiLabelFont="Courier New;12;1;1;0;0;1" uiLabelText="&gt;"
               uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="0" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="1"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="8 192 344 19" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
  <modulator modulatorCustomIndex="0" modulatorCustomIndexGroup="0" modulatorIsStatic="1"
             name="lastFileWritePathL" modulatorVstExported="0">
    <component componentLabelPosition="top" componentLabelJustification="centred"
               componentLabelHeight="14" componentLabelWidth="0" componentLabelVisible="0"
               componentLabelAlwaysOnTop="1" componentSentBack="0" componentLabelColour="0xff000000"
               componentLabelFont="&lt;Sans-Serif&gt;;12;0;0;0;0;1" componentVisibleName="modulator-6"
               componentMouseCursor="2" componentGroupName="" componentSnapSize="0"
               componentIsLocked="0" componentDisabled="0" componentRadioGroupId="0"
               componentRadioGroupNotifyMidi="1" componentVisibility="1" componentEffect="0"
               componentEffectRadius="1" componentEffectColour="0xff000000"
               componentEffectOffsetX="0" componentEffectOffsetY="0" componentExcludedFromLabelDisplay="0"
               componentBubbleRoundAngle="10" componentBubbleBackgroundColour1="0x9cffffff"
               componentBubbleBackgroundColour2="0xbab9b9b9" componentBubbleBackgroundGradientType="1"
               componentBubbleValueColour="0xff000000" componentBubbleValueFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1"
               componentBubbleValueJustification="centred" componentBubbleNameColour="0xff000000"
               componentBubbleNameFont="&lt;Sans-Serif&gt;;14;0;0;0;0;1" componentBubbleNameJustification="centred"
               componentValueDecimalPlaces="0" uiLabelBgColour="ad000000" uiLabelTextColour="ffffffff"
               uiLabelOutline="0" uiLabelOutlineColour="ff000000" uiLabelJustification="left"
               uiLabelFitFont="0" uiLabelFont="Courier New;12;1;1;0;0;1" uiLabelText="&gt; "
               uiLabelDisplaysAllValues="0" uiLabelDisplayFormat="%n(%N) = %v(%h)"
               uiLabelInputHighlightTextColour="0xffffffff" uiLabelInputHighlightColour="0xff0000ff"
               uiLabelEditOnSingleClick="0" uiLabelEditOnDoubleClick="0" uiLabelEditFocusDiscardsChanges="1"
               uiLabelInputAllowedChars="" uiLabelInputMaxLength="1024" uiLabelChangedCbk="-- None"
               componentRectangle="8 418 344 19" uiType="uiLabel" componentLayerUid="b3092ae838000000cccccccca0339706"/>
  </modulator>
</panel>
```

