## blog-06 basic timer setup

### human fly

- sorry guys: just cannot seem to get my head round setting up a timer and timer callback. seem to have a mental block on it. i would like to look at it in it’s most basic form (i think i’ll be - ok after that).
- let’s say i just want 1 timer, with a 300ms interval, a ‘start timer’, and a ‘stop timer’. and an output: say, a 1 to 16 count that loops while the timer is running.
- so i will have a ‘run/stop’ button: 0 is ‘stop’, 1 is ‘run’.
- while it is at 1, counter runs.
- do i need 2 methods? one to ID the timer, and another to define its action? (the ‘callback’?)
- or can i do it all within one method?
- (if only one timerID, i won’t need to do ‘if timerID == (number) then ..’
- if i have:

```lua
function runSeqCallback(timerId)
    --start and stop a count
    local runSeq = panel:getModulatorByName("runSeq"):getValue()
    if runSeq == 1 then 
    console(String("count start"))
    --start timer
        --timer:setCallback (1, runSeqCallback)
        --timer:startTimer(1, 300)
    panel:getComponent("display"):setPropertyString("uiLabelText","run")

    elseif	runSeq == 0 then 
    console(String("count stop"))
    --stop timer
        --timer:stopTimer(timerId)
    panel:getComponent("display"):setPropertyString("uiLabelText","stop")
    end
end
```
- is this the correct form? so far this just prints to console, start/stop.
- i suppose i need a second function that defines an incrementing, looping count.
- i have these arguments working on another thing, where i just click a button to fake my timer, and it ‘loops’:

```lua
if runStop == 1 and count1_16 <= 15 and value == 1 then add1step(value) end 
if runStop == 1 and count1_16 == 16 and value == 1 then reset(value) end
if runStop == 1 and count1_16 <= 16 then sequence(value) end
-not sure i need ‘value’ in my variable there; i have 3 little functions:

function add1step(value)
panel:getModulatorByName("count1_16"):setModulatorValue((count1_16)+1, false, true, true)
end
--
function sub1step(value)
panel:getModulatorByName("count1_16"):setModulatorValue((count1_16)-1, false, true, true)
end
--
function reset(value)
panel:getModulatorByName("count1_16"):setModulatorValue((count1_16)-15, false, true, true)
end
```
and see this sort of thing elsewhere:
```lua
--	local count = 1
--	local count=count+1
--	if count==16 then count=1 end
```
November 18, 2017 at 4:49 am#73562REPLY | REPORT | QUOTE


### Puppeteer
- You can’t call the callback function from within itself.
- You need to so something like have a button trigger a method.
- In that method use the timer:setCallback and timer:startTimer
- Whatever the name of the callback, in that function you do the stuff that you want executed each time the timer is called.
- You need a way, inside the callback to stop the timer, so each time the timer runs, it checks to see if it’s still meant to be running, and if it’s not, it will stop the timer.


### human fly

- ok, thanks.
- did think so, needed confirmation.

### Puppeteer
- Yeah, save before you run. I’ve crashed cntrl good and proper a few times with runaway feedback loops

### goodweather
- Human fly, let me repeat what I already mentioned in other posts. I add the code for a counter as example.
- A timer is a loop that performs itself automatically a a specific time interval until it is stopped.
- So, if you estimate that it takes 200ms to perform a lot of operations before showing a message on the screen or performing a certain action (for example) then you start a timer.
```lua
if LoadedProgramData:getSize() == 1024 then
	bLoadingProgram = true
	LoadProgramData(LoadedProgramData)
 	-- Starting a timer to reset bLoadingProgram to false after that all modulators have processed their OnChange function
	timer:setCallback (1, timerCallback)
	timer:startTimer(1, 200)
end
```
- In this case, LoadProgramData is setting all modulators to a value which is triggering their OnChange methods. In each OnChange method I’m checkng for bLoadingProgam==True and if this is the - case, the OnChange method content is bypassed. Of course, I should reset bLoadingProgram to False when all OnChange methods are treated and this is what the timer 1 is doing.
- The code above is thus telling which callback method to call (timerCallback) and which timer to start at what interval (timer 1 at 200ms.
- So, you put this under a button for example.
- The code within the callback method and concercing timer 1 will execute every 200ms unless you stop it.
- So, here comes the loop aspect. Either you stop it directly or you count the number of times it runs and stop it when a certain number of loops has been reached.
- If you plan to have a loop and count, you have to initialize the counter variable in the method calling the timer just before starting it.
```lua
function timerCallback(timerId)
   --Load program timer
   if timerId == 1 then	-- run once
      --blablabla whatever you want to do
      timer:stopTimer(timerId)
   elseif timerId == 8 then -- run 99 times
      -- here is some code to tell what to do with each loop
      iCounter = iCounter + 1
	if iCounter == 99 then 
		timer:stopTimer(timerId) 
		iCounter = 0
		-- some code here to perform something with the 99 loops data
         end
   end
end
```
November 18, 2017 at 4:26 pm#73569REPLY | REPORT | QUOTE

### human fly

- ok – i’m about to get back to that now, thanks.
- i’ve been practising/familiarising myself with loops basics today:
- Lua basics: Loops
- (*i now see that a ‘loop’ such as ‘for..’, ‘while..’, ‘repeat…until’ will not do, because it spits out the series of operations in one go.*)
- i had difficulty looking at your example because you are ID’ing several timers, and these are linked to conditions.
- i just want to use an on/off button to start/stop a single timer (for this exercise), that will perform the kind of operation you show with ‘iCounter’, except it starts again, until the button - is set ‘off’. ie: it reaches 16 (…) and then goes back to 1, and starts the count again, as long as the button is ‘on’. i’ll see how i do with this in the morning 🙂
- on closer inspection: (*total* basics…)
- first off, i’ve been having a problem with simple ‘increment’ operation.
- if i do:

```lua
function incCount()

    local count = 0
    
    count=count+1
    console(String(count))
end
```
- i only ever get ‘1’ returned.
- but if i change it to:

```lua
local count = 0

function incCount()

    count=count+1
    console(String(count))
end
```

- it increments the way i expect: 1,2,3,4,etc.
- so what’s going on here? not used to having anything in a method preceding the function header…
- EDIT: *of course*: ‘count’ is global. if i put that in a ‘when panel is loaded’ method, it does the same thing.

- ok so here’s a little panel with increment, restarting
- at the end of the count, with run/stop and reset.
- (next step: add timer+callback stuff)
>>

Attachments: `increment_Manual-v01_runStopReset.panel`

### Puppeteer

- In your first example, when you call inCount the first thing that you do is set count = 0. That is run every time you run that function.
- You need to set it to zero outside of the loop and function

```lua
count = 0

while count <10 do
stuff
count = count+1
end
```

### human fly
- re timer: can i do this?

```lua
function runStop(timerId)

runstop = panel:getModulatorByName("runstop"):getValue()

if runstop == 1 then 
--console(String("count start"))	

panel:getComponent("label_runstop"):setPropertyString("uiLabelText","run")
reset() -- to make it restart at first count each time it runs

--start timer
timer:setCallback (1, runCallback)
timer:startTimer(1, 300)

elseif	runstop == 0 then 
--console(String("count stop"))
	
panel:getComponent("label_runstop"):setPropertyString("uiLabelText","stop")

--stop timer
timer:stopTimer(timerId)
end
end
and my callBack is:

function runCallback()

count=count+1
if count == 9 then count = 1
	end
--console(String(count))	

panel:getComponent("label_count"):setPropertyString("uiLabelText",""..count)
end
```
- going to try it without the reset() because it doesn’t do anything. but i get a callback error on ‘stop’ anyway.
- ah, well how about that: next time i ran that, it’s upcounting 🙂 – but the method crashes on panel load, too, on account of the stopTimer causing a callback error (no matching candidate).
- solved: stopTimer(TimerId) needs to be stopTimer(1)
- since that’s the value of the variable ‘TimerId’ (if that’s the correct way to put it?) that is specified in the ‘start’ part. working now (at last..).

### Puppeteer wrote:
- In your first example, when you call inCount the first thing that you do is set count = 0. That is run every time you run that function.
- You need to set it to zero outside of the loop and function

```lua
count = 0

while count <10 do
stuff
count = count+1
end
```

- got it .. yes, see what you meant. so my interpretation was wrong, in fact.
- still: interesting to see i could put the count=0 before the function …
- got it running nicely now, resetting on stop – not start, it introduces a delay. i’m resetting to 1 at the moment, although i think it should reset to 0 at off/stop. first count has to ‘play’/- clock, if not, ‘first’ clock will be 2..
- i’m messing around making a chaselight UI: now i have to ‘get’ the ‘count’ value and use it to set the logic states of a row of corresponding leds…
- got flashing lights 🙂


### dnaldoog

- m.tarenskeen – There’s an excellent explanation here by Goodweather on timers:

```lua
basic timer setup (== tekst hoger)
```

- I couldn’t get the concept of timers until I read the post carefully and realised a timer is a loop or rather a process that keeps running until told not to.
- If you set an external global variable as he does iCounter=0 it is picked up by the timer (which is a loop) – you can stop the timer when a condition is met; in this case an incremented - variable.
- Within the timer you increment iCounter iCounter=iCounter+1 – if iCounter == 10 then timer:stopTimer(thisTimerId) end for example and the timer will return back to your code that triggered the timer.



### Dobo 8 mei 2021

Hi Damien,
- thx for this question that allows me to explain you what a timer is and how it is working ;-)
- I think I already did that in the old forum but it is good to repeat.
- A timer is itself a loop running continuously at a certain timing until you stop it.
- So, you don't need to have your 1-100 for loop there and starting/stopping the same timer ID 2 100 times.
- From my ever expanding never published Step by Step guide 2.x (will further work on it during summer so I can publish it):
- The philosophy of a timer is that it loops by executing its code at a specific time interval until it is stopped.
- Juce documentation: ((https://www.juce.com/doc/classTimer#details ))

- Some properties:
- Timers are identified by a unique ID
- Before starting a timer with the timer:startTimer(ID, time_interval) function, it is needed to indicate the function that will be called (the callback function) with the timer:setCallback (ID, - callback_function)
- All timers can be in the same callback function provided you use the timer ID as argument and use an if..then..else statement to differentiate the timer’s actions
- A timer must be stopped and this is done with the timer:stopTimer(ID) function
- The time interval isn't guaranteed to be precise to any more than maybe 10-20ms, and the intervals may end up being much longer than requested if the system is busy. Because the callbacks are made by the main message thread, anything that blocks the message queue for a period of time will also prevent any timers from running until it can carry on.
- So:
    - In your main code. You should only initialize a counter and start the timer

```lua
iCounter = 0
timer:setCallback(2, TimerCallback) -- TimerId 2
timer:startTimer(2, 200) -- Timer Id 2 200ms

    Then you let the timer run in the timer callback method until it reaches 100 and you stop it there

TimerCallback = function(timerId)

	if timerId == 2 then
		if iCounter < 100 then
			panel:sendMidiMessageNow(CtrlrMidiMessage({0xF0, 0x43, 0x20, 0x7E, 0x4C, 0x4D, 0x20, 0x20, 0x38, 0x41, 0x32, 0x31, 0x4D, iCounter, 0xF7}))
			iCounter = iCounter + 1
		else
			timer:stopTimer(timerId)
		end
	end

end
```
- I didn't verify the code above but you should get the philosophy.
- You may need to put 101 in the if condition.
