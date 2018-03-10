// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;


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
 * @see <a href="https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/">Source</a>
 */
public class AppleBackup extends KaitaiStruct {
    public static AppleBackup fromFile(String fileName) throws IOException {
        return new AppleBackup(new ByteBufferKaitaiStream(fileName));
    }

    public AppleBackup(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AppleBackup(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AppleBackup(KaitaiStream _io, KaitaiStruct _parent, AppleBackup _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_backupDiskHeader = this._io.readBytes(512);
        KaitaiStream _io__raw_backupDiskHeader = new ByteBufferKaitaiStream(_raw_backupDiskHeader);
        this.backupDiskHeader = new BackupDiskHeaderType(_io__raw_backupDiskHeader, this, _root);
        this._raw_bootBlocks = this._io.readBytes(1024);
        KaitaiStream _io__raw_bootBlocks = new ByteBufferKaitaiStream(_raw_bootBlocks);
        this.bootBlocks = new BootBlocksType(_io__raw_bootBlocks, this, _root);
        this._raw_fileData = this._io.readBytes((backupDiskHeader().totalSizeUsed() - 1536));
        KaitaiStream _io__raw_fileData = new ByteBufferKaitaiStream(_raw_fileData);
        this.fileData = new FileDataSeq(_io__raw_fileData, this, _root);
    }
    public static class FileDataType extends KaitaiStruct {
        public static FileDataType fromFile(String fileName) throws IOException {
            return new FileDataType(new ByteBufferKaitaiStream(fileName));
        }

        public FileDataType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileDataType(KaitaiStream _io, AppleBackup.FileDataSeq _parent) {
            this(_io, _parent, null);
        }

        public FileDataType(KaitaiStream _io, AppleBackup.FileDataSeq _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileVersion = this._io.readU2be();
            this.fileMagic = this._io.ensureFixedContents(new byte[] { 82, 76, 68, 87 });
            this.fileStartsOnDisk = this._io.readU2be();
            this.backupStartTime = this._io.readU4be();
            this.headerOffset = this._io.readU4be();
            this.fileNameLen = this._io.readU1();
            this.fileName = new String(this._io.readBytes(fileNameLen()), Charset.forName("ascii"));
            this.fileNamePadding = this._io.readBytes((31 - fileNameLen()));
            this.filePart = this._io.readU2be();
            this.folderFlags = this._io.readU1();
            this.validityFlag = this._io.readU1();
            if (folderFlags() == 0) {
                this._raw_finfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_finfoData = new ByteBufferKaitaiStream(_raw_finfoData);
                this.finfoData = new FinfoDataStruct(_io__raw_finfoData, this, _root);
            }
            if (folderFlags() == 0) {
                this._raw_fxinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_fxinfoData = new ByteBufferKaitaiStream(_raw_fxinfoData);
                this.fxinfoData = new FxinfoDataStruct(_io__raw_fxinfoData, this, _root);
            }
            if (folderFlags() != 0) {
                this._raw_dinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_dinfoData = new ByteBufferKaitaiStream(_raw_dinfoData);
                this.dinfoData = new DinfoDataStruct(_io__raw_dinfoData, this, _root);
            }
            if (folderFlags() != 0) {
                this._raw_dxinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_dxinfoData = new ByteBufferKaitaiStream(_raw_dxinfoData);
                this.dxinfoData = new DxinfoDataStruct(_io__raw_dxinfoData, this, _root);
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
            this.fullFilePath = new String(this._io.readBytes(fullFilePathLength()), Charset.forName("ascii"));
            this.dataFork = this._io.readBytes(dataForkInFileLength());
            this.resourceFork = this._io.readBytes(resourceForkInFileLength());
            if ( (((512 - KaitaiStream.mod((((112 + dataForkInFileLength()) + resourceForkInFileLength()) + fullFilePathLength()), 512)) != 512) || ((_parent()._parent().backupDiskHeader().diskNumber() - _parent()._parent().backupDiskHeader().totalDisks()) == 0)) ) {
                this.filePadding = this._io.readBytes((512 - KaitaiStream.mod((((112 + dataForkInFileLength()) + resourceForkInFileLength()) + fullFilePathLength()), 512)));
            }
        }
        private int fileVersion;
        private byte[] fileMagic;
        private int fileStartsOnDisk;
        private long backupStartTime;
        private long headerOffset;
        private int fileNameLen;
        private String fileName;
        private byte[] fileNamePadding;
        private int filePart;
        private int folderFlags;
        private int validityFlag;
        private FinfoDataStruct finfoData;
        private FxinfoDataStruct fxinfoData;
        private DinfoDataStruct dinfoData;
        private DxinfoDataStruct dxinfoData;
        private int fileAttributes;
        private int fileReserved;
        private long creationDate;
        private long modificationDate;
        private long dataForkLength;
        private long resourceForkLength;
        private long dataForkInFileLength;
        private long resourceForkInFileLength;
        private int fullFilePathLength;
        private String fullFilePath;
        private byte[] dataFork;
        private byte[] resourceFork;
        private byte[] filePadding;
        private AppleBackup _root;
        private AppleBackup.FileDataSeq _parent;
        private byte[] _raw_finfoData;
        private byte[] _raw_fxinfoData;
        private byte[] _raw_dinfoData;
        private byte[] _raw_dxinfoData;
        public int fileVersion() { return fileVersion; }
        public byte[] fileMagic() { return fileMagic; }
        public int fileStartsOnDisk() { return fileStartsOnDisk; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        public long backupStartTime() { return backupStartTime; }
        public long headerOffset() { return headerOffset; }
        public int fileNameLen() { return fileNameLen; }
        public String fileName() { return fileName; }
        public byte[] fileNamePadding() { return fileNamePadding; }
        public int filePart() { return filePart; }
        public int folderFlags() { return folderFlags; }
        public int validityFlag() { return validityFlag; }
        public FinfoDataStruct finfoData() { return finfoData; }
        public FxinfoDataStruct fxinfoData() { return fxinfoData; }
        public DinfoDataStruct dinfoData() { return dinfoData; }
        public DxinfoDataStruct dxinfoData() { return dxinfoData; }

        /**
         * HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
         */
        public int fileAttributes() { return fileAttributes; }
        public int fileReserved() { return fileReserved; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        public long creationDate() { return creationDate; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        public long modificationDate() { return modificationDate; }
        public long dataForkLength() { return dataForkLength; }
        public long resourceForkLength() { return resourceForkLength; }
        public long dataForkInFileLength() { return dataForkInFileLength; }
        public long resourceForkInFileLength() { return resourceForkInFileLength; }
        public int fullFilePathLength() { return fullFilePathLength; }
        public String fullFilePath() { return fullFilePath; }
        public byte[] dataFork() { return dataFork; }
        public byte[] resourceFork() { return resourceFork; }
        public byte[] filePadding() { return filePadding; }
        public AppleBackup _root() { return _root; }
        public AppleBackup.FileDataSeq _parent() { return _parent; }
        public byte[] _raw_finfoData() { return _raw_finfoData; }
        public byte[] _raw_fxinfoData() { return _raw_fxinfoData; }
        public byte[] _raw_dinfoData() { return _raw_dinfoData; }
        public byte[] _raw_dxinfoData() { return _raw_dxinfoData; }
    }
    public static class FxinfoDataStruct extends KaitaiStruct {
        public static FxinfoDataStruct fromFile(String fileName) throws IOException {
            return new FxinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }

        public FxinfoDataStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FxinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent) {
            this(_io, _parent, null);
        }

        public FxinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fdIconId = this._io.readU2be();
            this.fdUnused = this._io.readBytes(8);
            this.fdComment = this._io.readU2be();
            this.fdPutAway = this._io.readU4be();
        }
        private int fdIconId;
        private byte[] fdUnused;
        private int fdComment;
        private long fdPutAway;
        private AppleBackup _root;
        private AppleBackup.FileDataType _parent;
        public int fdIconId() { return fdIconId; }
        public byte[] fdUnused() { return fdUnused; }
        public int fdComment() { return fdComment; }
        public long fdPutAway() { return fdPutAway; }
        public AppleBackup _root() { return _root; }
        public AppleBackup.FileDataType _parent() { return _parent; }
    }

    /**
     * Standard SCSI boot blocks, begins with LK, shortly followed by
     * System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
     * Theyare written to the hard drive by the restore program when the 
     * System Folder is blessed as it's restored.
     * @see <a href="http://mcosre.sourceforge.net/docs/boot_blocks.html">Source</a>
     */
    public static class BootBlocksType extends KaitaiStruct {
        public static BootBlocksType fromFile(String fileName) throws IOException {
            return new BootBlocksType(new ByteBufferKaitaiStream(fileName));
        }

        public BootBlocksType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BootBlocksType(KaitaiStream _io, AppleBackup _parent) {
            this(_io, _parent, null);
        }

        public BootBlocksType(KaitaiStream _io, AppleBackup _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sigBytes = this._io.ensureFixedContents(new byte[] { 76, 75 });
            this.branchCode = this._io.readU4be();
            this.bootBlockFlags = this._io.readU1();
            this.bootBlockVersionNumber = this._io.readU1();
            this.secondarySoundAndVideoPages = this._io.readU2be();
            this.lenSystemName = this._io.readU1();
            this.systemName = new String(this._io.readBytes(lenSystemName()), Charset.forName("ascii"));
            this.systemNamePadding = this._io.readBytes((15 - lenSystemName()));
            this.lenFinderName = this._io.readU1();
            this.finderName = new String(this._io.readBytes(lenFinderName()), Charset.forName("ascii"));
            this.finderNamePadding = this._io.readBytes((15 - lenFinderName()));
            this.lenDebuggerName = this._io.readU1();
            this.debuggerName = new String(this._io.readBytes(lenDebuggerName()), Charset.forName("ascii"));
            this.debuggerNamePadding = this._io.readBytes((15 - lenDebuggerName()));
            this.lenDissassemblerName = this._io.readU1();
            this.dissassemblerName = new String(this._io.readBytes(lenDissassemblerName()), Charset.forName("ascii"));
            this.dissassemblerNamePadding = this._io.readBytes((15 - lenDissassemblerName()));
            this.lenStartUpScreenName = this._io.readU1();
            this.startUpScreenName = new String(this._io.readBytes(lenStartUpScreenName()), Charset.forName("ascii"));
            this.startUpScreenNamePadding = this._io.readBytes((15 - lenStartUpScreenName()));
            this.lenBootUpName = this._io.readU1();
            this.bootUpName = new String(this._io.readBytes(lenBootUpName()), Charset.forName("ascii"));
            this.bootUpNamePadding = this._io.readBytes((15 - lenBootUpName()));
            this.lenClipboardName = this._io.readU1();
            this.clipboardName = new String(this._io.readBytes(lenClipboardName()), Charset.forName("ascii"));
            this.clipboardNamePadding = this._io.readBytes((15 - lenClipboardName()));
            this.maxFiles = this._io.readU2be();
            this.eventQueueSize = this._io.readU2be();
            this.heapOn128kMac = this._io.readU4be();
            this.heapOn256kMac = this._io.readU4be();
            this.heapOn512kMac = this._io.readU4be();
            this.bootCode = this._io.readBytes(886);
        }
        private byte[] sigBytes;
        private long branchCode;
        private int bootBlockFlags;
        private int bootBlockVersionNumber;
        private int secondarySoundAndVideoPages;
        private int lenSystemName;
        private String systemName;
        private byte[] systemNamePadding;
        private int lenFinderName;
        private String finderName;
        private byte[] finderNamePadding;
        private int lenDebuggerName;
        private String debuggerName;
        private byte[] debuggerNamePadding;
        private int lenDissassemblerName;
        private String dissassemblerName;
        private byte[] dissassemblerNamePadding;
        private int lenStartUpScreenName;
        private String startUpScreenName;
        private byte[] startUpScreenNamePadding;
        private int lenBootUpName;
        private String bootUpName;
        private byte[] bootUpNamePadding;
        private int lenClipboardName;
        private String clipboardName;
        private byte[] clipboardNamePadding;
        private int maxFiles;
        private int eventQueueSize;
        private long heapOn128kMac;
        private long heapOn256kMac;
        private long heapOn512kMac;
        private byte[] bootCode;
        private AppleBackup _root;
        private AppleBackup _parent;
        public byte[] sigBytes() { return sigBytes; }
        public long branchCode() { return branchCode; }
        public int bootBlockFlags() { return bootBlockFlags; }
        public int bootBlockVersionNumber() { return bootBlockVersionNumber; }
        public int secondarySoundAndVideoPages() { return secondarySoundAndVideoPages; }
        public int lenSystemName() { return lenSystemName; }
        public String systemName() { return systemName; }
        public byte[] systemNamePadding() { return systemNamePadding; }
        public int lenFinderName() { return lenFinderName; }
        public String finderName() { return finderName; }
        public byte[] finderNamePadding() { return finderNamePadding; }
        public int lenDebuggerName() { return lenDebuggerName; }
        public String debuggerName() { return debuggerName; }
        public byte[] debuggerNamePadding() { return debuggerNamePadding; }
        public int lenDissassemblerName() { return lenDissassemblerName; }
        public String dissassemblerName() { return dissassemblerName; }
        public byte[] dissassemblerNamePadding() { return dissassemblerNamePadding; }
        public int lenStartUpScreenName() { return lenStartUpScreenName; }
        public String startUpScreenName() { return startUpScreenName; }
        public byte[] startUpScreenNamePadding() { return startUpScreenNamePadding; }
        public int lenBootUpName() { return lenBootUpName; }
        public String bootUpName() { return bootUpName; }
        public byte[] bootUpNamePadding() { return bootUpNamePadding; }
        public int lenClipboardName() { return lenClipboardName; }
        public String clipboardName() { return clipboardName; }
        public byte[] clipboardNamePadding() { return clipboardNamePadding; }
        public int maxFiles() { return maxFiles; }
        public int eventQueueSize() { return eventQueueSize; }
        public long heapOn128kMac() { return heapOn128kMac; }
        public long heapOn256kMac() { return heapOn256kMac; }
        public long heapOn512kMac() { return heapOn512kMac; }
        public byte[] bootCode() { return bootCode; }
        public AppleBackup _root() { return _root; }
        public AppleBackup _parent() { return _parent; }
    }
    public static class DinfoDataStruct extends KaitaiStruct {
        public static DinfoDataStruct fromFile(String fileName) throws IOException {
            return new DinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }

        public DinfoDataStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent) {
            this(_io, _parent, null);
        }

        public DinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.frRect = this._io.readBytes(8);
            this.frFlags = this._io.readU2be();
            this.frLocation = this._io.readU4be();
            this.frView = this._io.readU2be();
        }
        private byte[] frRect;
        private int frFlags;
        private long frLocation;
        private int frView;
        private AppleBackup _root;
        private AppleBackup.FileDataType _parent;
        public byte[] frRect() { return frRect; }
        public int frFlags() { return frFlags; }
        public long frLocation() { return frLocation; }
        public int frView() { return frView; }
        public AppleBackup _root() { return _root; }
        public AppleBackup.FileDataType _parent() { return _parent; }
    }
    public static class DxinfoDataStruct extends KaitaiStruct {
        public static DxinfoDataStruct fromFile(String fileName) throws IOException {
            return new DxinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }

        public DxinfoDataStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DxinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent) {
            this(_io, _parent, null);
        }

        public DxinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.frScroll = this._io.readU4be();
            this.frOpenChain = this._io.readU4be();
            this.frUnused = this._io.readBytes(2);
            this.frComment = this._io.readU2be();
            this.frPutAway = this._io.readU4be();
        }
        private long frScroll;
        private long frOpenChain;
        private byte[] frUnused;
        private int frComment;
        private long frPutAway;
        private AppleBackup _root;
        private AppleBackup.FileDataType _parent;
        public long frScroll() { return frScroll; }
        public long frOpenChain() { return frOpenChain; }
        public byte[] frUnused() { return frUnused; }
        public int frComment() { return frComment; }
        public long frPutAway() { return frPutAway; }
        public AppleBackup _root() { return _root; }
        public AppleBackup.FileDataType _parent() { return _parent; }
    }
    public static class FileDataSeq extends KaitaiStruct {
        public static FileDataSeq fromFile(String fileName) throws IOException {
            return new FileDataSeq(new ByteBufferKaitaiStream(fileName));
        }

