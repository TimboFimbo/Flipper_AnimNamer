An Animation Namer for the Flipper Zero.
Works on Windows, Mac, and various Linux distributions.

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
recursively, so it shouldn't be able to do too much damage, but I'd still
recommend having a backup of the image files before you use this.

How To Use:

If you're making custom Flipper animations, I'll assume you probably know
at least a thing or two about computers, but if not, here's a user guide:

1. You must have Ruby installed. Check this by opening a Terminal window and
    typing 'ruby --version'. If you don't get a version number, check how to
    install for your OS.

2. Once installed, navigate to the folder you wish the application to reside in.
    This can be done using the same Terminal on Linux or Mac. Windows users may 
    have to hit the Windows key and run 'Start Command Prompt with Ruby'.

3. Download the application as a .zip file, or use Git by typing 
    'git clone https://github.com/TimboFimbo/Flipper_AnimMaker' Once complete,
    use 'cd Flipper_AnimMaker' to enter the folder.

4. Type 'ls -la' to see the files and their permissions. If fileRenamer.rb is not
    executable (shown as a series of 'w's and 'r's to the left of the file name, but
    no 'x's) then type 'chmod +x fileRenamer.rb'. Repeating the 'ls -la' command
    should now show it as executable (there will be 'x's now).

5. You can now type './fileRenamer' or 'ruby ./fileRenamer' to start the application. 
    When prompted, enter the path of the folder containing the images to rename. 
    This must be the absolute path, not the relative one. For example, for a user 
    called 'Bob' who has a folder called 'ImagesToRename' on his Desktop would type 
    the following (ensure you get all the slahes correct):

    Linux:      /home/Bob/Desktop/ImagesToRename/
    Mac:        /Users/Bob/Desktop/ImagesToRename/
    Windows:    c:/Users/Bob/Desktop/ImagesToRename/

6. If everything goes correctly, you should now be presented with the list of image files
    found. Ensure it is correct and in order, and if so, type 'y' to continue. The images
    will now be renamed and the meta.txt file written. Check how to copy over and build 
    Flipper animations if you are unsure what to do next.