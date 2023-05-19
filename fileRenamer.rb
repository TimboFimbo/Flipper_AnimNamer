#!/usr/bin/env ruby

defaultFolder = "/home/timbo/src/FilesToRename/"
defaultFiles = Dir[defaultFolder + "*.txt"]

class FileWriter
    attr_accessor :folder

    def initialize(folder = defaultFolder, fileCount = 0)
        @folder = folder
        @fileCount = fileCount
        @nameSuffix = ".txt"
        @data1 = "Filetype: Flipper Animation\nVersion: 1\n\nWidth: 128\nHeight: 64\nPassive frames: "
        @data2 = "\nActive frames: 0\nFrames order: "
        @data3 = "\nActive cycles: 0\nFrame rate: 6\nDuration: 3600\nActive cooldown: 0\n\nBubble slots: 0"
    end

    def write_file
        # Iterate through and create the frames order string
        @framesString = ""
        @fileCount.times { |i| @framesString = @framesString + i.to_s + " "}
        @fileData = @data1 + @fileCount.to_s + @data2 + @framesString + @data3
        puts "Here is the meta file:"
        puts @fileData
    end
end

class FileSorter
    attr_accessor :folder

    #Create the object
    def initialize(folder = defaultFolder)
        @folder = folder
        @namePrefix = "frame_"
        @nameSuffix = ".txt"
        @nameCount = 0
        @sorted
    end

    def sort_files
        @files = Dir[@folder + "*#{@nameSuffix}"]

        @sorted = @files.sort_by { |h| [h.length, h]}
        @sorted.each do |fileName|
            if !File.directory? fileName
                #puts fileName
            end
        end
    end

    def rename_files
        @sorted.each do |fileName|
            if !File.directory? fileName
                if File.extname(fileName) == @nameSuffix
                    newName = @folder + @namePrefix + @nameCount.to_s + @nameSuffix
                    File.rename(fileName, newName)
                    puts newName
                    @nameCount = @nameCount+1
                end
            end
        end
        @nameCount
    end
end

if __FILE__ == $0
    # Ask user for the path and display files
    puts "Please enter the path of the images to rename (such as /home/user/filesToRename/):"
    folder = gets.chomp
    puts "You entered " + folder

    # Sort the files and ask for confirmation before renaming
    # If rename happens, meta-txt file is also added
    fs = FileSorter.new(folder)
    sortedFiles = fs.sort_files

    if sortedFiles.length > 0
        puts "Here are the files found:"
        puts sortedFiles

        puts "Would you like to rename them?"
        likeToRename = gets.chomp

        if likeToRename[0,1] == 'Y' || likeToRename[0,1] == 'y'
            puts "Okay, files being renamed"
            numberOfFiles = fs.rename_files
            puts numberOfFiles.to_s + " files renamed"

            fw = FileWriter.new(folder, numberOfFiles)
            fw.write_file
        else
            puts "Okay, bye!"
        end
    else
        puts "No files found!"
    end
end