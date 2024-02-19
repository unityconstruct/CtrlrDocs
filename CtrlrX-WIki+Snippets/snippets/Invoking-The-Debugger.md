# Invoking The Debugger
>Godlike Productions edited this page on Jan 7, 2022 · 1 revision
I've recently had to dig deep to find out how to use the debugger in LUA.

It's pretty handy when you are trying to find the exact point things go wonky, but there's a trick to invoking it.

In your code you need to put
```lua
pause (message)
```
but an assert failure "should" also invoke the debugger.

at the place where you want to start stepping through your code.

The LUA debugger is documented here - https://github.com/ToddWegner/clidebugger/blob/master/debugger.lua

Pause and step commands work as well as end, but theoretically you should be able to use the other functions as well (I just haven't worked out how.)

Note that pause("message") doesn't work, as it was originally detailed at ctrlr.org.

