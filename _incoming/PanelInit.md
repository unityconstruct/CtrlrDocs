# Panel Init

# Panel init() method: restrict which methods are called at start-up
- https://ctrlr.org/forums/topic/preventing-script-from-running-at-panel-load/
- I encountered the same kind of problem and got around it by using a variable that is created in the `called when panel has finished loading` script,
- and reference that in an if statement enclosing the “rogue” method’s content.
- I use a bool set to true for it, but i guess you can use anything you want since its just a variable that has to exist.

# August 15, 2013 at 11:05 pm
- I can’t really disable calling the Lua script on load.
- Any develope will tell you, that this event needs to happen to get a consistent state of the program, what needs to be added is an indicator that we are loading now. And there are now 2 indicator available in the panel: object,
  1. getRestoreState()
    - this tells you is the panel is beeing restored, that is it has just been created in memory, it’s properties are beeing changed etc.
  2. getProgramState()
    - this tells you that the panel is getting a new program. this is important because when Ctrlr launches a new program is always applied (the one that holds the default values). This is different from getRestoreState() because this will be called everytime a program is applied.
- You need to know as the developer that getRestoreState() will return FALSE during start at the moment of applying the first program. Based on those 2 indicators you need to make decisions in your Lua scripts.

# August 21, 2013 at 9:22 pm
- I had done something stupid and instead of following hectic’s suggested method I did a slight alteration of it which of course didn’t work in this scenario. Fixed it and the issue is resolved.
- Thanks atom for the further insight. I guess I wasn’t clear that those two indicators were fully functional and working right. I think I had misunderstood info on these from another thread where you said something about not the fault of a bug but just the way some things were implemented. I had then dismissed those indicators you had mentioned then which you had just added apparently.
- So if I understand correctly I would just use them like:`if panel:getRestoreState() ~= false then –the panel is NOT loading

```lua
–do some stuff
endif panel: getProgramState() ~= false then –the panel is NOT receiving a program dump
–do some stuff
end`
```

 ## change `midiMessageCtrlrNumber` using getMidiMessage
- just thought I should add this because it fits the topic:
```lua
modulator:getMidiMessage() will return nil when the modulatorIsStatic (“Modulator does not react to value changes”) property is set to 1 (“Static”).
getMidiMessage() replace getComponent()
```
- I still don’t know how to set midi property of a modulator via LUA
- i want to change `midiMessageCtrlrNumber` of a button by another modulator
- `setProperty` is not working
> getMidiMessage
> i just saw in old post here how to do `getMidiMessage()` replace `getComponent()`

