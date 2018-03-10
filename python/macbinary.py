# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Macbinary(KaitaiStruct):
    """The binary format consists of a 128-byte header containing all the information necessary 
    to reproduce the document's directory entry on the receiving Macintosh; 
    followed by the document's Data Fork (if it has one), padded with nulls to 
    a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
    (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
    are contained in the header.
    
    .. seealso::
       Source - http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.old_section_header = self._io.ensure_fixed_contents(b"\x00")
        self.filename_length = self._io.read_u1()
        self.filename = (self._io.read_bytes(self.filename_length)).decode(u"ascii")
        self.filename_padding = self._io.read_bytes((63 - self.filename_length))
        self.file_type = (self._io.read_bytes(4)).decode(u"ascii")
        self.file_creator = (self._io.read_bytes(4)).decode(u"ascii")
        self.finder_flags_8_f = self._io.read_bytes(1)
        self.zero_fill = self._io.ensure_fixed_contents(b"\x00")
        self.win_y_pos = self._io.read_u2be()
        self.win_x_pos = self._io.read_u2be()
        self.win_id = self._io.read_u2be()
        self.protected_flag = self._io.read_u1()
        self.zero_fill_2 = self._io.ensure_fixed_contents(b"\x00")
        self.data_fork_length = self._io.read_u4be()
        self.resource_fork_length = self._io.read_u4be()
        self.creation_date = self._io.read_u4be()
        self.modification_date = self._io.read_u4be()
        self.get_info_length = self._io.read_u2be()
        self.finder_flags_0_7 = self._io.read_u1()
        self.signature = self._io.read_u4be()
        self.fd_script = self._io.read_u1()
        self.fd_x_flags = self._io.read_u1()
        self.padding = self._io.read_bytes(8)
        self.total_unpacked_files_length = self._io.read_u4be()
        self.second_header_length = self._io.read_u2be()
        if self.second_header_length != 0:
            self.second_header = self._io.read_bytes(self.second_header_length)

        if self.second_header_length != 0:
            self.second_header_padding = self._io.read_bytes((128 - (self.second_header_length % 128)))

        self.macbinary_version = self._io.read_u1()
        self.min_macbinary_version_needed = self._io.read_u1()
        self.crc_check = self._io.read_u4be()
        if self.data_fork_length != 0:
            self.data_fork = self._io.read_bytes(self.data_fork_length)

        if (self.data_fork_length % 128) != 0:
            self.data_fork_padding = self._io.read_bytes((128 - (self.data_fork_length % 128)))

        self.resource_fork = self._io.read_bytes(self.resource_fork_length)
        self.resource_fork_padding = self._io.read_bytes((128 - (self.resource_fork_length % 128)))


