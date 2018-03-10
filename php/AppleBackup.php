<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

class AppleBackup extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_backupDiskHeader = $this->_io->readBytes(512);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_backupDiskHeader);
        $this->_m_backupDiskHeader = new \AppleBackup\BackupDiskHeaderType($io, $this, $this->_root);
        $this->_m__raw_bootBlocks = $this->_io->readBytes(1024);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_bootBlocks);
        $this->_m_bootBlocks = new \AppleBackup\BootBlocksType($io, $this, $this->_root);
        $this->_m__raw_fileData = $this->_io->readBytes(($this->backupDiskHeader()->totalSizeUsed() - 1536));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_fileData);
        $this->_m_fileData = new \AppleBackup\FileDataSeq($io, $this, $this->_root);
    }
    protected $_m_backupDiskHeader;
    protected $_m_bootBlocks;
    protected $_m_fileData;
    protected $_m__raw_backupDiskHeader;
    protected $_m__raw_bootBlocks;
    protected $_m__raw_fileData;
    public function backupDiskHeader() { return $this->_m_backupDiskHeader; }
    public function bootBlocks() { return $this->_m_bootBlocks; }
    public function fileData() { return $this->_m_fileData; }
    public function _raw_backupDiskHeader() { return $this->_m__raw_backupDiskHeader; }
    public function _raw_bootBlocks() { return $this->_m__raw_bootBlocks; }
    public function _raw_fileData() { return $this->_m__raw_fileData; }
}

namespace \AppleBackup;

