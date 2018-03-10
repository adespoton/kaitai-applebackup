-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
-- These computers did not come with install disks, but instead with software pre-installed
-- on the hard disk, with an Apple Backup program that could be used to back the hard disk's
-- contents up to 1440KB floppy disks in 1414KB files named "Backup Disk #" where # was 1 
-- through the last disk needed for a full drive backup.
-- These files had the Type/Creator codes of OBDa and OBBa.
-- Later versions of the Performa line came with Restore CDs that contained "Restore All Software"
-- and "Restore System Software" folders containing 1414KB files named "Data File #" -- where all
-- the required files resided in the same folder on the CD.
-- These files had the Type/Creatorcodes of OBDc and OBBa.
-- Both file types are flat data files as indicated in the struct below.
-- See also: Source (https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/)
AppleBackup = class.class(KaitaiStruct)

function AppleBackup:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup:_read()
  self._raw_backup_disk_header = self._io:read_bytes(512)
  local _io = KaitaiStream(stringstream(self._raw_backup_disk_header))
  self.backup_disk_header = AppleBackup.BackupDiskHeaderType(_io, self, self._root)
  self._raw_boot_blocks = self._io:read_bytes(1024)
  local _io = KaitaiStream(stringstream(self._raw_boot_blocks))
  self.boot_blocks = AppleBackup.BootBlocksType(_io, self, self._root)
  self._raw_file_data = self._io:read_bytes((self.backup_disk_header.total_size_used - 1536))
  local _io = KaitaiStream(stringstream(self._raw_file_data))
  self.file_data = AppleBackup.FileDataSeq(_io, self, self._root)
end


AppleBackup.FileDataType = class.class(KaitaiStruct)

function AppleBackup.FileDataType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.FileDataType:_read()
  self.file_version = self._io:read_u2be()
  self.file_magic = self._io:ensure_fixed_contents("\082\076\068\087")
  self.file_starts_on_disk = self._io:read_u2be()
  self.backup_start_time = self._io:read_u4be()
  self.header_offset = self._io:read_u4be()
  self.file_name_len = self._io:read_u1()
  self.file_name = str_decode.decode(self._io:read_bytes(self.file_name_len), "ascii")
  self.file_name_padding = self._io:read_bytes((31 - self.file_name_len))
  self.file_part = self._io:read_u2be()
  self.folder_flags = self._io:read_u1()
  self.validity_flag = self._io:read_u1()
  if self.folder_flags == 0 then
    self._raw_finfo_data = self._io:read_bytes(16)
    local _io = KaitaiStream(stringstream(self._raw_finfo_data))
    self.finfo_data = AppleBackup.FinfoDataStruct(_io, self, self._root)
  end
  if self.folder_flags == 0 then
    self._raw_fxinfo_data = self._io:read_bytes(16)
    local _io = KaitaiStream(stringstream(self._raw_fxinfo_data))
    self.fxinfo_data = AppleBackup.FxinfoDataStruct(_io, self, self._root)
  end
  if self.folder_flags ~= 0 then
    self._raw_dinfo_data = self._io:read_bytes(16)
    local _io = KaitaiStream(stringstream(self._raw_dinfo_data))
    self.dinfo_data = AppleBackup.DinfoDataStruct(_io, self, self._root)
  end
  if self.folder_flags ~= 0 then
    self._raw_dxinfo_data = self._io:read_bytes(16)
    local _io = KaitaiStream(stringstream(self._raw_dxinfo_data))
    self.dxinfo_data = AppleBackup.DxinfoDataStruct(_io, self, self._root)
  end
  self.file_attributes = self._io:read_u1()
  self.file_reserved = self._io:read_u1()
  self.creation_date = self._io:read_u4be()
  self.modification_date = self._io:read_u4be()
  self.data_fork_length = self._io:read_u4be()
  self.resource_fork_length = self._io:read_u4be()
  self.data_fork_in_file_length = self._io:read_u4be()
  self.resource_fork_in_file_length = self._io:read_u4be()
  self.full_file_path_length = self._io:read_u2be()
  self.full_file_path = str_decode.decode(self._io:read_bytes(self.full_file_path_length), "ascii")
  self.data_fork = self._io:read_bytes(self.data_fork_in_file_length)
  self.resource_fork = self._io:read_bytes(self.resource_fork_in_file_length)
  if  (((512 - ((((112 + self.data_fork_in_file_length) + self.resource_fork_in_file_length) + self.full_file_path_length) % 512)) ~= 512) or ((self._parent._parent.backup_disk_header.disk_number - self._parent._parent.backup_disk_header.total_disks) == 0))  then
    self.file_padding = self._io:read_bytes((512 - ((((112 + self.data_fork_in_file_length) + self.resource_fork_in_file_length) + self.full_file_path_length) % 512)))
  end
