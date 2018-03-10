<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The binary format consists of a 128-byte header containing all the information necessary 
 * to reproduce the document's directory entry on the receiving Macintosh; 
 * followed by the document's Data Fork (if it has one), padded with nulls to 
 * a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
 * (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
 * are contained in the header.
 */

class Macbinary extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Macbinary $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_oldSectionHeader = $this->_io->ensureFixedContents("\x00");
        $this->_m_filenameLength = $this->_io->readU1();
        $this->_m_filename = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->filenameLength()), "ascii");
        $this->_m_filenamePadding = $this->_io->readBytes((63 - $this->filenameLength()));
        $this->_m_fileType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_fileCreator = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_finderFlags8F = $this->_io->readBytes(1);
        $this->_m_zeroFill = $this->_io->ensureFixedContents("\x00");
        $this->_m_winYPos = $this->_io->readU2be();
        $this->_m_winXPos = $this->_io->readU2be();
        $this->_m_winId = $this->_io->readU2be();
        $this->_m_protectedFlag = $this->_io->readU1();
        $this->_m_zeroFill2 = $this->_io->ensureFixedContents("\x00");
        $this->_m_dataForkLength = $this->_io->readU4be();
        $this->_m_resourceForkLength = $this->_io->readU4be();
        $this->_m_creationDate = $this->_io->readU4be();
        $this->_m_modificationDate = $this->_io->readU4be();
        $this->_m_getInfoLength = $this->_io->readU2be();
        $this->_m_finderFlags07 = $this->_io->readU1();
        $this->_m_signature = $this->_io->readU4be();
        $this->_m_fdScript = $this->_io->readU1();
        $this->_m_fdXFlags = $this->_io->readU1();
        $this->_m_padding = $this->_io->readBytes(8);
        $this->_m_totalUnpackedFilesLength = $this->_io->readU4be();
        $this->_m_secondHeaderLength = $this->_io->readU2be();
        if ($this->secondHeaderLength() != 0) {
            $this->_m_secondHeader = $this->_io->readBytes($this->secondHeaderLength());
        }
        if ($this->secondHeaderLength() != 0) {
            $this->_m_secondHeaderPadding = $this->_io->readBytes((128 - \Kaitai\Struct\Stream::mod($this->secondHeaderLength(), 128)));
        }
        $this->_m_macbinaryVersion = $this->_io->readU1();
        $this->_m_minMacbinaryVersionNeeded = $this->_io->readU1();
        $this->_m_crcCheck = $this->_io->readU4be();
        if ($this->dataForkLength() != 0) {
            $this->_m_dataFork = $this->_io->readBytes($this->dataForkLength());
        }
        if (\Kaitai\Struct\Stream::mod($this->dataForkLength(), 128) != 0) {
            $this->_m_dataForkPadding = $this->_io->readBytes((128 - \Kaitai\Struct\Stream::mod($this->dataForkLength(), 128)));
        }
        $this->_m_resourceFork = $this->_io->readBytes($this->resourceForkLength());
        $this->_m_resourceForkPadding = $this->_io->readBytes((128 - \Kaitai\Struct\Stream::mod($this->resourceForkLength(), 128)));
    }
    protected $_m_oldSectionHeader;
    protected $_m_filenameLength;
    protected $_m_filename;
    protected $_m_filenamePadding;
    protected $_m_fileType;
    protected $_m_fileCreator;
    protected $_m_finderFlags8F;
    protected $_m_zeroFill;
    protected $_m_winYPos;
    protected $_m_winXPos;
    protected $_m_winId;
    protected $_m_protectedFlag;
    protected $_m_zeroFill2;
    protected $_m_dataForkLength;
    protected $_m_resourceForkLength;
    protected $_m_creationDate;
    protected $_m_modificationDate;
    protected $_m_getInfoLength;
    protected $_m_finderFlags07;
    protected $_m_signature;
    protected $_m_fdScript;
    protected $_m_fdXFlags;
    protected $_m_padding;
    protected $_m_totalUnpackedFilesLength;
    protected $_m_secondHeaderLength;
    protected $_m_secondHeader;
    protected $_m_secondHeaderPadding;
    protected $_m_macbinaryVersion;
    protected $_m_minMacbinaryVersionNeeded;
    protected $_m_crcCheck;
    protected $_m_dataFork;
    protected $_m_dataForkPadding;
    protected $_m_resourceFork;
    protected $_m_resourceForkPadding;
    public function oldSectionHeader() { return $this->_m_oldSectionHeader; }
    public function filenameLength() { return $this->_m_filenameLength; }
    public function filename() { return $this->_m_filename; }
    public function filenamePadding() { return $this->_m_filenamePadding; }
    public function fileType() { return $this->_m_fileType; }
    public function fileCreator() { return $this->_m_fileCreator; }

    /**
     * Bit 7 - isAlias. 
     * Bit 6 - isInvisible. 
     * Bit 5 - hasBundle. 
     * Bit 4 - nameLocked. 
     * Bit 3 - isStationery. 
     * Bit 2 - hasCustomIcon. 
     * Bit 1 - reserved. 
     * Bit 0 - hasBeenInited.
     */
    public function finderFlags8F() { return $this->_m_finderFlags8F; }
    public function zeroFill() { return $this->_m_zeroFill; }
    public function winYPos() { return $this->_m_winYPos; }
    public function winXPos() { return $this->_m_winXPos; }
    public function winId() { return $this->_m_winId; }
    public function protectedFlag() { return $this->_m_protectedFlag; }
    public function zeroFill2() { return $this->_m_zeroFill2; }
    public function dataForkLength() { return $this->_m_dataForkLength; }
    public function resourceForkLength() { return $this->_m_resourceForkLength; }

    /**
     * seconds since Jan 1, 1904
     */
    public function creationDate() { return $this->_m_creationDate; }

    /**
     * seconds since Jan 1, 1904
     */
    public function modificationDate() { return $this->_m_modificationDate; }
    public function getInfoLength() { return $this->_m_getInfoLength; }

    /**
     * Bit 7 - hasNoInits 
     * Bit 6 - isShared 
     * Bit 5 - requiresSwitchLaunch
     * Bit 4 - ColorReserved
     * Bits 1-3 - color 
     * Bit 0 - isOnDesk
     */
    public function finderFlags07() { return $this->_m_finderFlags07; }
    public function signature() { return $this->_m_signature; }

    /**
     * script of file name from fdScript field of fxInfo record
     */
    public function fdScript() { return $this->_m_fdScript; }

    /**
     * extended finder flags from fdXFlags field of fxInfo record
     */
    public function fdXFlags() { return $this->_m_fdXFlags; }
    public function padding() { return $this->_m_padding; }
    public function totalUnpackedFilesLength() { return $this->_m_totalUnpackedFilesLength; }

    /**
     * if non-zero, skip this many bytes, 
     * rounded up to the next multiple of 128.
     * This was reserved for future use, and has never been used.
     * So this value should always be 0.
     */
    public function secondHeaderLength() { return $this->_m_secondHeaderLength; }
    public function secondHeader() { return $this->_m_secondHeader; }
    public function secondHeaderPadding() { return $this->_m_secondHeaderPadding; }
    public function macbinaryVersion() { return $this->_m_macbinaryVersion; }
    public function minMacbinaryVersionNeeded() { return $this->_m_minMacbinaryVersionNeeded; }
    public function crcCheck() { return $this->_m_crcCheck; }
    public function dataFork() { return $this->_m_dataFork; }
    public function dataForkPadding() { return $this->_m_dataForkPadding; }
    public function resourceFork() { return $this->_m_resourceFork; }
    public function resourceForkPadding() { return $this->_m_resourceForkPadding; }
}