class FileDataType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup\FileDataSeq $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileVersion = $this->_io->readU2be();
        $this->_m_fileMagic = $this->_io->ensureFixedContents("\x52\x4C\x44\x57");
        $this->_m_fileStartsOnDisk = $this->_io->readU2be();
        $this->_m_backupStartTime = $this->_io->readU4be();
        $this->_m_headerOffset = $this->_io->readU4be();
        $this->_m_fileNameLen = $this->_io->readU1();
        $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->fileNameLen()), "ascii");
        $this->_m_fileNamePadding = $this->_io->readBytes((31 - $this->fileNameLen()));
        $this->_m_filePart = $this->_io->readU2be();
        $this->_m_folderFlags = $this->_io->readU1();
        $this->_m_validityFlag = $this->_io->readU1();
        if ($this->folderFlags() == 0) {
            $this->_m__raw_finfoData = $this->_io->readBytes(16);
            $io = new \Kaitai\Struct\Stream($this->_m__raw_finfoData);
            $this->_m_finfoData = new \AppleBackup\FinfoDataStruct($io, $this, $this->_root);
        }
        if ($this->folderFlags() == 0) {
            $this->_m__raw_fxinfoData = $this->_io->readBytes(16);
            $io = new \Kaitai\Struct\Stream($this->_m__raw_fxinfoData);
            $this->_m_fxinfoData = new \AppleBackup\FxinfoDataStruct($io, $this, $this->_root);
        }
        if ($this->folderFlags() != 0) {
            $this->_m__raw_dinfoData = $this->_io->readBytes(16);
            $io = new \Kaitai\Struct\Stream($this->_m__raw_dinfoData);
            $this->_m_dinfoData = new \AppleBackup\DinfoDataStruct($io, $this, $this->_root);
        }
        if ($this->folderFlags() != 0) {
            $this->_m__raw_dxinfoData = $this->_io->readBytes(16);
            $io = new \Kaitai\Struct\Stream($this->_m__raw_dxinfoData);
            $this->_m_dxinfoData = new \AppleBackup\DxinfoDataStruct($io, $this, $this->_root);
        }
        $this->_m_fileAttributes = $this->_io->readU1();
        $this->_m_fileReserved = $this->_io->readU1();
        $this->_m_creationDate = $this->_io->readU4be();
        $this->_m_modificationDate = $this->_io->readU4be();
        $this->_m_dataForkLength = $this->_io->readU4be();
        $this->_m_resourceForkLength = $this->_io->readU4be();
        $this->_m_dataForkInFileLength = $this->_io->readU4be();
        $this->_m_resourceForkInFileLength = $this->_io->readU4be();
        $this->_m_fullFilePathLength = $this->_io->readU2be();
        $this->_m_fullFilePath = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->fullFilePathLength()), "ascii");
        $this->_m_dataFork = $this->_io->readBytes($this->dataForkInFileLength());
        $this->_m_resourceFork = $this->_io->readBytes($this->resourceForkInFileLength());
        if ( (((512 - \Kaitai\Struct\Stream::mod((((112 + $this->dataForkInFileLength()) + $this->resourceForkInFileLength()) + $this->fullFilePathLength()), 512)) != 512) || (($this->_parent()->_parent()->backupDiskHeader()->diskNumber() - $this->_parent()->_parent()->backupDiskHeader()->totalDisks()) == 0)) ) {
            $this->_m_filePadding = $this->_io->readBytes((512 - \Kaitai\Struct\Stream::mod((((112 + $this->dataForkInFileLength()) + $this->resourceForkInFileLength()) + $this->fullFilePathLength()), 512)));
        }
    }
    protected $_m_fileVersion;
    protected $_m_fileMagic;
    protected $_m_fileStartsOnDisk;
    protected $_m_backupStartTime;
    protected $_m_headerOffset;
    protected $_m_fileNameLen;
    protected $_m_fileName;
    protected $_m_fileNamePadding;
    protected $_m_filePart;
    protected $_m_folderFlags;
    protected $_m_validityFlag;
    protected $_m_finfoData;
    protected $_m_fxinfoData;
    protected $_m_dinfoData;
    protected $_m_dxinfoData;
    protected $_m_fileAttributes;
    protected $_m_fileReserved;
    protected $_m_creationDate;
    protected $_m_modificationDate;
    protected $_m_dataForkLength;
    protected $_m_resourceForkLength;
    protected $_m_dataForkInFileLength;
    protected $_m_resourceForkInFileLength;
    protected $_m_fullFilePathLength;
    protected $_m_fullFilePath;
    protected $_m_dataFork;
    protected $_m_resourceFork;
    protected $_m_filePadding;
    protected $_m__raw_finfoData;
    protected $_m__raw_fxinfoData;
    protected $_m__raw_dinfoData;
    protected $_m__raw_dxinfoData;
    public function fileVersion() { return $this->_m_fileVersion; }
    public function fileMagic() { return $this->_m_fileMagic; }
    public function fileStartsOnDisk() { return $this->_m_fileStartsOnDisk; }

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */
    public function backupStartTime() { return $this->_m_backupStartTime; }
    public function headerOffset() { return $this->_m_headerOffset; }
    public function fileNameLen() { return $this->_m_fileNameLen; }
    public function fileName() { return $this->_m_fileName; }
    public function fileNamePadding() { return $this->_m_fileNamePadding; }
    public function filePart() { return $this->_m_filePart; }
    public function folderFlags() { return $this->_m_folderFlags; }
    public function validityFlag() { return $this->_m_validityFlag; }
    public function finfoData() { return $this->_m_finfoData; }
    public function fxinfoData() { return $this->_m_fxinfoData; }
    public function dinfoData() { return $this->_m_dinfoData; }
    public function dxinfoData() { return $this->_m_dxinfoData; }

    /**
     * HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
     */
    public function fileAttributes() { return $this->_m_fileAttributes; }
    public function fileReserved() { return $this->_m_fileReserved; }

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */
    public function creationDate() { return $this->_m_creationDate; }

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */
    public function modificationDate() { return $this->_m_modificationDate; }
    public function dataForkLength() { return $this->_m_dataForkLength; }
    public function resourceForkLength() { return $this->_m_resourceForkLength; }
    public function dataForkInFileLength() { return $this->_m_dataForkInFileLength; }
    public function resourceForkInFileLength() { return $this->_m_resourceForkInFileLength; }
    public function fullFilePathLength() { return $this->_m_fullFilePathLength; }
    public function fullFilePath() { return $this->_m_fullFilePath; }
    public function dataFork() { return $this->_m_dataFork; }
    public function resourceFork() { return $this->_m_resourceFork; }
    public function filePadding() { return $this->_m_filePadding; }
    public function _raw_finfoData() { return $this->_m__raw_finfoData; }
    public function _raw_fxinfoData() { return $this->_m__raw_fxinfoData; }
    public function _raw_dinfoData() { return $this->_m__raw_dinfoData; }
    public function _raw_dxinfoData() { return $this->_m__raw_dxinfoData; }
}

