# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class AppleBackup(KaitaiStruct):
    """In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
    These computers did not come with install disks, but instead with software pre-installed
    on the hard disk, with an Apple Backup program that could be used to back the hard disk's
    contents up to 1440KB floppy disks in 1414KB files named "Backup Disk #" where # was 1 
    through the last disk needed for a full drive backup.
    These files had the Type/Creator codes of OBDa and OBBa.
    Later versions of the Performa line came with Restore CDs that contained "Restore All Software"
    and "Restore System Software" folders containing 1414KB files named "Data File #" -- where all
    the required files resided in the same folder on the CD.
    These files had the Type/Creatorcodes of OBDc and OBBa.
    Both file types are flat data files as indicated in the struct below.
    
    .. seealso::
       Source - https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self._raw_backup_disk_header = self._io.read_bytes(512)
        io = KaitaiStream(BytesIO(self._raw_backup_disk_header))
        self.backup_disk_header = self._root.BackupDiskHeaderType(io, self, self._root)
        self._raw_boot_blocks = self._io.read_bytes(1024)
        io = KaitaiStream(BytesIO(self._raw_boot_blocks))
        self.boot_blocks = self._root.BootBlocksType(io, self, self._root)
        self._raw_file_data = self._io.read_bytes((self.backup_disk_header.total_size_used - 1536))
        io = KaitaiStream(BytesIO(self._raw_file_data))
        self.file_data = self._root.FileDataSeq(io, self, self._root)

    class FileDataType(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_version = self._io.read_u2be()
            self.file_magic = self._io.ensure_fixed_contents(b"\x52\x4C\x44\x57")
            self.file_starts_on_disk = self._io.read_u2be()
            self.backup_start_time = self._io.read_u4be()
            self.header_offset = self._io.read_u4be()
            self.file_name_len = self._io.read_u1()
            self.file_name = (self._io.read_bytes(self.file_name_len)).decode(u"ascii")
            self.file_name_padding = self._io.read_bytes((31 - self.file_name_len))
            self.file_part = self._io.read_u2be()
            self.folder_flags = self._io.read_u1()
            self.validity_flag = self._io.read_u1()
            if self.folder_flags == 0:
                self._raw_finfo_data = self._io.read_bytes(16)
                io = KaitaiStream(BytesIO(self._raw_finfo_data))
                self.finfo_data = self._root.FinfoDataStruct(io, self, self._root)

            if self.folder_flags == 0:
                self._raw_fxinfo_data = self._io.read_bytes(16)
                io = KaitaiStream(BytesIO(self._raw_fxinfo_data))
                self.fxinfo_data = self._root.FxinfoDataStruct(io, self, self._root)

            if self.folder_flags != 0:
                self._raw_dinfo_data = self._io.read_bytes(16)
                io = KaitaiStream(BytesIO(self._raw_dinfo_data))
                self.dinfo_data = self._root.DinfoDataStruct(io, self, self._root)

            if self.folder_flags != 0:
                self._raw_dxinfo_data = self._io.read_bytes(16)
                io = KaitaiStream(BytesIO(self._raw_dxinfo_data))
                self.dxinfo_data = self._root.DxinfoDataStruct(io, self, self._root)

            self.file_attributes = self._io.read_u1()
            self.file_reserved = self._io.read_u1()
            self.creation_date = self._io.read_u4be()
            self.modification_date = self._io.read_u4be()
            self.data_fork_length = self._io.read_u4be()
            self.resource_fork_length = self._io.read_u4be()
            self.data_fork_in_file_length = self._io.read_u4be()
            self.resource_fork_in_file_length = self._io.read_u4be()
            self.full_file_path_length = self._io.read_u2be()
            self.full_file_path = (self._io.read_bytes(self.full_file_path_length)).decode(u"ascii")
            self.data_fork = self._io.read_bytes(self.data_fork_in_file_length)
            self.resource_fork = self._io.read_bytes(self.resource_fork_in_file_length)
            if  (((512 - ((((112 + self.data_fork_in_file_length) + self.resource_fork_in_file_length) + self.full_file_path_length) % 512)) != 512) or ((self._parent._parent.backup_disk_header.disk_number - self._parent._parent.backup_disk_header.total_disks) == 0)) :
                self.file_padding = self._io.read_bytes((512 - ((((112 + self.data_fork_in_file_length) + self.resource_fork_in_file_length) + self.full_file_path_length) % 512)))



    class FxinfoDataStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.fd_icon_id = self._io.read_u2be()
            self.fd_unused = self._io.read_bytes(8)
            self.fd_comment = self._io.read_u2be()
            self.fd_put_away = self._io.read_u4be()


    class BootBlocksType(KaitaiStruct):
        """Standard SCSI boot blocks, begins with LK, shortly followed by
        System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
        Theyare written to the hard drive by the restore program when the 
        System Folder is blessed as it's restored.
        
        .. seealso::
           Source - http://mcosre.sourceforge.net/docs/boot_blocks.html
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.sig_bytes = self._io.ensure_fixed_contents(b"\x4C\x4B")
            self.branch_code = self._io.read_u4be()
            self.boot_block_flags = self._io.read_u1()
            self.boot_block_version_number = self._io.read_u1()
            self.secondary_sound_and_video_pages = self._io.read_u2be()
            self.len_system_name = self._io.read_u1()
            self.system_name = (self._io.read_bytes(self.len_system_name)).decode(u"ascii")
            self.system_name_padding = self._io.read_bytes((15 - self.len_system_name))
            self.len_finder_name = self._io.read_u1()
            self.finder_name = (self._io.read_bytes(self.len_finder_name)).decode(u"ascii")
            self.finder_name_padding = self._io.read_bytes((15 - self.len_finder_name))
            self.len_debugger_name = self._io.read_u1()
            self.debugger_name = (self._io.read_bytes(self.len_debugger_name)).decode(u"ascii")
            self.debugger_name_padding = self._io.read_bytes((15 - self.len_debugger_name))
            self.len_dissassembler_name = self._io.read_u1()
            self.dissassembler_name = (self._io.read_bytes(self.len_dissassembler_name)).decode(u"ascii")
            self.dissassembler_name_padding = self._io.read_bytes((15 - self.len_dissassembler_name))
            self.len_start_up_screen_name = self._io.read_u1()
            self.start_up_screen_name = (self._io.read_bytes(self.len_start_up_screen_name)).decode(u"ascii")
            self.start_up_screen_name_padding = self._io.read_bytes((15 - self.len_start_up_screen_name))
            self.len_boot_up_name = self._io.read_u1()
            self.boot_up_name = (self._io.read_bytes(self.len_boot_up_name)).decode(u"ascii")
            self.boot_up_name_padding = self._io.read_bytes((15 - self.len_boot_up_name))
            self.len_clipboard_name = self._io.read_u1()
            self.clipboard_name = (self._io.read_bytes(self.len_clipboard_name)).decode(u"ascii")
            self.clipboard_name_padding = self._io.read_bytes((15 - self.len_clipboard_name))
            self.max_files = self._io.read_u2be()
            self.event_queue_size = self._io.read_u2be()
            self.heap_on_128k_mac = self._io.read_u4be()
            self.heap_on_256k_mac = self._io.read_u4be()
            self.heap_on_512k_mac = self._io.read_u4be()
            self.boot_code = self._io.read_bytes(886)


    class DinfoDataStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.fr_rect = self._io.read_bytes(8)
            self.fr_flags = self._io.read_u2be()
            self.fr_location = self._io.read_u4be()
            self.fr_view = self._io.read_u2be()


    class DxinfoDataStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.fr_scroll = self._io.read_u4be()
            self.fr_open_chain = self._io.read_u4be()
            self.fr_unused = self._io.read_bytes(2)
            self.fr_comment = self._io.read_u2be()
            self.fr_put_away = self._io.read_u4be()


    class FileDataSeq(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_data_contents = []
            i = 0
            while not self._io.is_eof():
                self.file_data_contents.append(self._root.FileDataType(self._io, self, self._root))
                i += 1



    class FinfoDataStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.fd_type = (self._io.read_bytes(4)).decode(u"ascii")
            self.fd_creator = (self._io.read_bytes(4)).decode(u"ascii")
            self.fd_flags_0_7 = self._io.read_u1()
            self.fd_flags_8_f = self._io.read_u1()
            self.fd_location = self._io.read_u4be()
            self.fd_fldr = self._io.read_u2be()


    class BackupDiskHeaderType(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u2be()
            self.magic = self._io.ensure_fixed_contents(b"\x43\x4D\x57\x4C")
            self.disk_number = self._io.read_u2be()
            self.total_disks = self._io.read_u2be()
            self.backup_start_time = self._io.read_u4be()
            self.backup_start_time2 = self._io.read_u4be()
            self.hard_drive_name_len = self._io.read_u1()
            self.hard_drive_name = (self._io.read_bytes(self.hard_drive_name_len)).decode(u"ascii")
            self.hard_drive_name_padding = self._io.read_bytes((31 - self.hard_drive_name_len))
            self.total_file_size = self._io.read_u4be()
            self.total_size_used = self._io.read_u4be()
            self.bdh_padding = self._io.read_bytes(454)