        public FileDataSeq(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileDataSeq(KaitaiStream _io, AppleBackup _parent) {
            this(_io, _parent, null);
        }

        public FileDataSeq(KaitaiStream _io, AppleBackup _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileDataContents = new ArrayList<FileDataType>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.fileDataContents.add(new FileDataType(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<FileDataType> fileDataContents;
        private AppleBackup _root;
        private AppleBackup _parent;
        public ArrayList<FileDataType> fileDataContents() { return fileDataContents; }
        public AppleBackup _root() { return _root; }
        public AppleBackup _parent() { return _parent; }
    }
    public static class FinfoDataStruct extends KaitaiStruct {
        public static FinfoDataStruct fromFile(String fileName) throws IOException {
            return new FinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }

        public FinfoDataStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent) {
            this(_io, _parent, null);
        }

        public FinfoDataStruct(KaitaiStream _io, AppleBackup.FileDataType _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fdType = new String(this._io.readBytes(4), Charset.forName("ascii"));
            this.fdCreator = new String(this._io.readBytes(4), Charset.forName("ascii"));
            this.fdFlags07 = this._io.readU1();
            this.fdFlags8F = this._io.readU1();
            this.fdLocation = this._io.readU4be();
            this.fdFldr = this._io.readU2be();
        }
        private String fdType;
        private String fdCreator;
        private int fdFlags07;
        private int fdFlags8F;
        private long fdLocation;
        private int fdFldr;
        private AppleBackup _root;
        private AppleBackup.FileDataType _parent;
        public String fdType() { return fdType; }
        public String fdCreator() { return fdCreator; }
        public int fdFlags07() { return fdFlags07; }
        public int fdFlags8F() { return fdFlags8F; }
        public long fdLocation() { return fdLocation; }
        public int fdFldr() { return fdFldr; }
        public AppleBackup _root() { return _root; }
        public AppleBackup.FileDataType _parent() { return _parent; }
    }
    public static class BackupDiskHeaderType extends KaitaiStruct {
        public static BackupDiskHeaderType fromFile(String fileName) throws IOException {
            return new BackupDiskHeaderType(new ByteBufferKaitaiStream(fileName));
        }

        public BackupDiskHeaderType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BackupDiskHeaderType(KaitaiStream _io, AppleBackup _parent) {
            this(_io, _parent, null);
        }

        public BackupDiskHeaderType(KaitaiStream _io, AppleBackup _parent, AppleBackup _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2be();
            this.magic = this._io.ensureFixedContents(new byte[] { 67, 77, 87, 76 });
            this.diskNumber = this._io.readU2be();
            this.totalDisks = this._io.readU2be();
            this.backupStartTime = this._io.readU4be();
            this.backupStartTime2 = this._io.readU4be();
            this.hardDriveNameLen = this._io.readU1();
            this.hardDriveName = new String(this._io.readBytes(hardDriveNameLen()), Charset.forName("ascii"));
            this.hardDriveNamePadding = this._io.readBytes((31 - hardDriveNameLen()));
            this.totalFileSize = this._io.readU4be();
            this.totalSizeUsed = this._io.readU4be();
            this.bdhPadding = this._io.readBytes(454);
        }
        private int version;
        private byte[] magic;
        private int diskNumber;
        private int totalDisks;
        private long backupStartTime;
        private long backupStartTime2;
        private int hardDriveNameLen;
        private String hardDriveName;
        private byte[] hardDriveNamePadding;
        private long totalFileSize;
        private long totalSizeUsed;
        private byte[] bdhPadding;
        private AppleBackup _root;
        private AppleBackup _parent;

        /**
         * valid up to and including version 0x0104
         */
        public int version() { return version; }

        /**
         * identifies this file as an Apple Backup file
         */
        public byte[] magic() { return magic; }

        /**
         * value is between 1 and total_disks
         */
        public int diskNumber() { return diskNumber; }

        /**
         * total number of disks used for the backup
         */
        public int totalDisks() { return totalDisks; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        public long backupStartTime() { return backupStartTime; }

        /**
         * duplicate of backup_start_time
         */
        public long backupStartTime2() { return backupStartTime2; }

        /**
         * Length of the name of the hard drive that was backed up
         */
        public int hardDriveNameLen() { return hardDriveNameLen; }

        /**
         * Name of the hard drive that was backed up
         */
        public String hardDriveName() { return hardDriveName; }

        /**
         * Remainder of Pascal Str31 address space
         */
        public byte[] hardDriveNamePadding() { return hardDriveNamePadding; }

        /**
         * Total size of this restore file; typically 0x161800
         */
        public long totalFileSize() { return totalFileSize; }

        /**
         * Number of bytes actually used in this restore file; usually 0x161800 except for last file
         */
        public long totalSizeUsed() { return totalSizeUsed; }

        /**
         * 0x00 padding to end of header
         */
        public byte[] bdhPadding() { return bdhPadding; }
        public AppleBackup _root() { return _root; }
        public AppleBackup _parent() { return _parent; }
    }
    private BackupDiskHeaderType backupDiskHeader;
    private BootBlocksType bootBlocks;
    private FileDataSeq fileData;
    private AppleBackup _root;
    private KaitaiStruct _parent;
    private byte[] _raw_backupDiskHeader;
    private byte[] _raw_bootBlocks;
    private byte[] _raw_fileData;
    public BackupDiskHeaderType backupDiskHeader() { return backupDiskHeader; }
    public BootBlocksType bootBlocks() { return bootBlocks; }
    public FileDataSeq fileData() { return fileData; }
    public AppleBackup _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_backupDiskHeader() { return _raw_backupDiskHeader; }
    public byte[] _raw_bootBlocks() { return _raw_bootBlocks; }
    public byte[] _raw_fileData() { return _raw_fileData; }
}
