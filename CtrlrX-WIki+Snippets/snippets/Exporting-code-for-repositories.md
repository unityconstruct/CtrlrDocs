# Exporting code for repositories
> Godlike Productions edited this page on Jan 6, 2022 · 1 revision
- Within the ctrlr LUA editor, there is a command under the file menu "convert to files"
- My recommendations to all programmers is to use this. It saves all of your LUA methods as external files, and if you have your project synced to a repository on github or similar, it allows for version control and all of the normal github functionality.
- It also means that your files are kept outside of Ctrlr, so if you do manage to crash Ctrlr, or otherwise stuff up your project so it can't be restarted, you can edit the .lua file offline to fix it. Also, if it ctrlr refuses to open your project (it has happened to me on more than one occasion), you can still access all of your work and rebuild things quickly.
- You will need to repeat this each time you add a new method, and what(), how() etc seem to keep getting new versions added, which you can delete, but I'm finding it a much nicer way to develop, in conjunction with Visual Studio Code, than just using LUA. I use Visual Studio to handle version management, but code in the Ctrlr LUA editor. Coding in Visual Studio means that you need to reopen your panel to refresh the code, and you need to compile within Ctrlr anyway, so it makes sense to do it this way.

