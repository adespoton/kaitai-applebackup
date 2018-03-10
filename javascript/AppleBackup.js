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
    this._debug = {};

  }
  AppleBackup.prototype._read = function() {
    this._debug.backupDiskHeader = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this._raw_backupDiskHeader = this._io.readBytes(512);
    var _io__raw_backupDiskHeader = new KaitaiStream(this._raw_backupDiskHeader);
    this.backupDiskHeader = new BackupDiskHeaderType(_io__raw_backupDiskHeader, this, this._root);
    this.backupDiskHeader._read();
    this._debug.backupDiskHeader.end = this._io.pos;
    this._debug.bootBlocks = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this._raw_bootBlocks = this._io.readBytes(1024);
    var _io__raw_bootBlocks = new KaitaiStream(this._raw_bootBlocks);
    this.bootBlocks = new BootBlocksType(_io__raw_bootBlocks, this, this._root);
    this.bootBlocks._read();
    this._debug.bootBlocks.end = this._io.pos;
    this._debug.fileData = { start: this._io.pos, ioOffset: this._io._byteOffset };
    this._raw_fileData = this._io.readBytes((this.backupDiskHeader.totalSizeUsed - 1536));
    var _io__raw_fileData = new KaitaiStream(this._raw_fileData);
    this.fileData = new FileDataSeq(_io__raw_fileData, this, this._root);
    this.fileData._read();
    this._debug.fileData.end = this._io.pos;
  }

  var FileDataType = AppleBackup.FileDataType = (function() {
    function FileDataType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    FileDataType.prototype._read = function() {
      this._debug.fileVersion = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileVersion = this._io.readU2be();
      this._debug.fileVersion.end = this._io.pos;
      this._debug.fileMagic = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileMagic = this._io.ensureFixedContents([82, 76, 68, 87]);
      this._debug.fileMagic.end = this._io.pos;
      this._debug.fileStartsOnDisk = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileStartsOnDisk = this._io.readU2be();
      this._debug.fileStartsOnDisk.end = this._io.pos;
      this._debug.backupStartTime = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.backupStartTime = this._io.readU4be();
      this._debug.backupStartTime.end = this._io.pos;
      this._debug.headerOffset = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.headerOffset = this._io.readU4be();
      this._debug.headerOffset.end = this._io.pos;
      this._debug.fileNameLen = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileNameLen = this._io.readU1();
      this._debug.fileNameLen.end = this._io.pos;
      this._debug.fileName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytes(this.fileNameLen), "ascii");
      this._debug.fileName.end = this._io.pos;
      this._debug.fileNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileNamePadding = this._io.readBytes((31 - this.fileNameLen));
      this._debug.fileNamePadding.end = this._io.pos;
      this._debug.filePart = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.filePart = this._io.readU2be();
      this._debug.filePart.end = this._io.pos;
      this._debug.folderFlags = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.folderFlags = this._io.readU1();
      this._debug.folderFlags.end = this._io.pos;
      this._debug.validityFlag = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.validityFlag = this._io.readU1();
      this._debug.validityFlag.end = this._io.pos;
      if (this.folderFlags == 0) {
        this._debug.finfoData = { start: this._io.pos, ioOffset: this._io._byteOffset };
        this._raw_finfoData = this._io.readBytes(16);
        var _io__raw_finfoData = new KaitaiStream(this._raw_finfoData);
        this.finfoData = new FinfoDataStruct(_io__raw_finfoData, this, this._root);
        this.finfoData._read();
        this._debug.finfoData.end = this._io.pos;
      }
      if (this.folderFlags == 0) {
        this._debug.fxinfoData = { start: this._io.pos, ioOffset: this._io._byteOffset };
        this._raw_fxinfoData = this._io.readBytes(16);
        var _io__raw_fxinfoData = new KaitaiStream(this._raw_fxinfoData);
        this.fxinfoData = new FxinfoDataStruct(_io__raw_fxinfoData, this, this._root);
        this.fxinfoData._read();
        this._debug.fxinfoData.end = this._io.pos;
      }
      if (this.folderFlags != 0) {
        this._debug.dinfoData = { start: this._io.pos, ioOffset: this._io._byteOffset };
        this._raw_dinfoData = this._io.readBytes(16);
        var _io__raw_dinfoData = new KaitaiStream(this._raw_dinfoData);
        this.dinfoData = new DinfoDataStruct(_io__raw_dinfoData, this, this._root);
        this.dinfoData._read();
        this._debug.dinfoData.end = this._io.pos;
      }
      if (this.folderFlags != 0) {
        this._debug.dxinfoData = { start: this._io.pos, ioOffset: this._io._byteOffset };
        this._raw_dxinfoData = this._io.readBytes(16);
        var _io__raw_dxinfoData = new KaitaiStream(this._raw_dxinfoData);
        this.dxinfoData = new DxinfoDataStruct(_io__raw_dxinfoData, this, this._root);
        this.dxinfoData._read();
        this._debug.dxinfoData.end = this._io.pos;
      }
      this._debug.fileAttributes = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileAttributes = this._io.readU1();
      this._debug.fileAttributes.end = this._io.pos;
      this._debug.fileReserved = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileReserved = this._io.readU1();
      this._debug.fileReserved.end = this._io.pos;
      this._debug.creationDate = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.creationDate = this._io.readU4be();
      this._debug.creationDate.end = this._io.pos;
      this._debug.modificationDate = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.modificationDate = this._io.readU4be();
      this._debug.modificationDate.end = this._io.pos;
      this._debug.dataForkLength = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.dataForkLength = this._io.readU4be();
      this._debug.dataForkLength.end = this._io.pos;
      this._debug.resourceForkLength = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.resourceForkLength = this._io.readU4be();
      this._debug.resourceForkLength.end = this._io.pos;
      this._debug.dataForkInFileLength = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.dataForkInFileLength = this._io.readU4be();
      this._debug.dataForkInFileLength.end = this._io.pos;
      this._debug.resourceForkInFileLength = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.resourceForkInFileLength = this._io.readU4be();
      this._debug.resourceForkInFileLength.end = this._io.pos;
      this._debug.fullFilePathLength = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fullFilePathLength = this._io.readU2be();
      this._debug.fullFilePathLength.end = this._io.pos;
      this._debug.fullFilePath = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fullFilePath = KaitaiStream.bytesToStr(this._io.readBytes(this.fullFilePathLength), "ascii");
      this._debug.fullFilePath.end = this._io.pos;
      this._debug.dataFork = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.dataFork = this._io.readBytes(this.dataForkInFileLength);
      this._debug.dataFork.end = this._io.pos;
      this._debug.resourceFork = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.resourceFork = this._io.readBytes(this.resourceForkInFileLength);
      this._debug.resourceFork.end = this._io.pos;
      if ( (((512 - KaitaiStream.mod((((112 + this.dataForkInFileLength) + this.resourceForkInFileLength) + this.fullFilePathLength), 512)) != 512) || ((this._parent._parent.backupDiskHeader.diskNumber - this._parent._parent.backupDiskHeader.totalDisks) == 0)) ) {
        this._debug.filePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
        this.filePadding = this._io.readBytes((512 - KaitaiStream.mod((((112 + this.dataForkInFileLength) + this.resourceForkInFileLength) + this.fullFilePathLength), 512)));
        this._debug.filePadding.end = this._io.pos;
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
      this._debug = {};

    }
    FxinfoDataStruct.prototype._read = function() {
      this._debug.fdIconId = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdIconId = this._io.readU2be();
      this._debug.fdIconId.end = this._io.pos;
      this._debug.fdUnused = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdUnused = this._io.readBytes(8);
      this._debug.fdUnused.end = this._io.pos;
      this._debug.fdComment = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdComment = this._io.readU2be();
      this._debug.fdComment.end = this._io.pos;
      this._debug.fdPutAway = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdPutAway = this._io.readU4be();
      this._debug.fdPutAway.end = this._io.pos;
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
      this._debug = {};

    }
    BootBlocksType.prototype._read = function() {
      this._debug.sigBytes = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.sigBytes = this._io.ensureFixedContents([76, 75]);
      this._debug.sigBytes.end = this._io.pos;
      this._debug.branchCode = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.branchCode = this._io.readU4be();
      this._debug.branchCode.end = this._io.pos;
      this._debug.bootBlockFlags = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bootBlockFlags = this._io.readU1();
      this._debug.bootBlockFlags.end = this._io.pos;
      this._debug.bootBlockVersionNumber = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bootBlockVersionNumber = this._io.readU1();
      this._debug.bootBlockVersionNumber.end = this._io.pos;
      this._debug.secondarySoundAndVideoPages = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.secondarySoundAndVideoPages = this._io.readU2be();
      this._debug.secondarySoundAndVideoPages.end = this._io.pos;
      this._debug.lenSystemName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenSystemName = this._io.readU1();
      this._debug.lenSystemName.end = this._io.pos;
      this._debug.systemName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.systemName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenSystemName), "ascii");
      this._debug.systemName.end = this._io.pos;
      this._debug.systemNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.systemNamePadding = this._io.readBytes((15 - this.lenSystemName));
      this._debug.systemNamePadding.end = this._io.pos;
      this._debug.lenFinderName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenFinderName = this._io.readU1();
      this._debug.lenFinderName.end = this._io.pos;
      this._debug.finderName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.finderName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenFinderName), "ascii");
      this._debug.finderName.end = this._io.pos;
      this._debug.finderNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.finderNamePadding = this._io.readBytes((15 - this.lenFinderName));
      this._debug.finderNamePadding.end = this._io.pos;
      this._debug.lenDebuggerName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenDebuggerName = this._io.readU1();
      this._debug.lenDebuggerName.end = this._io.pos;
      this._debug.debuggerName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.debuggerName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenDebuggerName), "ascii");
      this._debug.debuggerName.end = this._io.pos;
      this._debug.debuggerNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.debuggerNamePadding = this._io.readBytes((15 - this.lenDebuggerName));
      this._debug.debuggerNamePadding.end = this._io.pos;
      this._debug.lenDissassemblerName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenDissassemblerName = this._io.readU1();
      this._debug.lenDissassemblerName.end = this._io.pos;
      this._debug.dissassemblerName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.dissassemblerName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenDissassemblerName), "ascii");
      this._debug.dissassemblerName.end = this._io.pos;
      this._debug.dissassemblerNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.dissassemblerNamePadding = this._io.readBytes((15 - this.lenDissassemblerName));
      this._debug.dissassemblerNamePadding.end = this._io.pos;
      this._debug.lenStartUpScreenName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenStartUpScreenName = this._io.readU1();
      this._debug.lenStartUpScreenName.end = this._io.pos;
      this._debug.startUpScreenName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.startUpScreenName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenStartUpScreenName), "ascii");
      this._debug.startUpScreenName.end = this._io.pos;
      this._debug.startUpScreenNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.startUpScreenNamePadding = this._io.readBytes((15 - this.lenStartUpScreenName));
      this._debug.startUpScreenNamePadding.end = this._io.pos;
      this._debug.lenBootUpName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenBootUpName = this._io.readU1();
      this._debug.lenBootUpName.end = this._io.pos;
      this._debug.bootUpName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bootUpName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenBootUpName), "ascii");
      this._debug.bootUpName.end = this._io.pos;
      this._debug.bootUpNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bootUpNamePadding = this._io.readBytes((15 - this.lenBootUpName));
      this._debug.bootUpNamePadding.end = this._io.pos;
      this._debug.lenClipboardName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.lenClipboardName = this._io.readU1();
      this._debug.lenClipboardName.end = this._io.pos;
      this._debug.clipboardName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.clipboardName = KaitaiStream.bytesToStr(this._io.readBytes(this.lenClipboardName), "ascii");
      this._debug.clipboardName.end = this._io.pos;
      this._debug.clipboardNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.clipboardNamePadding = this._io.readBytes((15 - this.lenClipboardName));
      this._debug.clipboardNamePadding.end = this._io.pos;
      this._debug.maxFiles = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.maxFiles = this._io.readU2be();
      this._debug.maxFiles.end = this._io.pos;
      this._debug.eventQueueSize = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.eventQueueSize = this._io.readU2be();
      this._debug.eventQueueSize.end = this._io.pos;
      this._debug.heapOn128kMac = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.heapOn128kMac = this._io.readU4be();
      this._debug.heapOn128kMac.end = this._io.pos;
      this._debug.heapOn256kMac = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.heapOn256kMac = this._io.readU4be();
      this._debug.heapOn256kMac.end = this._io.pos;
      this._debug.heapOn512kMac = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.heapOn512kMac = this._io.readU4be();
      this._debug.heapOn512kMac.end = this._io.pos;
      this._debug.bootCode = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bootCode = this._io.readBytes(886);
      this._debug.bootCode.end = this._io.pos;
    }

    return BootBlocksType;
  })();

  var DinfoDataStruct = AppleBackup.DinfoDataStruct = (function() {
    function DinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    DinfoDataStruct.prototype._read = function() {
      this._debug.frRect = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frRect = this._io.readBytes(8);
      this._debug.frRect.end = this._io.pos;
      this._debug.frFlags = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frFlags = this._io.readU2be();
      this._debug.frFlags.end = this._io.pos;
      this._debug.frLocation = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frLocation = this._io.readU4be();
      this._debug.frLocation.end = this._io.pos;
      this._debug.frView = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frView = this._io.readU2be();
      this._debug.frView.end = this._io.pos;
    }

    return DinfoDataStruct;
  })();

  var DxinfoDataStruct = AppleBackup.DxinfoDataStruct = (function() {
    function DxinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    DxinfoDataStruct.prototype._read = function() {
      this._debug.frScroll = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frScroll = this._io.readU4be();
      this._debug.frScroll.end = this._io.pos;
      this._debug.frOpenChain = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frOpenChain = this._io.readU4be();
      this._debug.frOpenChain.end = this._io.pos;
      this._debug.frUnused = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frUnused = this._io.readBytes(2);
      this._debug.frUnused.end = this._io.pos;
      this._debug.frComment = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frComment = this._io.readU2be();
      this._debug.frComment.end = this._io.pos;
      this._debug.frPutAway = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.frPutAway = this._io.readU4be();
      this._debug.frPutAway.end = this._io.pos;
    }

    return DxinfoDataStruct;
  })();

  var FileDataSeq = AppleBackup.FileDataSeq = (function() {
    function FileDataSeq(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    FileDataSeq.prototype._read = function() {
      this._debug.fileDataContents = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fileDataContents = [];
      this._debug.fileDataContents.arr = [];
      var i = 0;
      while (!this._io.isEof()) {
        this._debug.fileDataContents.arr[this.fileDataContents.length] = { start: this._io.pos, ioOffset: this._io._byteOffset };
        var _t_fileDataContents = new FileDataType(this._io, this, this._root);
        _t_fileDataContents._read();
        this.fileDataContents.push(_t_fileDataContents);
        this._debug.fileDataContents.arr[this.fileDataContents.length - 1].end = this._io.pos;
        i++;
      }
      this._debug.fileDataContents.end = this._io.pos;
    }

    return FileDataSeq;
  })();

  var FinfoDataStruct = AppleBackup.FinfoDataStruct = (function() {
    function FinfoDataStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    FinfoDataStruct.prototype._read = function() {
      this._debug.fdType = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this._debug.fdType.end = this._io.pos;
      this._debug.fdCreator = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdCreator = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
      this._debug.fdCreator.end = this._io.pos;
      this._debug.fdFlags07 = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdFlags07 = this._io.readU1();
      this._debug.fdFlags07.end = this._io.pos;
      this._debug.fdFlags8F = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdFlags8F = this._io.readU1();
      this._debug.fdFlags8F.end = this._io.pos;
      this._debug.fdLocation = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdLocation = this._io.readU4be();
      this._debug.fdLocation.end = this._io.pos;
      this._debug.fdFldr = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.fdFldr = this._io.readU2be();
      this._debug.fdFldr.end = this._io.pos;
    }

    return FinfoDataStruct;
  })();

  var BackupDiskHeaderType = AppleBackup.BackupDiskHeaderType = (function() {
    function BackupDiskHeaderType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this._debug = {};

    }
    BackupDiskHeaderType.prototype._read = function() {
      this._debug.version = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.version = this._io.readU2be();
      this._debug.version.end = this._io.pos;
      this._debug.magic = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.magic = this._io.ensureFixedContents([67, 77, 87, 76]);
      this._debug.magic.end = this._io.pos;
      this._debug.diskNumber = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.diskNumber = this._io.readU2be();
      this._debug.diskNumber.end = this._io.pos;
      this._debug.totalDisks = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.totalDisks = this._io.readU2be();
      this._debug.totalDisks.end = this._io.pos;
      this._debug.backupStartTime = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.backupStartTime = this._io.readU4be();
      this._debug.backupStartTime.end = this._io.pos;
      this._debug.backupStartTime2 = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.backupStartTime2 = this._io.readU4be();
      this._debug.backupStartTime2.end = this._io.pos;
      this._debug.hardDriveNameLen = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.hardDriveNameLen = this._io.readU1();
      this._debug.hardDriveNameLen.end = this._io.pos;
      this._debug.hardDriveName = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.hardDriveName = KaitaiStream.bytesToStr(this._io.readBytes(this.hardDriveNameLen), "ascii");
      this._debug.hardDriveName.end = this._io.pos;
      this._debug.hardDriveNamePadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.hardDriveNamePadding = this._io.readBytes((31 - this.hardDriveNameLen));
      this._debug.hardDriveNamePadding.end = this._io.pos;
      this._debug.totalFileSize = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.totalFileSize = this._io.readU4be();
      this._debug.totalFileSize.end = this._io.pos;
      this._debug.totalSizeUsed = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.totalSizeUsed = this._io.readU4be();
      this._debug.totalSizeUsed.end = this._io.pos;
      this._debug.bdhPadding = { start: this._io.pos, ioOffset: this._io._byteOffset };
      this.bdhPadding = this._io.readBytes(454);
      this._debug.bdhPadding.end = this._io.pos;
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
