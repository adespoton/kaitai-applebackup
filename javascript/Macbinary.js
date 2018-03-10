// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Macbinary = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * The binary format consists of a 128-byte header containing all the information necessary 
 * to reproduce the document's directory entry on the receiving Macintosh; 
 * followed by the document's Data Fork (if it has one), padded with nulls to 
 * a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
 * (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
 * are contained in the header.
 * @see {@link http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html|Source}
 */

var Macbinary = (function() {
  function Macbinary(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Macbinary.prototype._read = function() {
    this.oldSectionHeader = this._io.ensureFixedContents([0]);
    this.filenameLength = this._io.readU1();
    this.filename = KaitaiStream.bytesToStr(this._io.readBytes(this.filenameLength), "ascii");
    this.filenamePadding = this._io.readBytes((63 - this.filenameLength));
    this.fileType = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
    this.fileCreator = KaitaiStream.bytesToStr(this._io.readBytes(4), "ascii");
    this.finderFlags8F = this._io.readBytes(1);
    this.zeroFill = this._io.ensureFixedContents([0]);
    this.winYPos = this._io.readU2be();
    this.winXPos = this._io.readU2be();
    this.winId = this._io.readU2be();
    this.protectedFlag = this._io.readU1();
    this.zeroFill2 = this._io.ensureFixedContents([0]);
    this.dataForkLength = this._io.readU4be();
    this.resourceForkLength = this._io.readU4be();
    this.creationDate = this._io.readU4be();
    this.modificationDate = this._io.readU4be();
    this.getInfoLength = this._io.readU2be();
    this.finderFlags07 = this._io.readU1();
    this.signature = this._io.readU4be();
    this.fdScript = this._io.readU1();
    this.fdXFlags = this._io.readU1();
    this.padding = this._io.readBytes(8);
    this.totalUnpackedFilesLength = this._io.readU4be();
    this.secondHeaderLength = this._io.readU2be();
    if (this.secondHeaderLength != 0) {
      this.secondHeader = this._io.readBytes(this.secondHeaderLength);
    }
    if (this.secondHeaderLength != 0) {
      this.secondHeaderPadding = this._io.readBytes((128 - KaitaiStream.mod(this.secondHeaderLength, 128)));
    }
    this.macbinaryVersion = this._io.readU1();
    this.minMacbinaryVersionNeeded = this._io.readU1();
    this.crcCheck = this._io.readU4be();
    if (this.dataForkLength != 0) {
      this.dataFork = this._io.readBytes(this.dataForkLength);
    }
    if (KaitaiStream.mod(this.dataForkLength, 128) != 0) {
      this.dataForkPadding = this._io.readBytes((128 - KaitaiStream.mod(this.dataForkLength, 128)));
    }
    this.resourceFork = this._io.readBytes(this.resourceForkLength);
    this.resourceForkPadding = this._io.readBytes((128 - KaitaiStream.mod(this.resourceForkLength, 128)));
  }

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

  /**
   * seconds since Jan 1, 1904
   */

  /**
   * seconds since Jan 1, 1904
   */

  /**
   * Bit 7 - hasNoInits 
   * Bit 6 - isShared 
   * Bit 5 - requiresSwitchLaunch
   * Bit 4 - ColorReserved
   * Bits 1-3 - color 
   * Bit 0 - isOnDesk
   */

  /**
   * script of file name from fdScript field of fxInfo record
   */

  /**
   * extended finder flags from fdXFlags field of fxInfo record
   */

  /**
   * if non-zero, skip this many bytes, 
   * rounded up to the next multiple of 128.
   * This was reserved for future use, and has never been used.
   * So this value should always be 0.
   */

  return Macbinary;
})();
return Macbinary;
}));
