// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AppleBackup = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
 * These computers did not come with install disks, but instead with software pre-installed
 * on the hard disk, with an Apple Backup program that could be used to back the hard disk's
 * contents up to 1440KB floppy disks in 1414KB files named "Backup Disk #" where # was 1 
 * through the last disk needed for a full drive backup.
 * These files had the Type/Creator codes of OBDa and OBBa.
 * Later versions of the Performa line came with Restore CDs that contained "Restore All Software"
 * and "Restore System Software" folders containing 1414KB files named "Data File #" -- where all
 * the required files resided in the same folder on the CD.
 * These files had the Type/Creatorcodes of OBDc and OBBa.
 * Both file types are flat data files as indicated in the struct below.
 * @see {@link https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/|Source}
 */

var AppleBackup = (function() {
  function AppleBackup(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AppleBackup.prototype._read = function() {
    this._raw_backupDiskHeader = this._io.readBytes(512);
    var _io__raw_backupDiskHeader = new KaitaiStream(this._raw_backupDiskHeader);
    this.backupDiskHeader = new BackupDiskHeaderType(_io__raw_backupDiskHeader, this, this._root);
    this._raw_bootBlocks = this._io.readBytes(1024);
    var _io__raw_bootBlocks = new KaitaiStream(this._raw_bootBlocks);
    this.bootBlocks = new BootBlocksType(_io__raw_bootBlocks, this, this._root);
    this._raw_fileData = this._io.readBytes((this.backupDiskHeader.totalSizeUsed - 1536));
    var _io__raw_fileData = new KaitaiStream(this._raw_fileData);
    this.fileData = new FileDataSeq(_io__raw_fileData, this, this._root);
  }

  var FileDataType = AppleBackup.FileDataType = (function() {
    function FileDataType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileDataType.prototype._read = function() {
      this.fileVersion = this._io.readU2be();
      this.fileMagic = this._io.ensureFixedContents([82, 76, 68, 87]);
      this.fileStartsOnDisk = this._io.readU2be();
      this.backupStartTime = this._io.readU4be();
      this.headerOffset = this._io.readU4be();
      this.fileNameLen = this._io.readU1();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.fileNameLen), "ascii");
      this.fileNamePadding = this._io.readBytes((31 - this.fileNameLen));
      this.filePart = this._io.readU2be();
      this.folderFlags = this._io.readU1();
      this.validityFlag = this._io.readU1();
      if (this.folderFlags == 0) {
        this._raw_finfoData = this._io.readBytes(16);
        var _io__raw_finfoData = new KaitaiStream(this._raw_finfoData);
        this.finfoData = new FinfoDataStruct(_io__raw_finfoData, this, this._root);
      }
      if (this.folderFlags == 0) {
        this._raw_fxinfoData = this._io.readBytes(16);
        var _io__raw_fxinfoData = new KaitaiStream(this._raw_fxinfoData);
        this.fxinfoData = new FxinfoDataStruct(_io__raw_fxinfoData, this, this._root);
      }
      if (this.folderFlags != 0) {
        this._raw_dinfoData = this._io.readBytes(16);
        var _io__raw_dinfoData = new KaitaiStream(this._raw_dinfoData);
        this.dinfoData = new DinfoDataStruct(_io__raw_dinfoData, this, this._root);
      }
      if (this.folderFlags != 0) {
        this._raw_dxinfoData = this._io.readBytes(16);
        var _io__raw_dxinfoData = new KaitaiStream(this._raw_dxinfoData);
        this.dxinfoData = new DxinfoDataStruct(_io__raw_dxinfoData, this, this._root);
      }
      this.fileAttributes = this._io.readU1();
      this.fileReserved = this._io.readU1();
      this.creationDate = this._io.readU4be();
      this.modificationDate = this._io.readU4be();
      this.dataForkLength = this._io.readU4be();
      this.resourceForkLength = this._io.readU4be();
      this.dataForkInFileLength = this._io.readU4be();
      this.resourceForkInFileLength = this._io.readU4be();
      this.fullFilePathLength = this._io.readU2be();
      this.fullFilePath = KaitaiStream.bytesToStr(this._io.readBytes(this.fullFilePathLength), "ascii");
      this.dataFork = this._io.readBytes(this.dataForkInFileLength);
      this.resourceFork = this._io.readBytes(this.resourceForkInFileLength);
      if ( (((512 - KaitaiStream.mod((((112 + this.dataForkInFileLength) + this.resourceForkInFileLength) + this.fullFilePathLength), 512)) != 512) || ((this._parent._parent.backupDiskHeader.diskNumber - this._parent._parent.backupDiskHeader.totalDisks) == 0)) ) {
        this.filePadding = this._io.readBytes((512 - KaitaiStream.mod((((112 + this.dataForkInFileLength) + this.resourceForkInFileLength) + this.fullFilePathLength), 512)));
      }
    }

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */

    /**
     * HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
     */

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */

    return FileDataType;
  })();

  var FxinfoDataStruct = AppleBackup.FxinfoDataStruct = (function() {
    function FxinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FxinfoDataStruct.prototype._read = function() {
      this.fdIconId = this._io.readU2be();
      this.fdUnused = this._io.readBytes(8);
      this.fdComment = this._io.readU2be();
      this.fdPutAway = this._io.readU4be();
    }

    return FxinfoDataStruct;
  })();

  /**
   * Standard SCSI boot blocks, begins with LK, shortly followed by
   * System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
   * Theyare written to the hard drive by the restore program when the 
   * System Folder is blessed as it's restored.
   * @see {@link http://mcosre.sourceforge.net/docs/boot_blocks.html|Source}
   */

  var BootBlocksType = AppleBackup.BootBlocksType = (function() {
    function BootBlocksType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BootBlocksType.prototype._read = function() {
      this.sigBytes = this._io.ensureFixedContents([76, 75]);
      this.branchCode = this._io.readU4be();
      this.bootBlockFlags = this._io.readU1();
      this.bootBlockVersionNumber = this._io.readU1();
      this.secondarySoundAndVideoPages = this._io.readU2be();
      this.lenSystemName = this._io.readU1();
      this.systemName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenSystemName), "ascii");
      this.systemNamePadding = this._io.readBytes((15 - this.lenSystemName));
      this.lenFinderName = this._io.readU1();
      this.finderName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFinderName), "ascii");
      this.finderNamePadding = this._io.readBytes((15 - this.lenFinderName));
      this.lenDebuggerName = this._io.readU1();
      this.debuggerName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenDebuggerName), "ascii");
      this.debuggerNamePadding = this._io.readBytes((15 - this.lenDebuggerName));
      this.lenDissassemblerName = this._io.readU1();
      this.dissassemblerName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenDissassemblerName), "ascii");
      this.dissassemblerNamePadding = this._io.readBytes((15 - this.lenDissassemblerName));
      this.lenStartUpScreenName = this._io.readU1();
      this.startUpScreenName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenStartUpScreenName), "ascii");
      this.startUpScreenNamePadding = this._io.readBytes((15 - this.lenStartUpScreenName));
      this.lenBootUpName = this._io.readU1();
      this.bootUpName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenBootUpName), "ascii");
      this.bootUpNamePadding = this._io.readBytes((15 - this.lenBootUpName));
      this.lenClipboardName = this._io.readU1();
      this.clipboardName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenClipboardName), "ascii");
      this.clipboardNamePadding = this._io.readBytes((15 - this.lenClipboardName));
      this.maxFiles = this._io.readU2be();
      this.eventQueueSize = this._io.readU2be();
      this.heapOn128kMac = this._io.readU4be();
      this.heapOn256kMac = this._io.readU4be();
      this.heapOn512kMac = this._io.readU4be();
      this.bootCode = this._io.readBytes(886);
    }

    return BootBlocksType;
  })();

  var DinfoDataStruct = AppleBackup.DinfoDataStruct = (function() {
    function DinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DinfoDataStruct.prototype._read = function() {
      this.frRect = this._io.readBytes(8);
      this.frFlags = this._io.readU2be();
      this.frLocation = this._io.readU4be();
      this.frView = this._io.readU2be();
    }

    return DinfoDataStruct;
  })();

  var DxinfoDataStruct = AppleBackup.DxinfoDataStruct = (function() {
    function DxinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DxinfoDataStruct.prototype._read = function() {
      this.frScroll = this._io.readU4be();
      this.frOpenChain = this._io.readU4be();
      this.frUnused = this._io.readBytes(2);
      this.frComment = this._io.readU2be();
      this.frPutAway = this._io.readU4be();
    }

    return DxinfoDataStruct;
  })();

  var FileDataSeq = AppleBackup.FileDataSeq = (function() {
    function FileDataSeq(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileDataSeq.prototype._read = function() {
      this.fileDataContents = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.fileDataContents.push(new FileDataType(this._io, this, this._root));
        i++;
      }
    }

    return FileDataSeq;
  })();

  var FinfoDataStruct = AppleBackup.FinfoDataStruct = (function() {
    function FinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FinfoDataStruct.prototype._read = function() {
      this.fdType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this.fdCreator = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this.fdFlags07 = this._io.readU1();
      this.fdFlags8F = this._io.readU1();
      this.fdLocation = this._io.readU4be();
      this.fdFldr = this._io.readU2be();
    }

    return FinfoDataStruct;
  })();

  var BackupDiskHeaderType = AppleBackup.BackupDiskHeaderType = (function() {
    function BackupDiskHeaderType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BackupDiskHeaderType.prototype._read = function() {
      this.version = this._io.readU2be();
      this.magic = this._io.ensureFixedContents([67, 77, 87, 76]);
      this.diskNumber = this._io.readU2be();
      this.totalDisks = this._io.readU2be();
      this.backupStartTime = this._io.readU4be();
      this.backupStartTime2 = this._io.readU4be();
      this.hardDriveNameLen = this._io.readU1();
      this.hardDriveName = KaitaiStream.bytesToStr(this._io.readBytes(this.hardDriveNameLen), "ascii");
      this.hardDriveNamePadding = this._io.readBytes((31 - this.hardDriveNameLen));
      this.totalFileSize = this._io.readU4be();
      this.totalSizeUsed = this._io.readU4be();
      this.bdhPadding = this._io.readBytes(454);
    }

    /**
     * valid up to and including version 0x0104
     */

    /**
     * identifies this file as an Apple Backup file
     */

    /**
     * value is between 1 and total_disks
     */

    /**
     * total number of disks used for the backup
     */

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */

    /**
     * duplicate of backup_start_time
     */

    /**
     * Length of the name of the hard drive that was backed up
     */

    /**
     * Name of the hard drive that was backed up
     */

    /**
     * Remainder of Pascal Str31 address space
     */

    /**
     * Total size of this restore file; typically 0x161800
     */

    /**
     * Number of bytes actually used in this restore file; usually 0x161800 except for last file
     */

    /**
     * 0x00 padding to end of header
     */

    return BackupDiskHeaderType;
  })();

  return AppleBackup;
})();
return AppleBackup;
}));