namespace \AppleBackup;

class FxinfoDataStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup\FileDataType $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fdIconId = $this->_io->readU2be();
        $this->_m_fdUnused = $this->_io->readBytes(8);
        $this->_m_fdComment = $this->_io->readU2be();
        $this->_m_fdPutAway = $this->_io->readU4be();
    }
    protected $_m_fdIconId;
    protected $_m_fdUnused;
    protected $_m_fdComment;
    protected $_m_fdPutAway;
    public function fdIconId() { return $this->_m_fdIconId; }
    public function fdUnused() { return $this->_m_fdUnused; }
    public function fdComment() { return $this->_m_fdComment; }
    public function fdPutAway() { return $this->_m_fdPutAway; }
}

/**
 * Standard SCSI boot blocks, begins with LK, shortly followed by
 * System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
 * Theyare written to the hard drive by the restore program when the 
 * System Folder is blessed as it's restored.
 */

namespace \AppleBackup;

class BootBlocksType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sigBytes = $this->_io->ensureFixedContents("\x4C\x4B");
        $this->_m_branchCode = $this->_io->readU4be();
        $this->_m_bootBlockFlags = $this->_io->readU1();
        $this->_m_bootBlockVersionNumber = $this->_io->readU1();
        $this->_m_secondarySoundAndVideoPages = $this->_io->readU2be();
        $this->_m_lenSystemName = $this->_io->readU1();
        $this->_m_systemName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenSystemName()), "ascii");
        $this->_m_systemNamePadding = $this->_io->readBytes((15 - $this->lenSystemName()));
        $this->_m_lenFinderName = $this->_io->readU1();
        $this->_m_finderName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenFinderName()), "ascii");
        $this->_m_finderNamePadding = $this->_io->readBytes((15 - $this->lenFinderName()));
        $this->_m_lenDebuggerName = $this->_io->readU1();
        $this->_m_debuggerName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenDebuggerName()), "ascii");
        $this->_m_debuggerNamePadding = $this->_io->readBytes((15 - $this->lenDebuggerName()));
        $this->_m_lenDissassemblerName = $this->_io->readU1();
        $this->_m_dissassemblerName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenDissassemblerName()), "ascii");
        $this->_m_dissassemblerNamePadding = $this->_io->readBytes((15 - $this->lenDissassemblerName()));
        $this->_m_lenStartUpScreenName = $this->_io->readU1();
        $this->_m_startUpScreenName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenStartUpScreenName()), "ascii");
        $this->_m_startUpScreenNamePadding = $this->_io->readBytes((15 - $this->lenStartUpScreenName()));
        $this->_m_lenBootUpName = $this->_io->readU1();
        $this->_m_bootUpName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenBootUpName()), "ascii");
        $this->_m_bootUpNamePadding = $this->_io->readBytes((15 - $this->lenBootUpName()));
        $this->_m_lenClipboardName = $this->_io->readU1();
        $this->_m_clipboardName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenClipboardName()), "ascii");
        $this->_m_clipboardNamePadding = $this->_io->readBytes((15 - $this->lenClipboardName()));
        $this->_m_maxFiles = $this->_io->readU2be();
        $this->_m_eventQueueSize = $this->_io->readU2be();
        $this->_m_heapOn128kMac = $this->_io->readU4be();
        $this->_m_heapOn256kMac = $this->_io->readU4be();
        $this->_m_heapOn512kMac = $this->_io->readU4be();
        $this->_m_bootCode = $this->_io->readBytes(886);
    }
    protected $_m_sigBytes;
    protected $_m_branchCode;
    protected $_m_bootBlockFlags;
    protected $_m_bootBlockVersionNumber;
    protected $_m_secondarySoundAndVideoPages;
    protected $_m_lenSystemName;
    protected $_m_systemName;
    protected $_m_systemNamePadding;
    protected $_m_lenFinderName;
    protected $_m_finderName;
    protected $_m_finderNamePadding;
    protected $_m_lenDebuggerName;
    protected $_m_debuggerName;
    protected $_m_debuggerNamePadding;
    protected $_m_lenDissassemblerName;
    protected $_m_dissassemblerName;
    protected $_m_dissassemblerNamePadding;
    protected $_m_lenStartUpScreenName;
    protected $_m_startUpScreenName;
    protected $_m_startUpScreenNamePadding;
    protected $_m_lenBootUpName;
    protected $_m_bootUpName;
    protected $_m_bootUpNamePadding;
    protected $_m_lenClipboardName;
    protected $_m_clipboardName;
    protected $_m_clipboardNamePadding;
    protected $_m_maxFiles;
    protected $_m_eventQueueSize;
    protected $_m_heapOn128kMac;
    protected $_m_heapOn256kMac;
    protected $_m_heapOn512kMac;
    protected $_m_bootCode;
    public function sigBytes() { return $this->_m_sigBytes; }
    public function branchCode() { return $this->_m_branchCode; }
    public function bootBlockFlags() { return $this->_m_bootBlockFlags; }
    public function bootBlockVersionNumber() { return $this->_m_bootBlockVersionNumber; }
    public function secondarySoundAndVideoPages() { return $this->_m_secondarySoundAndVideoPages; }
    public function lenSystemName() { return $this->_m_lenSystemName; }
    public function systemName() { return $this->_m_systemName; }
    public function systemNamePadding() { return $this->_m_systemNamePadding; }
    public function lenFinderName() { return $this->_m_lenFinderName; }
    public function finderName() { return $this->_m_finderName; }
    public function finderNamePadding() { return $this->_m_finderNamePadding; }
    public function lenDebuggerName() { return $this->_m_lenDebuggerName; }
    public function debuggerName() { return $this->_m_debuggerName; }
    public function debuggerNamePadding() { return $this->_m_debuggerNamePadding; }
    public function lenDissassemblerName() { return $this->_m_lenDissassemblerName; }
    public function dissassemblerName() { return $this->_m_dissassemblerName; }
    public function dissassemblerNamePadding() { return $this->_m_dissassemblerNamePadding; }
    public function lenStartUpScreenName() { return $this->_m_lenStartUpScreenName; }
    public function startUpScreenName() { return $this->_m_startUpScreenName; }
    public function startUpScreenNamePadding() { return $this->_m_startUpScreenNamePadding; }
    public function lenBootUpName() { return $this->_m_lenBootUpName; }
    public function bootUpName() { return $this->_m_bootUpName; }
    public function bootUpNamePadding() { return $this->_m_bootUpNamePadding; }
    public function lenClipboardName() { return $this->_m_lenClipboardName; }
    public function clipboardName() { return $this->_m_clipboardName; }
    public function clipboardNamePadding() { return $this->_m_clipboardNamePadding; }
    public function maxFiles() { return $this->_m_maxFiles; }
    public function eventQueueSize() { return $this->_m_eventQueueSize; }
    public function heapOn128kMac() { return $this->_m_heapOn128kMac; }
    public function heapOn256kMac() { return $this->_m_heapOn256kMac; }
    public function heapOn512kMac() { return $this->_m_heapOn512kMac; }
    public function bootCode() { return $this->_m_bootCode; }
}

