#!/usr/bin/env ruby

defaultFolder = "/home/timbo/src/FilesToRename/"
defaultFiles = Dir[defaultFolder + "*.txt"]

class FileSorter
    attr_accessor :folder

    #Create the object
    def initialize(folder = defaultFolder)
        @folder = folder
        @namePrefix = "newFrame_"
        @nameSuffix = ".txt"
        @nameCount = 0
        @sorted
    end

    def sort_files
        @files = Dir[@folder + "*#{@nameSuffix}"]

        @sorted = @files.sort_by { |h| [h.length, h]}
        @sorted.each do |fileName|
            if !File.directory? fileName
                puts fileName
            end
        end
    end

    def rename_files
        @sorted.each do |fileName|
            if !File.directory? fileName
                if File.extname(fileName) == @nameSuffix
                    newName = @folder + @namePrefix + @nameCount.to_s + @nameSuffix
                    #File.rename(fileName, newName)
                    puts newName
                    @nameCount = @nameCount+1
                end
            end
        end
    end
end

if __FILE__ == $0
    # Ask user for the path and display files
    puts "Please enter the path of the images to rename (such as /home/user/filesToRename/):"
    folder = gets.chomp
    puts "You entered " + folder

    # Sort the files and ask for confirmation
    fs = FileSorter.new(folder)
    puts "Here are the files found:"
    fs.sort_files
    fs.rename_files
end