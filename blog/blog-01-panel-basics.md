## 01 - Panel Basics

source: https://sourceforge.net/p/ctrlrv4/code/HEAD/tree/nightly/Source/

### HUMAN FLY
- i’ll illustrate this better: here is a method that works, for showing/hiding a modulator with a button, using `setVisible()`
```lua
setVisible3 = function(mod, value)
    button = panel:getModulatorByName(“LED button”):getValue()
    item = panel:getModulatorByName(“LED”)
    if button == 0 then
        item:getComponent():setVisible(false)
    else
        item:getComponent():setVisible(true)
    end
end
```

### LATER
- i resolved my problem with the `setValue` method mentioned above.
- the version that works is: (for switching on/off a led, with a button)
```lua
— Called when a modulator value changes
— @mod http://ctrlr.org/api/class_ctrlr_modulator.html
— @value new numeric value of the modulator
toggle_led3 = function(--[[ CtrlrModulator --]] mod, --[[ number --]] value, --[[ number --]] source)
    led = panel:getModulatorByName(“LED”)
    if value == 1 then
        led:setValue(1, false)
    else
        led:setValue(0, false)
    end
end
```
- it does not work without `,false` there. i need to look up what that is for. 

### HUMAN FLY
- you write methods in the Lua editor:
- get to this via `Panel>Lua editor` or call up methods on several parameters on the properties panel - create/edit new methods using `add`.
- everything seems to be called `modulator`` -- even groups.
- so what is Component? ie: `getComponent()` vs `getModulator()`

### ANSWER: Mr.ToR
- Juce is an object oriented framework. Ctrlr is based on Juce. 
- `Components` are `Juce` graphical objects and 
- `Modulators` are `Ctrlr objects` which contain graphical objects properly called `components`. 
- An `object` is an `instantiation` of a `class`. 
- In the case of `components`, when you add a graphical object in `ctrlr`, it’s actually an `instance of the component class`. 
- That’s why they’re called `objects`.
- If you want, you can even call them an `instance of a juce component class`.
 
### EERDER
- The objects you can add to the panel are called `components`.
- Right-click on the panel and you will get an `Add component` dialog.
- A component’s properties are divided into multiple sections such as `Modulator`, `MIDI`, `Component generic` and `Component`.
- All components have a modulator property but you can only view a `modulator list`. When you're at the `modulator list` window, click the `View` menu item and select `Switch to Tree`. Now in the tree view you will see the objects you've added to the panel, the ones we thought were components are listed as `modulator` and under those modulators listed are `MIDI` and `Component` 😀
- WOW What’s going on??? Nothing is what it seems… 🙂

#### I think the tree is the best place to understand what really is going on.
- So it seems that you are actually not adding components to the panel (even though that’s what the dialog says) but you’re adding an object called a modulator, 
  - which has a group of properties called a `component`, `MIDI` and also another group of properties called… a `modulator`. 🙂
##### a `modulator` is
  - component(group of properties)
  - MIDI
  - modulator

#### You can confirm this. 
- Add an object to the panel, select it, in it’s properties dialog look at `Modulator` property group, 
  - you will see a property called `Link to what type of MODULATOR property` 
  - click its associated drop-down list and you will see the 3 selection options, 
  - which are `Modulator`, `Component`, `MIDI Message` 
- This also tells me that modulator is a modulator property. 🙂 
- `Component` seems to be a graphical sub-object of a modulator object. 
- In the tree list, it almost seems like you should be able to delete, cut, copy, add or paste a component (or midi) object to a modulator object but it doesn’t work like that. 
- Maybe in a future version…

- So in consideration of all these information i think, the property groups such as component and midi are actually midi object and component object added to a modulator object and all those three objects have their own properties.
- So in theory, since the only object added to the panel is a modulator and since there is no add modulator function and you can not add a modulator without a component, it might make sense to have a dialog that says `add component` since it will actually add a modulator object but then add the selected component (together with a midi object) to that modulator object.
- Anyways, the next thing i was able to figure out is that the Modulator property group of a modulator object is where you link a Lua code or function to that Modulator object to do different things or behave in different ways.

#### So what is an expression and a method and what is the difference?
- Methods are names of files that hold functions written in lua code. 
- You can see/list these when you open menu item `Panel->Lua Editor`
- It seems like the convention is to have one function per method and both having the same name. Meaning, if you make function called `splitBytes` you will have a method called `splitBytes` and in that method you will have a function called `splitBytes`. 
- This again seems like having the same mentality as having a modulator parameter of a modulator object but it’s probably how ctrlr uses lua…  
- Anyways, these methods can be called from the following three properties of a modulator object:
1. `Called to calculate the MIDI value to send`
2. `Called to calculate new modulator value from a MIDI value`
3. `Called when the modulator value changes`
- And also methods could be called from `17 properties` of the panel (`+5 in editor section`).

#### The next thing is expressions. Here is a list of expressions:
- http://ctrlr.org/expressions-in-ctrlr-2/ they are little functions. 
- `Ctrlr` is based on Juce (www.juce.com) and these expressions are a `Juce` class.
- They are different from lua code. 
- The `juce` documentation explains it in the following way:
> [A class for dynamically evaluating simple numeric expressions.
> This class can parse a simple `C-style` string expression involving floating point numbers, named symbols and functions. 
> The basic arithmetic operations of `+, -, *, `/ are supported, as well as parentheses, and any alphanumeric identifiers are assumed to be named symbols which will be resolved when the expression is evaluated.]

- In ctrlr they are only entered into 3 specific properties of a modulator object:
1. `Expression to evaluate when calculating the midi message value from the madulator value`
2. `Expression to evaluate when calculating the modulator value from the midi message value`
3. _`(the third parameter does not have a name and i have no idea what it is, maybe it’s similar to the third property about methods)`_


### HumanFly:
-- Called when a button value changes
-- increment count
```lua
function increment2(value)
    local count = panel:getModulatorByName(“count1_8”):getModulatorValue()
    count = count + 1
    return count
end
```

### what is missing? this doesn’t do anything.
- ANSWER goodweather: 
- You are not doing anything with the arg “value” so you can remove it.
- Are you sure count has a value?
- Insert under the local count= line a console output as:
```lua
console(tostring(count))
```

- Anywhere in a method you can add:
```lua
console(tostring(any_variable))
```
- Use tostring() to be sure to convert the variable value to a string because `console()` accepts only strings.
- You can also open the Lua console under Panel. In the bottom part you can type any `console()` statement to check any variable. The result will be displayed in the upper part.
- About console, just apply what I said above, it does what I described…
  - let’s say that in your code you have `iBank = 12`
  - if you add a line `console(tostring(iBank))` in the code you will see 12 in the console window
  - if your panel is open and that you ran different things then you can open the console window and type a console statement in the bottom part to check 

### AAN/UIT goodweather
- Build an image with 2 frames (one picture for On then one for Off).
- Use a `uiImageButton modulator`.
- Value 0 will display first image, value 1 will display the second image
- Start your device
  - Set your Midi connection with the Midi menu
  - Open Midi monitor window and enable Input and output monitoring
  - Save, close and re-open your panel
  - Switch the button on your device then check the midi monitor
  - Should display the correct messages with values 0 and 1
  - Maybe you have 0 but then another value which is preventing the display of the second image

