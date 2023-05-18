An Animation Namer for the Flipper Zero.

Once run, pass in the path of a folder containing .png files.
They will be renamed in order to "frame_X.png".
The correct "meta.txt" file will also be added to the folder.
The animation is then ready to be added to the firmware for building.

I made this as I wanted to quicky export animations to my new device,
and used Ruby because I am trying to get better with it. I previously
made a version in C, also for practice, but soon accepted that dealing
with strings just wasn't worth the hassle.

Oh, and I've tested this to a certain extent, but you take any resposibility
into your own hands if you use this program. I haven't accidentally renamed 
any files, and you get to confirm the files set to be renamed before anything
happens, but try to be careful anyway. It doesn't go through folders
Strings are fun!
I thought it would be easy but every step comes with an interesting thing
to learn, and I'm sure the finished script will be a jumbled mess of code
with plenty of wasted space and most things done the really stupid way ;)