namespace \AppleBackup;

class DinfoDataStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup\FileDataType $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_frRect = $this->_io->readBytes(8);
        $this->_m_frFlags = $this->_io->readU2be();
        $this->_m_frLocation = $this->_io->readU4be();
        $this->_m_frView = $this->_io->readU2be();
    }
    protected $_m_frRect;
    protected $_m_frFlags;
    protected $_m_frLocation;
    protected $_m_frView;
    public function frRect() { return $this->_m_frRect; }
    public function frFlags() { return $this->_m_frFlags; }
    public function frLocation() { return $this->_m_frLocation; }
    public function frView() { return $this->_m_frView; }
}

namespace \AppleBackup;

class DxinfoDataStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup\FileDataType $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_frScroll = $this->_io->readU4be();
        $this->_m_frOpenChain = $this->_io->readU4be();
        $this->_m_frUnused = $this->_io->readBytes(2);
        $this->_m_frComment = $this->_io->readU2be();
        $this->_m_frPutAway = $this->_io->readU4be();
    }
    protected $_m_frScroll;
    protected $_m_frOpenChain;
    protected $_m_frUnused;
    protected $_m_frComment;
    protected $_m_frPutAway;
    public function frScroll() { return $this->_m_frScroll; }
    public function frOpenChain() { return $this->_m_frOpenChain; }
    public function frUnused() { return $this->_m_frUnused; }
    public function frComment() { return $this->_m_frComment; }
    public function frPutAway() { return $this->_m_frPutAway; }
}

