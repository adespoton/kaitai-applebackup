// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
    /// These computers did not come with install disks, but instead with software pre-installed
    /// on the hard disk, with an Apple Backup program that could be used to back the hard disk's
    /// contents up to 1440KB floppy disks in 1414KB files named &quot;Backup Disk #&quot; where # was 1 
    /// through the last disk needed for a full drive backup.
    /// These files had the Type/Creator codes of OBDa and OBBa.
    /// Later versions of the Performa line came with Restore CDs that contained &quot;Restore All Software&quot;
    /// and &quot;Restore System Software&quot; folders containing 1414KB files named &quot;Data File #&quot; -- where all
    /// the required files resided in the same folder on the CD.
    /// These files had the Type/Creatorcodes of OBDc and OBBa.
    /// Both file types are flat data files as indicated in the struct below.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/">Source</a>
    /// </remarks>
    public partial class AppleBackup : KaitaiStruct
    {
        public static AppleBackup FromFile(string fileName)
        {
            return new AppleBackup(new KaitaiStream(fileName));
        }

        public AppleBackup(KaitaiStream p__io, KaitaiStruct p__parent = null, AppleBackup p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            __raw_backupDiskHeader = m_io.ReadBytes(512);
            var io___raw_backupDiskHeader = new KaitaiStream(__raw_backupDiskHeader);
            _backupDiskHeader = new BackupDiskHeaderType(io___raw_backupDiskHeader, this, m_root);
            __raw_bootBlocks = m_io.ReadBytes(1024);
            var io___raw_bootBlocks = new KaitaiStream(__raw_bootBlocks);
            _bootBlocks = new BootBlocksType(io___raw_bootBlocks, this, m_root);
            __raw_fileData = m_io.ReadBytes((BackupDiskHeader.TotalSizeUsed - 1536));
            var io___raw_fileData = new KaitaiStream(__raw_fileData);
            _fileData = new FileDataSeq(io___raw_fileData, this, m_root);
        }
        public partial class FileDataType : KaitaiStruct
        {
            public static FileDataType FromFile(string fileName)
            {
                return new FileDataType(new KaitaiStream(fileName));
            }

            public FileDataType(KaitaiStream p__io, AppleBackup.FileDataSeq p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileVersion = m_io.ReadU2be();
                _fileMagic = m_io.EnsureFixedContents(new byte[] { 82, 76, 68, 87 });
                _fileStartsOnDisk = m_io.ReadU2be();
                _backupStartTime = m_io.ReadU4be();
                _headerOffset = m_io.ReadU4be();
                _fileNameLen = m_io.ReadU1();
                _fileName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(FileNameLen));
                _fileNamePadding = m_io.ReadBytes((31 - FileNameLen));
                _filePart = m_io.ReadU2be();
                _folderFlags = m_io.ReadU1();
                _validityFlag = m_io.ReadU1();
                if (FolderFlags == 0) {
                    __raw_finfoData = m_io.ReadBytes(16);
                    var io___raw_finfoData = new KaitaiStream(__raw_finfoData);
                    _finfoData = new FinfoDataStruct(io___raw_finfoData, this, m_root);
                }
                if (FolderFlags == 0) {
                    __raw_fxinfoData = m_io.ReadBytes(16);
                    var io___raw_fxinfoData = new KaitaiStream(__raw_fxinfoData);
                    _fxinfoData = new FxinfoDataStruct(io___raw_fxinfoData, this, m_root);
                }
                if (FolderFlags != 0) {
                    __raw_dinfoData = m_io.ReadBytes(16);
                    var io___raw_dinfoData = new KaitaiStream(__raw_dinfoData);
                    _dinfoData = new DinfoDataStruct(io___raw_dinfoData, this, m_root);
                }
                if (FolderFlags != 0) {
                    __raw_dxinfoData = m_io.ReadBytes(16);
                    var io___raw_dxinfoData = new KaitaiStream(__raw_dxinfoData);
                    _dxinfoData = new DxinfoDataStruct(io___raw_dxinfoData, this, m_root);
                }
                _fileAttributes = m_io.ReadU1();
                _fileReserved = m_io.ReadU1();
                _creationDate = m_io.ReadU4be();
                _modificationDate = m_io.ReadU4be();
                _dataForkLength = m_io.ReadU4be();
                _resourceForkLength = m_io.ReadU4be();
                _dataForkInFileLength = m_io.ReadU4be();
                _resourceForkInFileLength = m_io.ReadU4be();
                _fullFilePathLength = m_io.ReadU2be();
                _fullFilePath = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(FullFilePathLength));
                _dataFork = m_io.ReadBytes(DataForkInFileLength);
                _resourceFork = m_io.ReadBytes(ResourceForkInFileLength);
                if ( (((512 - KaitaiStream.Mod((((112 + DataForkInFileLength) + ResourceForkInFileLength) + FullFilePathLength), 512)) != 512) || ((M_Parent.M_Parent.BackupDiskHeader.DiskNumber - M_Parent.M_Parent.BackupDiskHeader.TotalDisks) == 0)) ) {
                    _filePadding = m_io.ReadBytes((512 - KaitaiStream.Mod((((112 + DataForkInFileLength) + ResourceForkInFileLength) + FullFilePathLength), 512)));
                }
            }
            private ushort _fileVersion;
            private byte[] _fileMagic;
            private ushort _fileStartsOnDisk;
            private uint _backupStartTime;
            private uint _headerOffset;
            private byte _fileNameLen;
            private string _fileName;
            private byte[] _fileNamePadding;
            private ushort _filePart;
            private byte _folderFlags;
            private byte _validityFlag;
            private FinfoDataStruct _finfoData;
            private FxinfoDataStruct _fxinfoData;
            private DinfoDataStruct _dinfoData;
            private DxinfoDataStruct _dxinfoData;
            private byte _fileAttributes;
            private byte _fileReserved;
            private uint _creationDate;
            private uint _modificationDate;
            private uint _dataForkLength;
            private uint _resourceForkLength;
            private uint _dataForkInFileLength;
            private uint _resourceForkInFileLength;
            private ushort _fullFilePathLength;
            private string _fullFilePath;
            private byte[] _dataFork;
            private byte[] _resourceFork;
            private byte[] _filePadding;
            private AppleBackup m_root;
            private AppleBackup.FileDataSeq m_parent;
            private byte[] __raw_finfoData;
            private byte[] __raw_fxinfoData;
            private byte[] __raw_dinfoData;
            private byte[] __raw_dxinfoData;
            public ushort FileVersion { get { return _fileVersion; } }
            public byte[] FileMagic { get { return _fileMagic; } }
            public ushort FileStartsOnDisk { get { return _fileStartsOnDisk; } }

            /// <summary>
            /// Seconds since January 1, 1904 00:00:00 local time
            /// </summary>
            public uint BackupStartTime { get { return _backupStartTime; } }
            public uint HeaderOffset { get { return _headerOffset; } }
            public byte FileNameLen { get { return _fileNameLen; } }
            public string FileName { get { return _fileName; } }
            public byte[] FileNamePadding { get { return _fileNamePadding; } }
            public ushort FilePart { get { return _filePart; } }
            public byte FolderFlags { get { return _folderFlags; } }
            public byte ValidityFlag { get { return _validityFlag; } }
            public FinfoDataStruct FinfoData { get { return _finfoData; } }
            public FxinfoDataStruct FxinfoData { get { return _fxinfoData; } }
            public DinfoDataStruct DinfoData { get { return _dinfoData; } }
            public DxinfoDataStruct DxinfoData { get { return _dxinfoData; } }

            /// <summary>
            /// HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
            /// </summary>
            public byte FileAttributes { get { return _fileAttributes; } }
            public byte FileReserved { get { return _fileReserved; } }

            /// <summary>
            /// Seconds since January 1, 1904 00:00:00 local time
            /// </summary>
            public uint CreationDate { get { return _creationDate; } }

            /// <summary>
            /// Seconds since January 1, 1904 00:00:00 local time
            /// </summary>
            public uint ModificationDate { get { return _modificationDate; } }
            public uint DataForkLength { get { return _dataForkLength; } }
            public uint ResourceForkLength { get { return _resourceForkLength; } }
            public uint DataForkInFileLength { get { return _dataForkInFileLength; } }
            public uint ResourceForkInFileLength { get { return _resourceForkInFileLength; } }
            public ushort FullFilePathLength { get { return _fullFilePathLength; } }
            public string FullFilePath { get { return _fullFilePath; } }
            public byte[] DataFork { get { return _dataFork; } }
            public byte[] ResourceFork { get { return _resourceFork; } }
            public byte[] FilePadding { get { return _filePadding; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup.FileDataSeq M_Parent { get { return m_parent; } }
            public byte[] M_RawFinfoData { get { return __raw_finfoData; } }
            public byte[] M_RawFxinfoData { get { return __raw_fxinfoData; } }
            public byte[] M_RawDinfoData { get { return __raw_dinfoData; } }
            public byte[] M_RawDxinfoData { get { return __raw_dxinfoData; } }
        }
        public partial class FxinfoDataStruct : KaitaiStruct
        {
            public static FxinfoDataStruct FromFile(string fileName)
            {
                return new FxinfoDataStruct(new KaitaiStream(fileName));
            }

            public FxinfoDataStruct(KaitaiStream p__io, AppleBackup.FileDataType p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fdIconId = m_io.ReadU2be();
                _fdUnused = m_io.ReadBytes(8);
                _fdComment = m_io.ReadU2be();
                _fdPutAway = m_io.ReadU4be();
            }
            private ushort _fdIconId;
            private byte[] _fdUnused;
            private ushort _fdComment;
            private uint _fdPutAway;
            private AppleBackup m_root;
            private AppleBackup.FileDataType m_parent;
            public ushort FdIconId { get { return _fdIconId; } }
            public byte[] FdUnused { get { return _fdUnused; } }
            public ushort FdComment { get { return _fdComment; } }
            public uint FdPutAway { get { return _fdPutAway; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup.FileDataType M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Standard SCSI boot blocks, begins with LK, shortly followed by
        /// System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
        /// Theyare written to the hard drive by the restore program when the 
        /// System Folder is blessed as it's restored.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="http://mcosre.sourceforge.net/docs/boot_blocks.html">Source</a>
        /// </remarks>
        public partial class BootBlocksType : KaitaiStruct
        {
            public static BootBlocksType FromFile(string fileName)
            {
                return new BootBlocksType(new KaitaiStream(fileName));
            }

            public BootBlocksType(KaitaiStream p__io, AppleBackup p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sigBytes = m_io.EnsureFixedContents(new byte[] { 76, 75 });
                _branchCode = m_io.ReadU4be();
                _bootBlockFlags = m_io.ReadU1();
                _bootBlockVersionNumber = m_io.ReadU1();
                _secondarySoundAndVideoPages = m_io.ReadU2be();
                _lenSystemName = m_io.ReadU1();
                _systemName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenSystemName));
                _systemNamePadding = m_io.ReadBytes((15 - LenSystemName));
                _lenFinderName = m_io.ReadU1();
                _finderName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenFinderName));
                _finderNamePadding = m_io.ReadBytes((15 - LenFinderName));
                _lenDebuggerName = m_io.ReadU1();
                _debuggerName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenDebuggerName));
                _debuggerNamePadding = m_io.ReadBytes((15 - LenDebuggerName));
                _lenDissassemblerName = m_io.ReadU1();
                _dissassemblerName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenDissassemblerName));
                _dissassemblerNamePadding = m_io.ReadBytes((15 - LenDissassemblerName));
                _lenStartUpScreenName = m_io.ReadU1();
                _startUpScreenName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenStartUpScreenName));
                _startUpScreenNamePadding = m_io.ReadBytes((15 - LenStartUpScreenName));
                _lenBootUpName = m_io.ReadU1();
                _bootUpName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenBootUpName));
                _bootUpNamePadding = m_io.ReadBytes((15 - LenBootUpName));
                _lenClipboardName = m_io.ReadU1();
                _clipboardName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(LenClipboardName));
                _clipboardNamePadding = m_io.ReadBytes((15 - LenClipboardName));
                _maxFiles = m_io.ReadU2be();
                _eventQueueSize = m_io.ReadU2be();
                _heapOn128kMac = m_io.ReadU4be();
                _heapOn256kMac = m_io.ReadU4be();
                _heapOn512kMac = m_io.ReadU4be();
                _bootCode = m_io.ReadBytes(886);
            }
            private byte[] _sigBytes;
            private uint _branchCode;
            private byte _bootBlockFlags;
            private byte _bootBlockVersionNumber;
            private ushort _secondarySoundAndVideoPages;
            private byte _lenSystemName;
            private string _systemName;
            private byte[] _systemNamePadding;
            private byte _lenFinderName;
            private string _finderName;
            private byte[] _finderNamePadding;
            private byte _lenDebuggerName;
            private string _debuggerName;
            private byte[] _debuggerNamePadding;
            private byte _lenDissassemblerName;
            private string _dissassemblerName;
            private byte[] _dissassemblerNamePadding;
            private byte _lenStartUpScreenName;
            private string _startUpScreenName;
            private byte[] _startUpScreenNamePadding;
            private byte _lenBootUpName;
            private string _bootUpName;
            private byte[] _bootUpNamePadding;
            private byte _lenClipboardName;
            private string _clipboardName;
            private byte[] _clipboardNamePadding;
            private ushort _maxFiles;
            private ushort _eventQueueSize;
            private uint _heapOn128kMac;
            private uint _heapOn256kMac;
            private uint _heapOn512kMac;
            private byte[] _bootCode;
            private AppleBackup m_root;
            private AppleBackup m_parent;
            public byte[] SigBytes { get { return _sigBytes; } }
            public uint BranchCode { get { return _branchCode; } }
            public byte BootBlockFlags { get { return _bootBlockFlags; } }
            public byte BootBlockVersionNumber { get { return _bootBlockVersionNumber; } }
            public ushort SecondarySoundAndVideoPages { get { return _secondarySoundAndVideoPages; } }
            public byte LenSystemName { get { return _lenSystemName; } }
            public string SystemName { get { return _systemName; } }
            public byte[] SystemNamePadding { get { return _systemNamePadding; } }
            public byte LenFinderName { get { return _lenFinderName; } }
            public string FinderName { get { return _finderName; } }
            public byte[] FinderNamePadding { get { return _finderNamePadding; } }
            public byte LenDebuggerName { get { return _lenDebuggerName; } }
            public string DebuggerName { get { return _debuggerName; } }
            public byte[] DebuggerNamePadding { get { return _debuggerNamePadding; } }
            public byte LenDissassemblerName { get { return _lenDissassemblerName; } }
            public string DissassemblerName { get { return _dissassemblerName; } }
            public byte[] DissassemblerNamePadding { get { return _dissassemblerNamePadding; } }
            public byte LenStartUpScreenName { get { return _lenStartUpScreenName; } }
            public string StartUpScreenName { get { return _startUpScreenName; } }
            public byte[] StartUpScreenNamePadding { get { return _startUpScreenNamePadding; } }
            public byte LenBootUpName { get { return _lenBootUpName; } }
            public string BootUpName { get { return _bootUpName; } }
            public byte[] BootUpNamePadding { get { return _bootUpNamePadding; } }
            public byte LenClipboardName { get { return _lenClipboardName; } }
            public string ClipboardName { get { return _clipboardName; } }
            public byte[] ClipboardNamePadding { get { return _clipboardNamePadding; } }
            public ushort MaxFiles { get { return _maxFiles; } }
            public ushort EventQueueSize { get { return _eventQueueSize; } }
            public uint HeapOn128kMac { get { return _heapOn128kMac; } }
            public uint HeapOn256kMac { get { return _heapOn256kMac; } }
            public uint HeapOn512kMac { get { return _heapOn512kMac; } }
            public byte[] BootCode { get { return _bootCode; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup M_Parent { get { return m_parent; } }
        }
        public partial class DinfoDataStruct : KaitaiStruct
        {
            public static DinfoDataStruct FromFile(string fileName)
            {
                return new DinfoDataStruct(new KaitaiStream(fileName));
            }

            public DinfoDataStruct(KaitaiStream p__io, AppleBackup.FileDataType p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frRect = m_io.ReadBytes(8);
                _frFlags = m_io.ReadU2be();
                _frLocation = m_io.ReadU4be();
                _frView = m_io.ReadU2be();
            }
            private byte[] _frRect;
            private ushort _frFlags;
            private uint _frLocation;
            private ushort _frView;
            private AppleBackup m_root;
            private AppleBackup.FileDataType m_parent;
            public byte[] FrRect { get { return _frRect; } }
            public ushort FrFlags { get { return _frFlags; } }
            public uint FrLocation { get { return _frLocation; } }
            public ushort FrView { get { return _frView; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup.FileDataType M_Parent { get { return m_parent; } }
        }
        public partial class DxinfoDataStruct : KaitaiStruct
        {
            public static DxinfoDataStruct FromFile(string fileName)
            {
                return new DxinfoDataStruct(new KaitaiStream(fileName));
            }

            public DxinfoDataStruct(KaitaiStream p__io, AppleBackup.FileDataType p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _frScroll = m_io.ReadU4be();
                _frOpenChain = m_io.ReadU4be();
                _frUnused = m_io.ReadBytes(2);
                _frComment = m_io.ReadU2be();
                _frPutAway = m_io.ReadU4be();
            }
            private uint _frScroll;
            private uint _frOpenChain;
            private byte[] _frUnused;
            private ushort _frComment;
            private uint _frPutAway;
            private AppleBackup m_root;
            private AppleBackup.FileDataType m_parent;
            public uint FrScroll { get { return _frScroll; } }
            public uint FrOpenChain { get { return _frOpenChain; } }
            public byte[] FrUnused { get { return _frUnused; } }
            public ushort FrComment { get { return _frComment; } }
            public uint FrPutAway { get { return _frPutAway; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup.FileDataType M_Parent { get { return m_parent; } }
        }
        public partial class FileDataSeq : KaitaiStruct
        {
            public static FileDataSeq FromFile(string fileName)
            {
                return new FileDataSeq(new KaitaiStream(fileName));
            }

            public FileDataSeq(KaitaiStream p__io, AppleBackup p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileDataContents = new List<FileDataType>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _fileDataContents.Add(new FileDataType(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<FileDataType> _fileDataContents;
            private AppleBackup m_root;
            private AppleBackup m_parent;
            public List<FileDataType> FileDataContents { get { return _fileDataContents; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup M_Parent { get { return m_parent; } }
        }
        public partial class FinfoDataStruct : KaitaiStruct
        {
            public static FinfoDataStruct FromFile(string fileName)
            {
                return new FinfoDataStruct(new KaitaiStream(fileName));
            }

            public FinfoDataStruct(KaitaiStream p__io, AppleBackup.FileDataType p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fdType = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(4));
                _fdCreator = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(4));
                _fdFlags07 = m_io.ReadU1();
                _fdFlags8F = m_io.ReadU1();
                _fdLocation = m_io.ReadU4be();
                _fdFldr = m_io.ReadU2be();
            }
            private string _fdType;
            private string _fdCreator;
            private byte _fdFlags07;
            private byte _fdFlags8F;
            private uint _fdLocation;
            private ushort _fdFldr;
            private AppleBackup m_root;
            private AppleBackup.FileDataType m_parent;
            public string FdType { get { return _fdType; } }
            public string FdCreator { get { return _fdCreator; } }
            public byte FdFlags07 { get { return _fdFlags07; } }
            public byte FdFlags8F { get { return _fdFlags8F; } }
            public uint FdLocation { get { return _fdLocation; } }
            public ushort FdFldr { get { return _fdFldr; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup.FileDataType M_Parent { get { return m_parent; } }
        }
        public partial class BackupDiskHeaderType : KaitaiStruct
        {
            public static BackupDiskHeaderType FromFile(string fileName)
            {
                return new BackupDiskHeaderType(new KaitaiStream(fileName));
            }

            public BackupDiskHeaderType(KaitaiStream p__io, AppleBackup p__parent = null, AppleBackup p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU2be();
                _magic = m_io.EnsureFixedContents(new byte[] { 67, 77, 87, 76 });
                _diskNumber = m_io.ReadU2be();
                _totalDisks = m_io.ReadU2be();
                _backupStartTime = m_io.ReadU4be();
                _backupStartTime2 = m_io.ReadU4be();
                _hardDriveNameLen = m_io.ReadU1();
                _hardDriveName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(HardDriveNameLen));
                _hardDriveNamePadding = m_io.ReadBytes((31 - HardDriveNameLen));
                _totalFileSize = m_io.ReadU4be();
                _totalSizeUsed = m_io.ReadU4be();
                _bdhPadding = m_io.ReadBytes(454);
            }
            private ushort _version;
            private byte[] _magic;
            private ushort _diskNumber;
            private ushort _totalDisks;
            private uint _backupStartTime;
            private uint _backupStartTime2;
            private byte _hardDriveNameLen;
            private string _hardDriveName;
            private byte[] _hardDriveNamePadding;
            private uint _totalFileSize;
            private uint _totalSizeUsed;
            private byte[] _bdhPadding;
            private AppleBackup m_root;
            private AppleBackup m_parent;

            /// <summary>
            /// valid up to and including version 0x0104
            /// </summary>
            public ushort Version { get { return _version; } }

            /// <summary>
            /// identifies this file as an Apple Backup file
            /// </summary>
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// value is between 1 and total_disks
            /// </summary>
            public ushort DiskNumber { get { return _diskNumber; } }

            /// <summary>
            /// total number of disks used for the backup
            /// </summary>
            public ushort TotalDisks { get { return _totalDisks; } }

            /// <summary>
            /// Seconds since January 1, 1904 00:00:00 local time
            /// </summary>
            public uint BackupStartTime { get { return _backupStartTime; } }

            /// <summary>
            /// duplicate of backup_start_time
            /// </summary>
            public uint BackupStartTime2 { get { return _backupStartTime2; } }

            /// <summary>
            /// Length of the name of the hard drive that was backed up
            /// </summary>
            public byte HardDriveNameLen { get { return _hardDriveNameLen; } }

            /// <summary>
            /// Name of the hard drive that was backed up
            /// </summary>
            public string HardDriveName { get { return _hardDriveName; } }

            /// <summary>
            /// Remainder of Pascal Str31 address space
            /// </summary>
            public byte[] HardDriveNamePadding { get { return _hardDriveNamePadding; } }

            /// <summary>
            /// Total size of this restore file; typically 0x161800
            /// </summary>
            public uint TotalFileSize { get { return _totalFileSize; } }

            /// <summary>
            /// Number of bytes actually used in this restore file; usually 0x161800 except for last file
            /// </summary>
            public uint TotalSizeUsed { get { return _totalSizeUsed; } }

            /// <summary>
            /// 0x00 padding to end of header
            /// </summary>
            public byte[] BdhPadding { get { return _bdhPadding; } }
            public AppleBackup M_Root { get { return m_root; } }
            public AppleBackup M_Parent { get { return m_parent; } }
        }
        private BackupDiskHeaderType _backupDiskHeader;
        private BootBlocksType _bootBlocks;
        private FileDataSeq _fileData;
        private AppleBackup m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_backupDiskHeader;
        private byte[] __raw_bootBlocks;
        private byte[] __raw_fileData;
        public BackupDiskHeaderType BackupDiskHeader { get { return _backupDiskHeader; } }
        public BootBlocksType BootBlocks { get { return _bootBlocks; } }
        public FileDataSeq FileData { get { return _fileData; } }
        public AppleBackup M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawBackupDiskHeader { get { return __raw_backupDiskHeader; } }
        public byte[] M_RawBootBlocks { get { return __raw_bootBlocks; } }
        public byte[] M_RawFileData { get { return __raw_fileData; } }
    }
}
