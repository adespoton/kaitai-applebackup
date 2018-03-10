-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- The binary format consists of a 128-byte header containing all the information necessary 
-- to reproduce the document's directory entry on the receiving Macintosh; 
-- followed by the document's Data Fork (if it has one), padded with nulls to 
-- a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
-- (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
-- are contained in the header.
-- See also: Source (http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html)
Macbinary = class.class(KaitaiStruct)

function Macbinary:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Macbinary:_read()
  self.old_section_header = self._io:ensure_fixed_contents("\000")
  self.filename_length = self._io:read_u1()
  self.filename = str_decode.decode(self._io:read_bytes(self.filename_length), "ascii")
  self.filename_padding = self._io:read_bytes((63 - self.filename_length))
  self.file_type = str_decode.decode(self._io:read_bytes(4), "ascii")
  self.file_creator = str_decode.decode(self._io:read_bytes(4), "ascii")
  self.finder_flags_8_f = self._io:read_bytes(1)
  self.zero_fill = self._io:ensure_fixed_contents("\000")
  self.win_y_pos = self._io:read_u2be()
  self.win_x_pos = self._io:read_u2be()
  self.win_id = self._io:read_u2be()
  self.protected_flag = self._io:read_u1()
  self.zero_fill_2 = self._io:ensure_fixed_contents("\000")
  self.data_fork_length = self._io:read_u4be()
  self.resource_fork_length = self._io:read_u4be()
  self.creation_date = self._io:read_u4be()
  self.modification_date = self._io:read_u4be()
  self.get_info_length = self._io:read_u2be()
  self.finder_flags_0_7 = self._io:read_u1()
  self.signature = self._io:read_u4be()
  self.fd_script = self._io:read_u1()
  self.fd_x_flags = self._io:read_u1()
  self.padding = self._io:read_bytes(8)
  self.total_unpacked_files_length = self._io:read_u4be()
  self.second_header_length = self._io:read_u2be()
  if self.second_header_length ~= 0 then
    self.second_header = self._io:read_bytes(self.second_header_length)
  end
  if self.second_header_length ~= 0 then
    self.second_header_padding = self._io:read_bytes((128 - (self.second_header_length % 128)))
  end
  self.macbinary_version = self._io:read_u1()
  self.min_macbinary_version_needed = self._io:read_u1()
  self.crc_check = self._io:read_u4be()
  if self.data_fork_length ~= 0 then
    self.data_fork = self._io:read_bytes(self.data_fork_length)
  end
  if (self.data_fork_length % 128) ~= 0 then
    self.data_fork_padding = self._io:read_bytes((128 - (self.data_fork_length % 128)))
  end
  self.resource_fork = self._io:read_bytes(self.resource_fork_length)
  self.resource_fork_padding = self._io:read_bytes((128 - (self.resource_fork_length % 128)))
end

-- 
-- Bit 7 - isAlias. 
-- Bit 6 - isInvisible. 
-- Bit 5 - hasBundle. 
-- Bit 4 - nameLocked. 
-- Bit 3 - isStationery. 
-- Bit 2 - hasCustomIcon. 
-- Bit 1 - reserved. 
-- Bit 0 - hasBeenInited.
-- 
-- seconds since Jan 1, 1904.
-- 
-- seconds since Jan 1, 1904.
-- 
-- Bit 7 - hasNoInits 
-- Bit 6 - isShared 
-- Bit 5 - requiresSwitchLaunch
-- Bit 4 - ColorReserved
-- Bits 1-3 - color 
-- Bit 0 - isOnDesk
-- 
-- script of file name from fdScript field of fxInfo record.
-- 
-- extended finder flags from fdXFlags field of fxInfo record.
-- 
-- if non-zero, skip this many bytes, 
-- rounded up to the next multiple of 128.
-- This was reserved for future use, and has never been used.
-- So this value should always be 0.