namespace \AppleBackup;

class FileDataSeq extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileDataContents = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_fileDataContents[] = new \AppleBackup\FileDataType($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_fileDataContents;
    public function fileDataContents() { return $this->_m_fileDataContents; }
}

namespace \AppleBackup;

class FinfoDataStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup\FileDataType $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fdType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_fdCreator = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_fdFlags07 = $this->_io->readU1();
        $this->_m_fdFlags8F = $this->_io->readU1();
        $this->_m_fdLocation = $this->_io->readU4be();
        $this->_m_fdFldr = $this->_io->readU2be();
    }
    protected $_m_fdType;
    protected $_m_fdCreator;
    protected $_m_fdFlags07;
    protected $_m_fdFlags8F;
    protected $_m_fdLocation;
    protected $_m_fdFldr;
    public function fdType() { return $this->_m_fdType; }
    public function fdCreator() { return $this->_m_fdCreator; }
    public function fdFlags07() { return $this->_m_fdFlags07; }
    public function fdFlags8F() { return $this->_m_fdFlags8F; }
    public function fdLocation() { return $this->_m_fdLocation; }
    public function fdFldr() { return $this->_m_fdFldr; }
}

namespace \AppleBackup;

class BackupDiskHeaderType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleBackup $_parent = null, \AppleBackup $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2be();
        $this->_m_magic = $this->_io->ensureFixedContents("\x43\x4D\x57\x4C");
        $this->_m_diskNumber = $this->_io->readU2be();
        $this->_m_totalDisks = $this->_io->readU2be();
        $this->_m_backupStartTime = $this->_io->readU4be();
        $this->_m_backupStartTime2 = $this->_io->readU4be();
        $this->_m_hardDriveNameLen = $this->_io->readU1();
        $this->_m_hardDriveName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->hardDriveNameLen()), "ascii");
        $this->_m_hardDriveNamePadding = $this->_io->readBytes((31 - $this->hardDriveNameLen()));
        $this->_m_totalFileSize = $this->_io->readU4be();
        $this->_m_totalSizeUsed = $this->_io->readU4be();
        $this->_m_bdhPadding = $this->_io->readBytes(454);
    }
    protected $_m_version;
    protected $_m_magic;
    protected $_m_diskNumber;
    protected $_m_totalDisks;
    protected $_m_backupStartTime;
    protected $_m_backupStartTime2;
    protected $_m_hardDriveNameLen;
    protected $_m_hardDriveName;
    protected $_m_hardDriveNamePadding;
    protected $_m_totalFileSize;
    protected $_m_totalSizeUsed;
    protected $_m_bdhPadding;

    /**
     * valid up to and including version 0x0104
     */
    public function version() { return $this->_m_version; }

    /**
     * identifies this file as an Apple Backup file
     */
    public function magic() { return $this->_m_magic; }

    /**
     * value is between 1 and total_disks
     */
    public function diskNumber() { return $this->_m_diskNumber; }

    /**
     * total number of disks used for the backup
     */
    public function totalDisks() { return $this->_m_totalDisks; }

    /**
     * Seconds since January 1, 1904 00:00:00 local time
     */
    public function backupStartTime() { return $this->_m_backupStartTime; }

    /**
     * duplicate of backup_start_time
     */
    public function backupStartTime2() { return $this->_m_backupStartTime2; }

    /**
     * Length of the name of the hard drive that was backed up
     */
    public function hardDriveNameLen() { return $this->_m_hardDriveNameLen; }

    /**
     * Name of the hard drive that was backed up
     */
    public function hardDriveName() { return $this->_m_hardDriveName; }

    /**
     * Remainder of Pascal Str31 address space
     */
    public function hardDriveNamePadding() { return $this->_m_hardDriveNamePadding; }

    /**
     * Total size of this restore file; typically 0x161800
     */
    public function totalFileSize() { return $this->_m_totalFileSize; }

    /**
     * Number of bytes actually used in this restore file; usually 0x161800 except for last file
     */
    public function totalSizeUsed() { return $this->_m_totalSizeUsed; }

    /**
     * 0x00 padding to end of header
     */
    public function bdhPadding() { return $this->_m_bdhPadding; }
}
