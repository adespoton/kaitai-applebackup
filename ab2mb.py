import apple_backup
import system.fileIO
import system.magicFixDelimiters

# File names will be "Data File X"
# Note that by default, floppy backups will all be called Apple Backup Data,
# and stored on disks named Hard disk copy X.  If someone has made disk images of the disks,
# these can have the first 0x6054 of the disk image cut off/skipped and we should have the data file.
# We can expand this logic in the future to auto-rip backup files from disk images
# When converting this to real code, use the macbinary.ksy to validate the generated files.

inDir = <inputDirectory>
if fileIO.findDir(inDir) is true then continue

outDir = <outputDirectory>
if fileIO.findDir(outDir) is true then continue

inFile = inDir + "Data File "
n = "1" 

# Load first archive segment to grab some data:
f = apple_backup.from_file(inFile+n)

outDir = outDir+f.hardDriveName
if not fileIO.findDir(outDir):
  fileIO.createDir(outDir)

# Needed to load the first archive to get the number of segments
for n = 1 to f.backupDiskHeader.totalDisks do:
  for i = 0 to f.fileData.fileDataContents.fileDataType.size do: # not sure about .size -- must be some way to get the total number
    currArchiveFile = f.fileData.fileDataContents.fileDataType[i]
    
    # To do: fullFilePath actually stores the entire path to file with : as delimiter.  
    # We're going to have to break this out so we can use appropriate path delimiters of the host OS.
    realFilePath = magicFixDelimiters(currArchiveFile.fullFilePath)
    
    if not fileIO.findFile(outDir+realFilePath):
      if currArchiveFile.folderFlags !== 0:
        # we've got a folder, so let's just create it.
        fileIO.createDir(outDir+realFilePath)
      else:
        # If the file doesn't exist, we can just dump data in macBinary format
        currFile = fileIO.createFile(outDir+realFilePath)
        fileIO.append(currFile,0x0) # unused
        fileIO.append(currFile,currArchiveFile.fileNameLen)
        fileIO.append(currFile,currArchiveFile.fileName)
        fileIO.append(currFile,currArchiveFile.fileNamePadding)
        fileIO.append(currFile,currArchiveFile.finfoData.fdType)
        fileIO.append(currFile,currArchiveFile.finfoData.fdCreator)
        fileIO.append(currFile,currArchiveFile.finfoData.fdFlags_8_f)
        fileIO.append(currFile,0x0) # unused
        fileIO.append(currFile,0x00) # win_y_pos
        fileIO.append(currFile,0x00) # win_x_pos
        fileIO.append(currFile,0x00) # win_id
        fileIO.append(currFile,0x0) # protected_flag
        fileIO.append(currFile,0x0) # unused
        fileIO.append(currFile,curArchiveFile.dataForkLength)
        fileIO.append(currFile,curArchiveFile.resourceForkLength)
        fileIO.append(currFile,curArchiveFile.creationDate)
        fileIO.append(currFile,curArchiveFile.modificationDate)
        fileIO.append(currFile,curArchiveFile.fxinfoData.fdComment) # getInfoLength
        fileIO.append(currFile,currArchiveFile.finfoData.fdFlags_0_7)
        fileIO.append(currFile,0x0000) # signature ???
        fileIO.append(currFile,curArchiveFile.fxinfoData.fdScript)
        fileIO.append(currFile,0x0) # fxInfoData.fdXFlags -- this didn't exist when AppleBackup existed, so it's null
        fileIO.append(currFile,0x00000000) # padding
        fileIO.append(currFile,0x0000) # totalUnpackedFilesLength - no idea; look into this
        fileIO.append(currFile,0x00) # SecondHeaderLength - will always be 0, as we don't have extra headers
        fileIO.append(currFile,0x3) # MacBinary Version - we're following 3.  Maybe we should use 2, but we haven't.
        fileIO.append(currFile,0x2) # minMacBinaryVersionNeeded - we're not adding extended data, so this should be v2 compatible
        fileIO.append(currFile,0x0000) # <-- CRC check.  This will fail, but eventually I can overwrite this I guess.
        # Next part duplicated in the else -- I could probably optimize this in the future.
        fileIO.append(currFile,curArchiveFile.dataFork) # if it's empty, we'll just write nothing :)
        # if file padding exists, we've got to EOF. There are edge cases where the file record is exactly 0x200 long
        # or we've written the entire data fork and padded and written none of the resource fork; those should
        # be added to the logic later.  Apple Backup shouldn't do the second by default and the first is unlikely.
        if curArchiveFile.filePadding: 
          dfPaddingLength = (128 - (curArchiveFile.dataForkLength % 128))
          if dfPaddingLength != 128:
            for i = 1 to dfPaddingLength do:
              fileIO.append(currFile,0x0)
        fileIO.append(currFile,curArchiveFile.resourceFork) # if it's empty, we'll just write nothing :)
        if curArchiveFile.filePadding: 
          rfPaddingLength = (128 - (curArchiveFile.resourceForkLength % 128))
          if rfPaddingLength != 128:
            for i = 1 to rfPaddingLength do:
              fileIO.append(currFile,0x0)
    else:
      <find data that needs to be appended to the existing file and append it IF this file spans archive segments>
      if (f.backupDiskHeader.diskNumber > currArchiveFile.fileStartsOnDisk):
        currFile = fileIO.openForAppend(outDir+realFilePath)
        fileIO.append(currFile,curArchiveFile.dataFork) # if it's empty, we'll just write nothing :)
        # if file padding exists, we've got to EOF. There are edge cases where the file record is exactly 0x200 long
        # or we've written the entire data fork and padded and written none of the resource fork; those should
        # be added to the logic later.  Apple Backup shouldn't do the second by default and the first is unlikely.
        if curArchiveFile.filePadding: 
          dfPaddingLength = (128 - (curArchiveFile.dataForkLength % 128))
          if dfPaddingLength != 128:
            for i = 1 to dfPaddingLength do:
              fileIO.append(currFile,0x0)
        fileIO.append(currFile,curArchiveFile.resourceFork) # if it's empty, we'll just write nothing :)
        if curArchiveFile.filePadding: 
          rfPaddingLength = (128 - (curArchiveFile.resourceForkLength % 128))
          if rfPaddingLength != 128:
            for i = 1 to rfPaddingLength do:
              fileIO.append(currFile,0x0)
    fileIO.close(currFile)