end

-- 
-- Seconds since January 1, 1904 00:00:00 local time.
-- 
-- HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox.
-- 
-- Seconds since January 1, 1904 00:00:00 local time.
-- 
-- Seconds since January 1, 1904 00:00:00 local time.

AppleBackup.FxinfoDataStruct = class.class(KaitaiStruct)

function AppleBackup.FxinfoDataStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.FxinfoDataStruct:_read()
  self.fd_icon_id = self._io:read_u2be()
  self.fd_unused = self._io:read_bytes(8)
  self.fd_comment = self._io:read_u2be()
  self.fd_put_away = self._io:read_u4be()
end


-- 
-- Standard SCSI boot blocks, begins with LK, shortly followed by
-- System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
-- Theyare written to the hard drive by the restore program when the 
-- System Folder is blessed as it's restored.
-- See also: Source (http://mcosre.sourceforge.net/docs/boot_blocks.html)
AppleBackup.BootBlocksType = class.class(KaitaiStruct)

function AppleBackup.BootBlocksType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.BootBlocksType:_read()
  self.sig_bytes = self._io:ensure_fixed_contents("\076\075")
  self.branch_code = self._io:read_u4be()
  self.boot_block_flags = self._io:read_u1()
  self.boot_block_version_number = self._io:read_u1()
  self.secondary_sound_and_video_pages = self._io:read_u2be()
  self.len_system_name = self._io:read_u1()
  self.system_name = str_decode.decode(self._io:read_bytes(self.len_system_name), "ascii")
  self.system_name_padding = self._io:read_bytes((15 - self.len_system_name))
  self.len_finder_name = self._io:read_u1()
  self.finder_name = str_decode.decode(self._io:read_bytes(self.len_finder_name), "ascii")
  self.finder_name_padding = self._io:read_bytes((15 - self.len_finder_name))
  self.len_debugger_name = self._io:read_u1()
  self.debugger_name = str_decode.decode(self._io:read_bytes(self.len_debugger_name), "ascii")
  self.debugger_name_padding = self._io:read_bytes((15 - self.len_debugger_name))
  self.len_dissassembler_name = self._io:read_u1()
  self.dissassembler_name = str_decode.decode(self._io:read_bytes(self.len_dissassembler_name), "ascii")
  self.dissassembler_name_padding = self._io:read_bytes((15 - self.len_dissassembler_name))
  self.len_start_up_screen_name = self._io:read_u1()
  self.start_up_screen_name = str_decode.decode(self._io:read_bytes(self.len_start_up_screen_name), "ascii")
  self.start_up_screen_name_padding = self._io:read_bytes((15 - self.len_start_up_screen_name))
  self.len_boot_up_name = self._io:read_u1()
  self.boot_up_name = str_decode.decode(self._io:read_bytes(self.len_boot_up_name), "ascii")
  self.boot_up_name_padding = self._io:read_bytes((15 - self.len_boot_up_name))
  self.len_clipboard_name = self._io:read_u1()
  self.clipboard_name = str_decode.decode(self._io:read_bytes(self.len_clipboard_name), "ascii")
  self.clipboard_name_padding = self._io:read_bytes((15 - self.len_clipboard_name))
  self.max_files = self._io:read_u2be()
  self.event_queue_size = self._io:read_u2be()
  self.heap_on_128k_mac = self._io:read_u4be()
  self.heap_on_256k_mac = self._io:read_u4be()
  self.heap_on_512k_mac = self._io:read_u4be()
  self.boot_code = self._io:read_bytes(886)
end


AppleBackup.DinfoDataStruct = class.class(KaitaiStruct)

function AppleBackup.DinfoDataStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.DinfoDataStruct:_read()
  self.fr_rect = self._io:read_bytes(8)
  self.fr_flags = self._io:read_u2be()
  self.fr_location = self._io:read_u4be()
  self.fr_view = self._io:read_u2be()
end


AppleBackup.DxinfoDataStruct = class.class(KaitaiStruct)

function AppleBackup.DxinfoDataStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.DxinfoDataStruct:_read()
  self.fr_scroll = self._io:read_u4be()
  self.fr_open_chain = self._io:read_u4be()
  self.fr_unused = self._io:read_bytes(2)
  self.fr_comment = self._io:read_u2be()
  self.fr_put_away = self._io:read_u4be()
end


AppleBackup.FileDataSeq = class.class(KaitaiStruct)

function AppleBackup.FileDataSeq:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.FileDataSeq:_read()
  self.file_data_contents = {}
  local i = 1
  while not self._io:is_eof() do
    self.file_data_contents[i] = AppleBackup.FileDataType(self._io, self, self._root)
    i = i + 1
  end
end


AppleBackup.FinfoDataStruct = class.class(KaitaiStruct)

function AppleBackup.FinfoDataStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.FinfoDataStruct:_read()
  self.fd_type = str_decode.decode(self._io:read_bytes(4), "ascii")
  self.fd_creator = str_decode.decode(self._io:read_bytes(4), "ascii")
  self.fd_flags_0_7 = self._io:read_u1()
  self.fd_flags_8_f = self._io:read_u1()
  self.fd_location = self._io:read_u4be()
  self.fd_fldr = self._io:read_u2be()
end


AppleBackup.BackupDiskHeaderType = class.class(KaitaiStruct)

function AppleBackup.BackupDiskHeaderType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AppleBackup.BackupDiskHeaderType:_read()
  self.version = self._io:read_u2be()
  self.magic = self._io:ensure_fixed_contents("\067\077\087\076")
  self.disk_number = self._io:read_u2be()
  self.total_disks = self._io:read_u2be()
  self.backup_start_time = self._io:read_u4be()
  self.backup_start_time2 = self._io:read_u4be()
  self.hard_drive_name_len = self._io:read_u1()
  self.hard_drive_name = str_decode.decode(self._io:read_bytes(self.hard_drive_name_len), "ascii")
  self.hard_drive_name_padding = self._io:read_bytes((31 - self.hard_drive_name_len))
  self.total_file_size = self._io:read_u4be()
  self.total_size_used = self._io:read_u4be()
  self.bdh_padding = self._io:read_bytes(454)
end

-- 
-- valid up to and including version 0x0104.
-- 
-- identifies this file as an Apple Backup file.
-- 
-- value is between 1 and total_disks.
-- 
-- total number of disks used for the backup.
-- 
-- Seconds since January 1, 1904 00:00:00 local time.
-- 
-- duplicate of backup_start_time.
-- 
-- Length of the name of the hard drive that was backed up.
-- 
-- Name of the hard drive that was backed up.
-- 
-- Remainder of Pascal Str31 address space.
-- 
-- Total size of this restore file; typically 0x161800.
-- 
-- Number of bytes actually used in this restore file; usually 0x161800 except for last file.
-- 
-- 0x00 padding to end of header.

