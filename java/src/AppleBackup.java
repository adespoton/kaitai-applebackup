// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.nio.charset.Charset;


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
    public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
    public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
    public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
    public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

    public static AppleBackup fromFile(String fileName) throws IOException {
        return new AppleBackup(new ByteBufferKaitaiStream(fileName));
    }
    public static String[] _seqFields = new String[] { "backupDiskHeader", "bootBlocks", "fileData" };

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
    }
    public void _read() {
        _attrStart.put("backupDiskHeader", this._io.pos());
        this._raw_backupDiskHeader = this._io.readBytes(512);
        KaitaiStream _io__raw_backupDiskHeader = new ByteBufferKaitaiStream(_raw_backupDiskHeader);
        this.backupDiskHeader = new BackupDiskHeaderType(_io__raw_backupDiskHeader, this, _root);
        this.backupDiskHeader._read();
        _attrEnd.put("backupDiskHeader", this._io.pos());
        _attrStart.put("bootBlocks", this._io.pos());
        this._raw_bootBlocks = this._io.readBytes(1024);
        KaitaiStream _io__raw_bootBlocks = new ByteBufferKaitaiStream(_raw_bootBlocks);
        this.bootBlocks = new BootBlocksType(_io__raw_bootBlocks, this, _root);
        this.bootBlocks._read();
        _attrEnd.put("bootBlocks", this._io.pos());
        _attrStart.put("fileData", this._io.pos());
        this._raw_fileData = this._io.readBytes((backupDiskHeader().totalSizeUsed() - 1536));
        KaitaiStream _io__raw_fileData = new ByteBufferKaitaiStream(_raw_fileData);
        this.fileData = new FileDataSeq(_io__raw_fileData, this, _root);
        this.fileData._read();
        _attrEnd.put("fileData", this._io.pos());
    }
    public static class FileDataType extends KaitaiStruct {
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static FileDataType fromFile(String fileName) throws IOException {
            return new FileDataType(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "fileVersion", "fileMagic", "fileStartsOnDisk", "backupStartTime", "headerOffset", "fileNameLen", "fileName", "fileNamePadding", "filePart", "folderFlags", "validityFlag", "finfoData", "fxinfoData", "dinfoData", "dxinfoData", "fileAttributes", "fileReserved", "creationDate", "modificationDate", "dataForkLength", "resourceForkLength", "dataForkInFileLength", "resourceForkInFileLength", "fullFilePathLength", "fullFilePath", "dataFork", "resourceFork", "filePadding" };

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
        }
        public void _read() {
            _attrStart.put("fileVersion", this._io.pos());
            this.fileVersion = this._io.readU2be();
            _attrEnd.put("fileVersion", this._io.pos());
            _attrStart.put("fileMagic", this._io.pos());
            this.fileMagic = this._io.ensureFixedContents(new byte[] { 82, 76, 68, 87 });
            _attrEnd.put("fileMagic", this._io.pos());
            _attrStart.put("fileStartsOnDisk", this._io.pos());
            this.fileStartsOnDisk = this._io.readU2be();
            _attrEnd.put("fileStartsOnDisk", this._io.pos());
            _attrStart.put("backupStartTime", this._io.pos());
            this.backupStartTime = this._io.readU4be();
            _attrEnd.put("backupStartTime", this._io.pos());
            _attrStart.put("headerOffset", this._io.pos());
            this.headerOffset = this._io.readU4be();
            _attrEnd.put("headerOffset", this._io.pos());
            _attrStart.put("fileNameLen", this._io.pos());
            this.fileNameLen = this._io.readU1();
            _attrEnd.put("fileNameLen", this._io.pos());
            _attrStart.put("fileName", this._io.pos());
            this.fileName = new String(this._io.readBytes(fileNameLen()), Charset.forName("ascii"));
            _attrEnd.put("fileName", this._io.pos());
            _attrStart.put("fileNamePadding", this._io.pos());
            this.fileNamePadding = this._io.readBytes((31 - fileNameLen()));
            _attrEnd.put("fileNamePadding", this._io.pos());
            _attrStart.put("filePart", this._io.pos());
            this.filePart = this._io.readU2be();
            _attrEnd.put("filePart", this._io.pos());
            _attrStart.put("folderFlags", this._io.pos());
            this.folderFlags = this._io.readU1();
            _attrEnd.put("folderFlags", this._io.pos());
            _attrStart.put("validityFlag", this._io.pos());
            this.validityFlag = this._io.readU1();
            _attrEnd.put("validityFlag", this._io.pos());
            if (folderFlags() == 0) {
                _attrStart.put("finfoData", this._io.pos());
                this._raw_finfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_finfoData = new ByteBufferKaitaiStream(_raw_finfoData);
                this.finfoData = new FinfoDataStruct(_io__raw_finfoData, this, _root);
                this.finfoData._read();
                _attrEnd.put("finfoData", this._io.pos());
            }
            if (folderFlags() == 0) {
                _attrStart.put("fxinfoData", this._io.pos());
                this._raw_fxinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_fxinfoData = new ByteBufferKaitaiStream(_raw_fxinfoData);
                this.fxinfoData = new FxinfoDataStruct(_io__raw_fxinfoData, this, _root);
                this.fxinfoData._read();
                _attrEnd.put("fxinfoData", this._io.pos());
            }
            if (folderFlags() != 0) {
                _attrStart.put("dinfoData", this._io.pos());
                this._raw_dinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_dinfoData = new ByteBufferKaitaiStream(_raw_dinfoData);
                this.dinfoData = new DinfoDataStruct(_io__raw_dinfoData, this, _root);
                this.dinfoData._read();
                _attrEnd.put("dinfoData", this._io.pos());
            }
            if (folderFlags() != 0) {
                _attrStart.put("dxinfoData", this._io.pos());
                this._raw_dxinfoData = this._io.readBytes(16);
                KaitaiStream _io__raw_dxinfoData = new ByteBufferKaitaiStream(_raw_dxinfoData);
                this.dxinfoData = new DxinfoDataStruct(_io__raw_dxinfoData, this, _root);
                this.dxinfoData._read();
                _attrEnd.put("dxinfoData", this._io.pos());
            }
            _attrStart.put("fileAttributes", this._io.pos());
            this.fileAttributes = this._io.readU1();
            _attrEnd.put("fileAttributes", this._io.pos());
            _attrStart.put("fileReserved", this._io.pos());
            this.fileReserved = this._io.readU1();
            _attrEnd.put("fileReserved", this._io.pos());
            _attrStart.put("creationDate", this._io.pos());
            this.creationDate = this._io.readU4be();
            _attrEnd.put("creationDate", this._io.pos());
            _attrStart.put("modificationDate", this._io.pos());
            this.modificationDate = this._io.readU4be();
            _attrEnd.put("modificationDate", this._io.pos());
            _attrStart.put("dataForkLength", this._io.pos());
            this.dataForkLength = this._io.readU4be();
            _attrEnd.put("dataForkLength", this._io.pos());
            _attrStart.put("resourceForkLength", this._io.pos());
            this.resourceForkLength = this._io.readU4be();
            _attrEnd.put("resourceForkLength", this._io.pos());
            _attrStart.put("dataForkInFileLength", this._io.pos());
            this.dataForkInFileLength = this._io.readU4be();
            _attrEnd.put("dataForkInFileLength", this._io.pos());
            _attrStart.put("resourceForkInFileLength", this._io.pos());
            this.resourceForkInFileLength = this._io.readU4be();
            _attrEnd.put("resourceForkInFileLength", this._io.pos());
            _attrStart.put("fullFilePathLength", this._io.pos());
            this.fullFilePathLength = this._io.readU2be();
            _attrEnd.put("fullFilePathLength", this._io.pos());
            _attrStart.put("fullFilePath", this._io.pos());
            this.fullFilePath = new String(this._io.readBytes(fullFilePathLength()), Charset.forName("ascii"));
            _attrEnd.put("fullFilePath", this._io.pos());
            _attrStart.put("dataFork", this._io.pos());
            this.dataFork = this._io.readBytes(dataForkInFileLength());
            _attrEnd.put("dataFork", this._io.pos());
            _attrStart.put("resourceFork", this._io.pos());
            this.resourceFork = this._io.readBytes(resourceForkInFileLength());
            _attrEnd.put("resourceFork", this._io.pos());
            if ( (((512 - KaitaiStream.mod((((112 + dataForkInFileLength()) + resourceForkInFileLength()) + fullFilePathLength()), 512)) != 512) || ((_parent()._parent().backupDiskHeader().diskNumber() - _parent()._parent().backupDiskHeader().totalDisks()) == 0)) ) {
                _attrStart.put("filePadding", this._io.pos());
                this.filePadding = this._io.readBytes((512 - KaitaiStream.mod((((112 + dataForkInFileLength()) + resourceForkInFileLength()) + fullFilePathLength()), 512)));
                _attrEnd.put("filePadding", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static FxinfoDataStruct fromFile(String fileName) throws IOException {
            return new FxinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "fdIconId", "fdUnused", "fdComment", "fdPutAway" };

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
        }
        public void _read() {
            _attrStart.put("fdIconId", this._io.pos());
            this.fdIconId = this._io.readU2be();
            _attrEnd.put("fdIconId", this._io.pos());
            _attrStart.put("fdUnused", this._io.pos());
            this.fdUnused = this._io.readBytes(8);
            _attrEnd.put("fdUnused", this._io.pos());
            _attrStart.put("fdComment", this._io.pos());
            this.fdComment = this._io.readU2be();
            _attrEnd.put("fdComment", this._io.pos());
            _attrStart.put("fdPutAway", this._io.pos());
            this.fdPutAway = this._io.readU4be();
            _attrEnd.put("fdPutAway", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static BootBlocksType fromFile(String fileName) throws IOException {
            return new BootBlocksType(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "sigBytes", "branchCode", "bootBlockFlags", "bootBlockVersionNumber", "secondarySoundAndVideoPages", "lenSystemName", "systemName", "systemNamePadding", "lenFinderName", "finderName", "finderNamePadding", "lenDebuggerName", "debuggerName", "debuggerNamePadding", "lenDissassemblerName", "dissassemblerName", "dissassemblerNamePadding", "lenStartUpScreenName", "startUpScreenName", "startUpScreenNamePadding", "lenBootUpName", "bootUpName", "bootUpNamePadding", "lenClipboardName", "clipboardName", "clipboardNamePadding", "maxFiles", "eventQueueSize", "heapOn128kMac", "heapOn256kMac", "heapOn512kMac", "bootCode" };

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
        }
        public void _read() {
            _attrStart.put("sigBytes", this._io.pos());
            this.sigBytes = this._io.ensureFixedContents(new byte[] { 76, 75 });
            _attrEnd.put("sigBytes", this._io.pos());
            _attrStart.put("branchCode", this._io.pos());
            this.branchCode = this._io.readU4be();
            _attrEnd.put("branchCode", this._io.pos());
            _attrStart.put("bootBlockFlags", this._io.pos());
            this.bootBlockFlags = this._io.readU1();
            _attrEnd.put("bootBlockFlags", this._io.pos());
            _attrStart.put("bootBlockVersionNumber", this._io.pos());
            this.bootBlockVersionNumber = this._io.readU1();
            _attrEnd.put("bootBlockVersionNumber", this._io.pos());
            _attrStart.put("secondarySoundAndVideoPages", this._io.pos());
            this.secondarySoundAndVideoPages = this._io.readU2be();
            _attrEnd.put("secondarySoundAndVideoPages", this._io.pos());
            _attrStart.put("lenSystemName", this._io.pos());
            this.lenSystemName = this._io.readU1();
            _attrEnd.put("lenSystemName", this._io.pos());
            _attrStart.put("systemName", this._io.pos());
            this.systemName = new String(this._io.readBytes(lenSystemName()), Charset.forName("ascii"));
            _attrEnd.put("systemName", this._io.pos());
            _attrStart.put("systemNamePadding", this._io.pos());
            this.systemNamePadding = this._io.readBytes((15 - lenSystemName()));
            _attrEnd.put("systemNamePadding", this._io.pos());
            _attrStart.put("lenFinderName", this._io.pos());
            this.lenFinderName = this._io.readU1();
            _attrEnd.put("lenFinderName", this._io.pos());
            _attrStart.put("finderName", this._io.pos());
            this.finderName = new String(this._io.readBytes(lenFinderName()), Charset.forName("ascii"));
            _attrEnd.put("finderName", this._io.pos());
            _attrStart.put("finderNamePadding", this._io.pos());
            this.finderNamePadding = this._io.readBytes((15 - lenFinderName()));
            _attrEnd.put("finderNamePadding", this._io.pos());
            _attrStart.put("lenDebuggerName", this._io.pos());
            this.lenDebuggerName = this._io.readU1();
            _attrEnd.put("lenDebuggerName", this._io.pos());
            _attrStart.put("debuggerName", this._io.pos());
            this.debuggerName = new String(this._io.readBytes(lenDebuggerName()), Charset.forName("ascii"));
            _attrEnd.put("debuggerName", this._io.pos());
            _attrStart.put("debuggerNamePadding", this._io.pos());
            this.debuggerNamePadding = this._io.readBytes((15 - lenDebuggerName()));
            _attrEnd.put("debuggerNamePadding", this._io.pos());
            _attrStart.put("lenDissassemblerName", this._io.pos());
            this.lenDissassemblerName = this._io.readU1();
            _attrEnd.put("lenDissassemblerName", this._io.pos());
            _attrStart.put("dissassemblerName", this._io.pos());
            this.dissassemblerName = new String(this._io.readBytes(lenDissassemblerName()), Charset.forName("ascii"));
            _attrEnd.put("dissassemblerName", this._io.pos());
            _attrStart.put("dissassemblerNamePadding", this._io.pos());
            this.dissassemblerNamePadding = this._io.readBytes((15 - lenDissassemblerName()));
            _attrEnd.put("dissassemblerNamePadding", this._io.pos());
            _attrStart.put("lenStartUpScreenName", this._io.pos());
            this.lenStartUpScreenName = this._io.readU1();
            _attrEnd.put("lenStartUpScreenName", this._io.pos());
            _attrStart.put("startUpScreenName", this._io.pos());
            this.startUpScreenName = new String(this._io.readBytes(lenStartUpScreenName()), Charset.forName("ascii"));
            _attrEnd.put("startUpScreenName", this._io.pos());
            _attrStart.put("startUpScreenNamePadding", this._io.pos());
            this.startUpScreenNamePadding = this._io.readBytes((15 - lenStartUpScreenName()));
            _attrEnd.put("startUpScreenNamePadding", this._io.pos());
            _attrStart.put("lenBootUpName", this._io.pos());
            this.lenBootUpName = this._io.readU1();
            _attrEnd.put("lenBootUpName", this._io.pos());
            _attrStart.put("bootUpName", this._io.pos());
            this.bootUpName = new String(this._io.readBytes(lenBootUpName()), Charset.forName("ascii"));
            _attrEnd.put("bootUpName", this._io.pos());
            _attrStart.put("bootUpNamePadding", this._io.pos());
            this.bootUpNamePadding = this._io.readBytes((15 - lenBootUpName()));
            _attrEnd.put("bootUpNamePadding", this._io.pos());
            _attrStart.put("lenClipboardName", this._io.pos());
            this.lenClipboardName = this._io.readU1();
            _attrEnd.put("lenClipboardName", this._io.pos());
            _attrStart.put("clipboardName", this._io.pos());
            this.clipboardName = new String(this._io.readBytes(lenClipboardName()), Charset.forName("ascii"));
            _attrEnd.put("clipboardName", this._io.pos());
            _attrStart.put("clipboardNamePadding", this._io.pos());
            this.clipboardNamePadding = this._io.readBytes((15 - lenClipboardName()));
            _attrEnd.put("clipboardNamePadding", this._io.pos());
            _attrStart.put("maxFiles", this._io.pos());
            this.maxFiles = this._io.readU2be();
            _attrEnd.put("maxFiles", this._io.pos());
            _attrStart.put("eventQueueSize", this._io.pos());
            this.eventQueueSize = this._io.readU2be();
            _attrEnd.put("eventQueueSize", this._io.pos());
            _attrStart.put("heapOn128kMac", this._io.pos());
            this.heapOn128kMac = this._io.readU4be();
            _attrEnd.put("heapOn128kMac", this._io.pos());
            _attrStart.put("heapOn256kMac", this._io.pos());
            this.heapOn256kMac = this._io.readU4be();
            _attrEnd.put("heapOn256kMac", this._io.pos());
            _attrStart.put("heapOn512kMac", this._io.pos());
            this.heapOn512kMac = this._io.readU4be();
            _attrEnd.put("heapOn512kMac", this._io.pos());
            _attrStart.put("bootCode", this._io.pos());
            this.bootCode = this._io.readBytes(886);
            _attrEnd.put("bootCode", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static DinfoDataStruct fromFile(String fileName) throws IOException {
            return new DinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "frRect", "frFlags", "frLocation", "frView" };

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
        }
        public void _read() {
            _attrStart.put("frRect", this._io.pos());
            this.frRect = this._io.readBytes(8);
            _attrEnd.put("frRect", this._io.pos());
            _attrStart.put("frFlags", this._io.pos());
            this.frFlags = this._io.readU2be();
            _attrEnd.put("frFlags", this._io.pos());
            _attrStart.put("frLocation", this._io.pos());
            this.frLocation = this._io.readU4be();
            _attrEnd.put("frLocation", this._io.pos());
            _attrStart.put("frView", this._io.pos());
            this.frView = this._io.readU2be();
            _attrEnd.put("frView", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static DxinfoDataStruct fromFile(String fileName) throws IOException {
            return new DxinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "frScroll", "frOpenChain", "frUnused", "frComment", "frPutAway" };

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
        }
        public void _read() {
            _attrStart.put("frScroll", this._io.pos());
            this.frScroll = this._io.readU4be();
            _attrEnd.put("frScroll", this._io.pos());
            _attrStart.put("frOpenChain", this._io.pos());
            this.frOpenChain = this._io.readU4be();
            _attrEnd.put("frOpenChain", this._io.pos());
            _attrStart.put("frUnused", this._io.pos());
            this.frUnused = this._io.readBytes(2);
            _attrEnd.put("frUnused", this._io.pos());
            _attrStart.put("frComment", this._io.pos());
            this.frComment = this._io.readU2be();
            _attrEnd.put("frComment", this._io.pos());
            _attrStart.put("frPutAway", this._io.pos());
            this.frPutAway = this._io.readU4be();
            _attrEnd.put("frPutAway", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static FileDataSeq fromFile(String fileName) throws IOException {
            return new FileDataSeq(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "fileDataContents" };

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
        }
        public void _read() {
            _attrStart.put("fileDataContents", this._io.pos());
            this.fileDataContents = new ArrayList<FileDataType>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    {
                        ArrayList<Integer> _posList = _arrStart.get("fileDataContents");
                        if (_posList == null) {
                            _posList = new ArrayList<Integer>();
                            _arrStart.put("fileDataContents", _posList);
                        }
                        _posList.add(this._io.pos());
                    }
                    FileDataType _t_fileDataContents = new FileDataType(this._io, this, _root);
                    _t_fileDataContents._read();
                    this.fileDataContents.add(_t_fileDataContents);
                    {
                        ArrayList<Integer> _posList = _arrEnd.get("fileDataContents");
                        if (_posList == null) {
                            _posList = new ArrayList<Integer>();
                            _arrEnd.put("fileDataContents", _posList);
                        }
                        _posList.add(this._io.pos());
                    }
                    i++;
                }
            }
            _attrEnd.put("fileDataContents", this._io.pos());
        }
        private ArrayList<FileDataType> fileDataContents;
        private AppleBackup _root;
        private AppleBackup _parent;
        public ArrayList<FileDataType> fileDataContents() { return fileDataContents; }
        public AppleBackup _root() { return _root; }
        public AppleBackup _parent() { return _parent; }
    }
    public static class FinfoDataStruct extends KaitaiStruct {
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static FinfoDataStruct fromFile(String fileName) throws IOException {
            return new FinfoDataStruct(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "fdType", "fdCreator", "fdFlags07", "fdFlags8F", "fdLocation", "fdFldr" };

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
        }
        public void _read() {
            _attrStart.put("fdType", this._io.pos());
            this.fdType = new String(this._io.readBytes(4), Charset.forName("ascii"));
            _attrEnd.put("fdType", this._io.pos());
            _attrStart.put("fdCreator", this._io.pos());
            this.fdCreator = new String(this._io.readBytes(4), Charset.forName("ascii"));
            _attrEnd.put("fdCreator", this._io.pos());
            _attrStart.put("fdFlags07", this._io.pos());
            this.fdFlags07 = this._io.readU1();
            _attrEnd.put("fdFlags07", this._io.pos());
            _attrStart.put("fdFlags8F", this._io.pos());
            this.fdFlags8F = this._io.readU1();
            _attrEnd.put("fdFlags8F", this._io.pos());
            _attrStart.put("fdLocation", this._io.pos());
            this.fdLocation = this._io.readU4be();
            _attrEnd.put("fdLocation", this._io.pos());
            _attrStart.put("fdFldr", this._io.pos());
            this.fdFldr = this._io.readU2be();
            _attrEnd.put("fdFldr", this._io.pos());
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
        public Map<String, Integer> _attrStart = new HashMap<String, Integer>();
        public Map<String, Integer> _attrEnd = new HashMap<String, Integer>();
        public Map<String, ArrayList<Integer>> _arrStart = new HashMap<String, ArrayList<Integer>>();
        public Map<String, ArrayList<Integer>> _arrEnd = new HashMap<String, ArrayList<Integer>>();

        public static BackupDiskHeaderType fromFile(String fileName) throws IOException {
            return new BackupDiskHeaderType(new ByteBufferKaitaiStream(fileName));
        }
        public static String[] _seqFields = new String[] { "version", "magic", "diskNumber", "totalDisks", "backupStartTime", "backupStartTime2", "hardDriveNameLen", "hardDriveName", "hardDriveNamePadding", "totalFileSize", "totalSizeUsed", "bdhPadding" };

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
        }
        public void _read() {
            _attrStart.put("version", this._io.pos());
            this.version = this._io.readU2be();
            _attrEnd.put("version", this._io.pos());
            _attrStart.put("magic", this._io.pos());
            this.magic = this._io.ensureFixedContents(new byte[] { 67, 77, 87, 76 });
            _attrEnd.put("magic", this._io.pos());
            _attrStart.put("diskNumber", this._io.pos());
            this.diskNumber = this._io.readU2be();
            _attrEnd.put("diskNumber", this._io.pos());
            _attrStart.put("totalDisks", this._io.pos());
            this.totalDisks = this._io.readU2be();
            _attrEnd.put("totalDisks", this._io.pos());
            _attrStart.put("backupStartTime", this._io.pos());
            this.backupStartTime = this._io.readU4be();
            _attrEnd.put("backupStartTime", this._io.pos());
            _attrStart.put("backupStartTime2", this._io.pos());
            this.backupStartTime2 = this._io.readU4be();
            _attrEnd.put("backupStartTime2", this._io.pos());
            _attrStart.put("hardDriveNameLen", this._io.pos());
            this.hardDriveNameLen = this._io.readU1();
            _attrEnd.put("hardDriveNameLen", this._io.pos());
            _attrStart.put("hardDriveName", this._io.pos());
            this.hardDriveName = new String(this._io.readBytes(hardDriveNameLen()), Charset.forName("ascii"));
            _attrEnd.put("hardDriveName", this._io.pos());
            _attrStart.put("hardDriveNamePadding", this._io.pos());
            this.hardDriveNamePadding = this._io.readBytes((31 - hardDriveNameLen()));
            _attrEnd.put("hardDriveNamePadding", this._io.pos());
            _attrStart.put("totalFileSize", this._io.pos());
            this.totalFileSize = this._io.readU4be();
            _attrEnd.put("totalFileSize", this._io.pos());
            _attrStart.put("totalSizeUsed", this._io.pos());
            this.totalSizeUsed = this._io.readU4be();
            _attrEnd.put("totalSizeUsed", this._io.pos());
            _attrStart.put("bdhPadding", this._io.pos());
            this.bdhPadding = this._io.readBytes(454);
            _attrEnd.put("bdhPadding", this._io.pos());
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
