// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// The binary format consists of a 128-byte header containing all the information necessary 
    /// to reproduce the document's directory entry on the receiving Macintosh; 
    /// followed by the document's Data Fork (if it has one), padded with nulls to 
    /// a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
    /// (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
    /// are contained in the header.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html">Source</a>
    /// </remarks>
    public partial class Macbinary : KaitaiStruct
    {
        public static Macbinary FromFile(string fileName)
        {
            return new Macbinary(new KaitaiStream(fileName));
        }

        public Macbinary(KaitaiStream p__io, KaitaiStruct p__parent = null, Macbinary p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _oldSectionHeader = m_io.EnsureFixedContents(new byte[] { 0 });
            _filenameLength = m_io.ReadU1();
            _filename = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(FilenameLength));
            _filenamePadding = m_io.ReadBytes((63 - FilenameLength));
            _fileType = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(4));
            _fileCreator = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(4));
            _finderFlags8F = m_io.ReadBytes(1);
            _zeroFill = m_io.EnsureFixedContents(new byte[] { 0 });
            _winYPos = m_io.ReadU2be();
            _winXPos = m_io.ReadU2be();
            _winId = m_io.ReadU2be();
            _protectedFlag = m_io.ReadU1();
            _zeroFill2 = m_io.EnsureFixedContents(new byte[] { 0 });
            _dataForkLength = m_io.ReadU4be();
            _resourceForkLength = m_io.ReadU4be();
            _creationDate = m_io.ReadU4be();
            _modificationDate = m_io.ReadU4be();
            _getInfoLength = m_io.ReadU2be();
            _finderFlags07 = m_io.ReadU1();
            _signature = m_io.ReadU4be();
            _fdScript = m_io.ReadU1();
            _fdXFlags = m_io.ReadU1();
            _padding = m_io.ReadBytes(8);
            _totalUnpackedFilesLength = m_io.ReadU4be();
            _secondHeaderLength = m_io.ReadU2be();
            if (SecondHeaderLength != 0) {
                _secondHeader = m_io.ReadBytes(SecondHeaderLength);
            }
            if (SecondHeaderLength != 0) {
                _secondHeaderPadding = m_io.ReadBytes((128 - KaitaiStream.Mod(SecondHeaderLength, 128)));
            }
            _macbinaryVersion = m_io.ReadU1();
            _minMacbinaryVersionNeeded = m_io.ReadU1();
            _crcCheck = m_io.ReadU4be();
            if (DataForkLength != 0) {
                _dataFork = m_io.ReadBytes(DataForkLength);
            }
            if (KaitaiStream.Mod(DataForkLength, 128) != 0) {
                _dataForkPadding = m_io.ReadBytes((128 - KaitaiStream.Mod(DataForkLength, 128)));
            }
            _resourceFork = m_io.ReadBytes(ResourceForkLength);
            _resourceForkPadding = m_io.ReadBytes((128 - KaitaiStream.Mod(ResourceForkLength, 128)));
        }
        private byte[] _oldSectionHeader;
        private byte _filenameLength;
        private string _filename;
        private byte[] _filenamePadding;
        private string _fileType;
        private string _fileCreator;
        private byte[] _finderFlags8F;
        private byte[] _zeroFill;
        private ushort _winYPos;
        private ushort _winXPos;
        private ushort _winId;
        private byte _protectedFlag;
        private byte[] _zeroFill2;
        private uint _dataForkLength;
        private uint _resourceForkLength;
        private uint _creationDate;
        private uint _modificationDate;
        private ushort _getInfoLength;
        private byte _finderFlags07;
        private uint _signature;
        private byte _fdScript;
        private byte _fdXFlags;
        private byte[] _padding;
        private uint _totalUnpackedFilesLength;
        private ushort _secondHeaderLength;
        private byte[] _secondHeader;
        private byte[] _secondHeaderPadding;
        private byte _macbinaryVersion;
        private byte _minMacbinaryVersionNeeded;
        private uint _crcCheck;
        private byte[] _dataFork;
        private byte[] _dataForkPadding;
        private byte[] _resourceFork;
        private byte[] _resourceForkPadding;
        private Macbinary m_root;
        private KaitaiStruct m_parent;
        public byte[] OldSectionHeader { get { return _oldSectionHeader; } }
        public byte FilenameLength { get { return _filenameLength; } }
        public string Filename { get { return _filename; } }
        public byte[] FilenamePadding { get { return _filenamePadding; } }
        public string FileType { get { return _fileType; } }
        public string FileCreator { get { return _fileCreator; } }

        /// <summary>
        /// Bit 7 - isAlias. 
        /// Bit 6 - isInvisible. 
        /// Bit 5 - hasBundle. 
        /// Bit 4 - nameLocked. 
        /// Bit 3 - isStationery. 
        /// Bit 2 - hasCustomIcon. 
        /// Bit 1 - reserved. 
        /// Bit 0 - hasBeenInited.
        /// </summary>
        public byte[] FinderFlags8F { get { return _finderFlags8F; } }
        public byte[] ZeroFill { get { return _zeroFill; } }
        public ushort WinYPos { get { return _winYPos; } }
        public ushort WinXPos { get { return _winXPos; } }
        public ushort WinId { get { return _winId; } }
        public byte ProtectedFlag { get { return _protectedFlag; } }
        public byte[] ZeroFill2 { get { return _zeroFill2; } }
        public uint DataForkLength { get { return _dataForkLength; } }
        public uint ResourceForkLength { get { return _resourceForkLength; } }

        /// <summary>
        /// seconds since Jan 1, 1904
        /// </summary>
        public uint CreationDate { get { return _creationDate; } }

        /// <summary>
        /// seconds since Jan 1, 1904
        /// </summary>
        public uint ModificationDate { get { return _modificationDate; } }
        public ushort GetInfoLength { get { return _getInfoLength; } }

        /// <summary>
        /// Bit 7 - hasNoInits 
        /// Bit 6 - isShared 
        /// Bit 5 - requiresSwitchLaunch
        /// Bit 4 - ColorReserved
        /// Bits 1-3 - color 
        /// Bit 0 - isOnDesk
        /// </summary>
        public byte FinderFlags07 { get { return _finderFlags07; } }
        public uint Signature { get { return _signature; } }

        /// <summary>
        /// script of file name from fdScript field of fxInfo record
        /// </summary>
        public byte FdScript { get { return _fdScript; } }

        /// <summary>
        /// extended finder flags from fdXFlags field of fxInfo record
        /// </summary>
        public byte FdXFlags { get { return _fdXFlags; } }
        public byte[] Padding { get { return _padding; } }
        public uint TotalUnpackedFilesLength { get { return _totalUnpackedFilesLength; } }

        /// <summary>
        /// if non-zero, skip this many bytes, 
        /// rounded up to the next multiple of 128.
        /// This was reserved for future use, and has never been used.
        /// So this value should always be 0.
        /// </summary>
        public ushort SecondHeaderLength { get { return _secondHeaderLength; } }
        public byte[] SecondHeader { get { return _secondHeader; } }
        public byte[] SecondHeaderPadding { get { return _secondHeaderPadding; } }
        public byte MacbinaryVersion { get { return _macbinaryVersion; } }
        public byte MinMacbinaryVersionNeeded { get { return _minMacbinaryVersionNeeded; } }
        public uint CrcCheck { get { return _crcCheck; } }
        public byte[] DataFork { get { return _dataFork; } }
        public byte[] DataForkPadding { get { return _dataForkPadding; } }
        public byte[] ResourceFork { get { return _resourceFork; } }
        public byte[] ResourceForkPadding { get { return _resourceForkPadding; } }
        public Macbinary M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
