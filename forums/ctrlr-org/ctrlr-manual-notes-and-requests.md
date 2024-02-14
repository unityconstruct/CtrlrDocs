# Ctrlr Manual Notes and Requests

# https://ctrlr.org/forums/topic/ctrlr-manual-notes-and-requests/

- ResourceImagePaintMode has options from ’tile’..to ‘centred’ (what i’m using here) – so that all needs to be defined/described,..
- then it depends also on:
  - resourceImage width/height – these correspond to imagestrip framesize,
(but i’ve tried to resize the image on the UI)
then, there is:
  - component Label position and component Label Jusitification
    - i actually have to set position to ‘none’ to get my label to appear now, and justification centred’ – but there are several
‘centred’ options, none of which work with this.
  - and then there’s Label Height.
- this is like flying a helicopter, or a drone with multiple vertices, doing my head in ! and taking a LOT of time to resolve, i’m about to give up and make some Label  modulators for this. centred bottom chops the top off the label…

<hr/>

child/parent attributes can be got rid of when moving modulators out of their original UIGroups or UITabs by moving them to the workspace before moving them to their new destination (Group or Tab)
(probably worth checking at this point, and deleting any remaining Group or Tab ownership – working so far:
i save, close and re-open the panel to check)

i am concluding that it is not worth putting Groups within Groups – the main Group will only copy&paste with empty sub-Groups inside it – i think the modulators remain, but their ownership attributes remain, and they get sent to positions that are not useful, ie: 0,0.. 
and re-appear (or remain hidden) on next load, which messes up the whole panel.

initially, i used sub-Groups for aesthetic/design considerations, in order to have panel lines, as much as to avoid repeating sizing and attributes/properties work.
in fact, the extra panel lines and spacing take up screen space, so i’m now discarding that in favour of a single main Group, and i’ll find another way of separating the various sections.

<hr/>

- nice little time-saving trick for entering sysex message format in a load of modulators all at once: (then you just go through and adjust the hex numbers you need for each) -first, make sure all your sysex modulators in your panel all have ‘sysex’ enabled as midi message type: select, and hold ‘ctrl’ and click-select all the modulators you want to have sysex messages.
- (you can do this in batches/rows, it’s easier, in case you mess up; easier to check through, too). then select ‘midi message type’, and choose ‘sysex’, and all those modulators will now have ‘sysex’ selected. *if you don’t change ALL your modulators to sysex now, you can have a big problem later, as i found out. when you enable sysex for other modulators later, the messages can get re-attributed to the wrong modulators, as the order they are entered in seems to remain – bug? –
- -ok, so now you want to give a batch of modulators the same sysex message format. same technique: first, paste into the ‘formula’ box of one modulator your specimen sysex message, with ‘xx’ for the variable value position – and ‘z(n)’ for the checksum, ‘n’ being the number of bytes to checksum – and check it looks ok.
- -now multi-select the batch of modulators you want to insert the message to, using ‘ctrl’+clicking on all of them, and then paste into the ‘formula’ box. now all your modulators have the same
- sysex message, and you just have to go through and adjust the parameter address byte for each one. this will save copying and pasting into each one.
- i’m liking the multiselect, now that i’ve realised i can do it. very useful when doing a big multi-timbral device. no good for moving things, unless you cut+paste, but good for un/locking a load of things at once (you have to use the button on the properties pane for this, doesn’t appear as right-click reliably), or changing any property.


<hr/>


<hr/>


<hr/>


<hr/>

