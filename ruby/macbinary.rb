# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The binary format consists of a 128-byte header containing all the information necessary 
# to reproduce the document's directory entry on the receiving Macintosh; 
# followed by the document's Data Fork (if it has one), padded with nulls to 
# a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
# (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
# are contained in the header.
# @see http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html Source
class Macbinary < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @old_section_header = @_io.ensure_fixed_contents([0].pack('C*'))
    @filename_length = @_io.read_u1
    @filename = (@_io.read_bytes(filename_length)).force_encoding("ascii")
    @filename_padding = @_io.read_bytes((63 - filename_length))
    @file_type = (@_io.read_bytes(4)).force_encoding("ascii")
    @file_creator = (@_io.read_bytes(4)).force_encoding("ascii")
    @finder_flags_8_f = @_io.read_bytes(1)
    @zero_fill = @_io.ensure_fixed_contents([0].pack('C*'))
    @win_y_pos = @_io.read_u2be
    @win_x_pos = @_io.read_u2be
    @win_id = @_io.read_u2be
    @protected_flag = @_io.read_u1
    @zero_fill_2 = @_io.ensure_fixed_contents([0].pack('C*'))
    @data_fork_length = @_io.read_u4be
    @resource_fork_length = @_io.read_u4be
    @creation_date = @_io.read_u4be
    @modification_date = @_io.read_u4be
    @get_info_length = @_io.read_u2be
    @finder_flags_0_7 = @_io.read_u1
    @signature = @_io.read_u4be
    @fd_script = @_io.read_u1
    @fd_x_flags = @_io.read_u1
    @padding = @_io.read_bytes(8)
    @total_unpacked_files_length = @_io.read_u4be
    @second_header_length = @_io.read_u2be
    if second_header_length != 0
      @second_header = @_io.read_bytes(second_header_length)
    end
    if second_header_length != 0
      @second_header_padding = @_io.read_bytes((128 - (second_header_length % 128)))
    end
    @macbinary_version = @_io.read_u1
    @min_macbinary_version_needed = @_io.read_u1
    @crc_check = @_io.read_u4be
    if data_fork_length != 0
      @data_fork = @_io.read_bytes(data_fork_length)
    end
    if (data_fork_length % 128) != 0
      @data_fork_padding = @_io.read_bytes((128 - (data_fork_length % 128)))
    end
    @resource_fork = @_io.read_bytes(resource_fork_length)
    @resource_fork_padding = @_io.read_bytes((128 - (resource_fork_length % 128)))
    self
  end
  attr_reader :old_section_header
  attr_reader :filename_length
  attr_reader :filename
  attr_reader :filename_padding
  attr_reader :file_type
  attr_reader :file_creator

  ##
  # Bit 7 - isAlias. 
  # Bit 6 - isInvisible. 
  # Bit 5 - hasBundle. 
  # Bit 4 - nameLocked. 
  # Bit 3 - isStationery. 
  # Bit 2 - hasCustomIcon. 
  # Bit 1 - reserved. 
  # Bit 0 - hasBeenInited.
  attr_reader :finder_flags_8_f
  attr_reader :zero_fill
  attr_reader :win_y_pos
  attr_reader :win_x_pos
  attr_reader :win_id
  attr_reader :protected_flag
  attr_reader :zero_fill_2
  attr_reader :data_fork_length
  attr_reader :resource_fork_length

  ##
  # seconds since Jan 1, 1904
  attr_reader :creation_date

  ##
  # seconds since Jan 1, 1904
  attr_reader :modification_date
  attr_reader :get_info_length

  ##
  # Bit 7 - hasNoInits 
  # Bit 6 - isShared 
  # Bit 5 - requiresSwitchLaunch
  # Bit 4 - ColorReserved
  # Bits 1-3 - color 
  # Bit 0 - isOnDesk
  attr_reader :finder_flags_0_7
  attr_reader :signature

  ##
  # script of file name from fdScript field of fxInfo record
  attr_reader :fd_script

  ##
  # extended finder flags from fdXFlags field of fxInfo record
  attr_reader :fd_x_flags
  attr_reader :padding
  attr_reader :total_unpacked_files_length

  ##
  # if non-zero, skip this many bytes, 
  # rounded up to the next multiple of 128.
  # This was reserved for future use, and has never been used.
  # So this value should always be 0.
  attr_reader :second_header_length
  attr_reader :second_header
  attr_reader :second_header_padding
  attr_reader :macbinary_version
  attr_reader :min_macbinary_version_needed
  attr_reader :crc_check
  attr_reader :data_fork
  attr_reader :data_fork_padding
  attr_reader :resource_fork
  attr_reader :resource_fork_padding
end
