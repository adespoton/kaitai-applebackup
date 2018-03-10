// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;


/**
 * The binary format consists of a 128-byte header containing all the information necessary 
 * to reproduce the document's directory entry on the receiving Macintosh; 
 * followed by the document's Data Fork (if it has one), padded with nulls to 
 * a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
 * (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
 * are contained in the header.
 * @see <a href="http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html">Source</a>
 */
public class Macbinary extends KaitaiStruct {
    public static Macbinary fromFile(String fileName) throws IOException {
        return new Macbinary(new ByteBufferKaitaiStream(fileName));
    }

    public Macbinary(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Macbinary(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Macbinary(KaitaiStream _io, KaitaiStruct _parent, Macbinary _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.oldSectionHeader = this._io.ensureFixedContents(new byte[] { 0 });
        this.filenameLength = this._io.readU1();
        this.filename = new String(this._io.readBytes(filenameLength()), Charset.forName("ascii"));
        this.filenamePadding = this._io.readBytes((63 - filenameLength()));
        this.fileType = new String(this._io.readBytes(4), Charset.forName("ascii"));
        this.fileCreator = new String(this._io.readBytes(4), Charset.forName("ascii"));
        this.finderFlags8F = this._io.readBytes(1);
        this.zeroFill = this._io.ensureFixedContents(new byte[] { 0 });
        this.winYPos = this._io.readU2be();
        this.winXPos = this._io.readU2be();
        this.winId = this._io.readU2be();
        this.protectedFlag = this._io.readU1();
        this.zeroFill2 = this._io.ensureFixedContents(new byte[] { 0 });
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
        if (secondHeaderLength() != 0) {
            this.secondHeader = this._io.readBytes(secondHeaderLength());
        }
        if (secondHeaderLength() != 0) {
            this.secondHeaderPadding = this._io.readBytes((128 - KaitaiStream.mod(secondHeaderLength(), 128)));
        }
        this.macbinaryVersion = this._io.readU1();
        this.minMacbinaryVersionNeeded = this._io.readU1();
        this.crcCheck = this._io.readU4be();
        if (dataForkLength() != 0) {
            this.dataFork = this._io.readBytes(dataForkLength());
        }
        if (KaitaiStream.mod(dataForkLength(), 128) != 0) {
            this.dataForkPadding = this._io.readBytes((128 - KaitaiStream.mod(dataForkLength(), 128)));
        }
        this.resourceFork = this._io.readBytes(resourceForkLength());
        this.resourceForkPadding = this._io.readBytes((128 - KaitaiStream.mod(resourceForkLength(), 128)));
    }
    private byte[] oldSectionHeader;
    private int filenameLength;
    private String filename;
    private byte[] filenamePadding;
    private String fileType;
    private String fileCreator;
    private byte[] finderFlags8F;
    private byte[] zeroFill;
    private int winYPos;
    private int winXPos;
    private int winId;
    private int protectedFlag;
    private byte[] zeroFill2;
    private long dataForkLength;
    private long resourceForkLength;
    private long creationDate;
    private long modificationDate;
    private int getInfoLength;
    private int finderFlags07;
    private long signature;
    private int fdScript;
    private int fdXFlags;
    private byte[] padding;
    private long totalUnpackedFilesLength;
    private int secondHeaderLength;
    private byte[] secondHeader;
    private byte[] secondHeaderPadding;
    private int macbinaryVersion;
    private int minMacbinaryVersionNeeded;
    private long crcCheck;
    private byte[] dataFork;
    private byte[] dataForkPadding;
    private byte[] resourceFork;
    private byte[] resourceForkPadding;
    private Macbinary _root;
    private KaitaiStruct _parent;
    public byte[] oldSectionHeader() { return oldSectionHeader; }
    public int filenameLength() { return filenameLength; }
    public String filename() { return filename; }
    public byte[] filenamePadding() { return filenamePadding; }
    public String fileType() { return fileType; }
    public String fileCreator() { return fileCreator; }

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
    public byte[] finderFlags8F() { return finderFlags8F; }
    public byte[] zeroFill() { return zeroFill; }
    public int winYPos() { return winYPos; }
    public int winXPos() { return winXPos; }
    public int winId() { return winId; }
    public int protectedFlag() { return protectedFlag; }
    public byte[] zeroFill2() { return zeroFill2; }
    public long dataForkLength() { return dataForkLength; }
    public long resourceForkLength() { return resourceForkLength; }

    /**
     * seconds since Jan 1, 1904
     */
    public long creationDate() { return creationDate; }

    /**
     * seconds since Jan 1, 1904
     */
    public long modificationDate() { return modificationDate; }
    public int getInfoLength() { return getInfoLength; }

    /**
     * Bit 7 - hasNoInits 
     * Bit 6 - isShared 
     * Bit 5 - requiresSwitchLaunch
     * Bit 4 - ColorReserved
     * Bits 1-3 - color 
     * Bit 0 - isOnDesk
     */
    public int finderFlags07() { return finderFlags07; }
    public long signature() { return signature; }

    /**
     * script of file name from fdScript field of fxInfo record
     */
    public int fdScript() { return fdScript; }

    /**
     * extended finder flags from fdXFlags field of fxInfo record
     */
    public int fdXFlags() { return fdXFlags; }
    public byte[] padding() { return padding; }
    public long totalUnpackedFilesLength() { return totalUnpackedFilesLength; }

    /**
     * if non-zero, skip this many bytes, 
     * rounded up to the next multiple of 128.
     * This was reserved for future use, and has never been used.
     * So this value should always be 0.
     */
    public int secondHeaderLength() { return secondHeaderLength; }
    public byte[] secondHeader() { return secondHeader; }
    public byte[] secondHeaderPadding() { return secondHeaderPadding; }
    public int macbinaryVersion() { return macbinaryVersion; }
    public int minMacbinaryVersionNeeded() { return minMacbinaryVersionNeeded; }
    public long crcCheck() { return crcCheck; }
    public byte[] dataFork() { return dataFork; }
    public byte[] dataForkPadding() { return dataForkPadding; }
    public byte[] resourceFork() { return resourceFork; }
    public byte[] resourceForkPadding() { return resourceForkPadding; }
    public Macbinary _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
