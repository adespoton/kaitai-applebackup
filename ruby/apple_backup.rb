# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
# These computers did not come with install disks, but instead with software pre-installed
# on the hard disk, with an Apple Backup program that could be used to back the hard disk's
# contents up to 1440KB floppy disks in 1414KB files named "Backup Disk #" where # was 1 
# through the last disk needed for a full drive backup.
# These files had the Type/Creator codes of OBDa and OBBa.
# Later versions of the Performa line came with Restore CDs that contained "Restore All Software"
# and "Restore System Software" folders containing 1414KB files named "Data File #" -- where all
# the required files resided in the same folder on the CD.
# These files had the Type/Creatorcodes of OBDc and OBBa.
# Both file types are flat data files as indicated in the struct below.
# @see https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/ Source
class AppleBackup < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_backup_disk_header = @_io.read_bytes(512)
    io = Kaitai::Struct::Stream.new(@_raw_backup_disk_header)
    @backup_disk_header = BackupDiskHeaderType.new(io, self, @_root)
    @_raw_boot_blocks = @_io.read_bytes(1024)
    io = Kaitai::Struct::Stream.new(@_raw_boot_blocks)
    @boot_blocks = BootBlocksType.new(io, self, @_root)
    @_raw_file_data = @_io.read_bytes((backup_disk_header.total_size_used - 1536))
    io = Kaitai::Struct::Stream.new(@_raw_file_data)
    @file_data = FileDataSeq.new(io, self, @_root)
    self
  end
  class FileDataType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_version = @_io.read_u2be
      @file_magic = @_io.ensure_fixed_contents([82, 76, 68, 87].pack('C*'))
      @file_starts_on_disk = @_io.read_u2be
      @backup_start_time = @_io.read_u4be
      @header_offset = @_io.read_u4be
      @file_name_len = @_io.read_u1
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("ascii")
      @file_name_padding = @_io.read_bytes((31 - file_name_len))
      @file_part = @_io.read_u2be
      @folder_flags = @_io.read_u1
      @validity_flag = @_io.read_u1
      if folder_flags == 0
        @_raw_finfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_finfo_data)
        @finfo_data = FinfoDataStruct.new(io, self, @_root)
      end
      if folder_flags == 0
        @_raw_fxinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_fxinfo_data)
        @fxinfo_data = FxinfoDataStruct.new(io, self, @_root)
      end
      if folder_flags != 0
        @_raw_dinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_dinfo_data)
        @dinfo_data = DinfoDataStruct.new(io, self, @_root)
      end
      if folder_flags != 0
        @_raw_dxinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_dxinfo_data)
        @dxinfo_data = DxinfoDataStruct.new(io, self, @_root)
      end
      @file_attributes = @_io.read_u1
      @file_reserved = @_io.read_u1
      @creation_date = @_io.read_u4be
      @modification_date = @_io.read_u4be
      @data_fork_length = @_io.read_u4be
      @resource_fork_length = @_io.read_u4be
      @data_fork_in_file_length = @_io.read_u4be
      @resource_fork_in_file_length = @_io.read_u4be
      @full_file_path_length = @_io.read_u2be
      @full_file_path = (@_io.read_bytes(full_file_path_length)).force_encoding("ascii")
      @data_fork = @_io.read_bytes(data_fork_in_file_length)
      @resource_fork = @_io.read_bytes(resource_fork_in_file_length)
      if  (((512 - ((((112 + data_fork_in_file_length) + resource_fork_in_file_length) + full_file_path_length) % 512)) != 512) || ((_parent._parent.backup_disk_header.disk_number - _parent._parent.backup_disk_header.total_disks) == 0)) 
        @file_padding = @_io.read_bytes((512 - ((((112 + data_fork_in_file_length) + resource_fork_in_file_length) + full_file_path_length) % 512)))
      end
      self
    end
    attr_reader :file_version
    attr_reader :file_magic
    attr_reader :file_starts_on_disk

    ##
    # Seconds since January 1, 1904 00:00:00 local time
    attr_reader :backup_start_time
    attr_reader :header_offset
    attr_reader :file_name_len
    attr_reader :file_name
    attr_reader :file_name_padding
    attr_reader :file_part
    attr_reader :folder_flags
    attr_reader :validity_flag
    attr_reader :finfo_data
    attr_reader :fxinfo_data
    attr_reader :dinfo_data
    attr_reader :dxinfo_data

    ##
    # HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
    attr_reader :file_attributes
    attr_reader :file_reserved

    ##
    # Seconds since January 1, 1904 00:00:00 local time
    attr_reader :creation_date

    ##
    # Seconds since January 1, 1904 00:00:00 local time
    attr_reader :modification_date
    attr_reader :data_fork_length
    attr_reader :resource_fork_length
    attr_reader :data_fork_in_file_length
    attr_reader :resource_fork_in_file_length
    attr_reader :full_file_path_length
    attr_reader :full_file_path
    attr_reader :data_fork
    attr_reader :resource_fork
    attr_reader :file_padding
    attr_reader :_raw_finfo_data
    attr_reader :_raw_fxinfo_data
    attr_reader :_raw_dinfo_data
    attr_reader :_raw_dxinfo_data
  end
  class FxinfoDataStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fd_icon_id = @_io.read_u2be
      @fd_unused = @_io.read_bytes(8)
      @fd_comment = @_io.read_u2be
      @fd_put_away = @_io.read_u4be
      self
    end
    attr_reader :fd_icon_id
    attr_reader :fd_unused
    attr_reader :fd_comment
    attr_reader :fd_put_away
  end

  ##
  # Standard SCSI boot blocks, begins with LK, shortly followed by
  # System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
  # Theyare written to the hard drive by the restore program when the 
  # System Folder is blessed as it's restored.
  # @see http://mcosre.sourceforge.net/docs/boot_blocks.html Source
  class BootBlocksType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sig_bytes = @_io.ensure_fixed_contents([76, 75].pack('C*'))
      @branch_code = @_io.read_u4be
      @boot_block_flags = @_io.read_u1
      @boot_block_version_number = @_io.read_u1
      @secondary_sound_and_video_pages = @_io.read_u2be
      @len_system_name = @_io.read_u1
      @system_name = (@_io.read_bytes(len_system_name)).force_encoding("ascii")
      @system_name_padding = @_io.read_bytes((15 - len_system_name))
      @len_finder_name = @_io.read_u1
      @finder_name = (@_io.read_bytes(len_finder_name)).force_encoding("ascii")
      @finder_name_padding = @_io.read_bytes((15 - len_finder_name))
      @len_debugger_name = @_io.read_u1
      @debugger_name = (@_io.read_bytes(len_debugger_name)).force_encoding("ascii")
      @debugger_name_padding = @_io.read_bytes((15 - len_debugger_name))
      @len_dissassembler_name = @_io.read_u1
      @dissassembler_name = (@_io.read_bytes(len_dissassembler_name)).force_encoding("ascii")
      @dissassembler_name_padding = @_io.read_bytes((15 - len_dissassembler_name))
      @len_start_up_screen_name = @_io.read_u1
      @start_up_screen_name = (@_io.read_bytes(len_start_up_screen_name)).force_encoding("ascii")
      @start_up_screen_name_padding = @_io.read_bytes((15 - len_start_up_screen_name))
      @len_boot_up_name = @_io.read_u1
      @boot_up_name = (@_io.read_bytes(len_boot_up_name)).force_encoding("ascii")
      @boot_up_name_padding = @_io.read_bytes((15 - len_boot_up_name))
      @len_clipboard_name = @_io.read_u1
      @clipboard_name = (@_io.read_bytes(len_clipboard_name)).force_encoding("ascii")
      @clipboard_name_padding = @_io.read_bytes((15 - len_clipboard_name))
      @max_files = @_io.read_u2be
      @event_queue_size = @_io.read_u2be
      @heap_on_128k_mac = @_io.read_u4be
      @heap_on_256k_mac = @_io.read_u4be
      @heap_on_512k_mac = @_io.read_u4be
      @boot_code = @_io.read_bytes(886)
      self
    end
    attr_reader :sig_bytes
    attr_reader :branch_code
    attr_reader :boot_block_flags
    attr_reader :boot_block_version_number
    attr_reader :secondary_sound_and_video_pages
    attr_reader :len_system_name
    attr_reader :system_name
    attr_reader :system_name_padding
    attr_reader :len_finder_name
    attr_reader :finder_name
    attr_reader :finder_name_padding
    attr_reader :len_debugger_name
    attr_reader :debugger_name
    attr_reader :debugger_name_padding
    attr_reader :len_dissassembler_name
    attr_reader :dissassembler_name
    attr_reader :dissassembler_name_padding
    attr_reader :len_start_up_screen_name
    attr_reader :start_up_screen_name
    attr_reader :start_up_screen_name_padding
    attr_reader :len_boot_up_name
    attr_reader :boot_up_name
    attr_reader :boot_up_name_padding
    attr_reader :len_clipboard_name
    attr_reader :clipboard_name
    attr_reader :clipboard_name_padding
    attr_reader :max_files
    attr_reader :event_queue_size
    attr_reader :heap_on_128k_mac
    attr_reader :heap_on_256k_mac
    attr_reader :heap_on_512k_mac
    attr_reader :boot_code
  end
  class DinfoDataStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fr_rect = @_io.read_bytes(8)
      @fr_flags = @_io.read_u2be
      @fr_location = @_io.read_u4be
      @fr_view = @_io.read_u2be
      self
    end
    attr_reader :fr_rect
    attr_reader :fr_flags
    attr_reader :fr_location
    attr_reader :fr_view
  end
  class DxinfoDataStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fr_scroll = @_io.read_u4be
      @fr_open_chain = @_io.read_u4be
      @fr_unused = @_io.read_bytes(2)
      @fr_comment = @_io.read_u2be
      @fr_put_away = @_io.read_u4be
      self
    end
    attr_reader :fr_scroll
    attr_reader :fr_open_chain
    attr_reader :fr_unused
    attr_reader :fr_comment
    attr_reader :fr_put_away
  end
  class FileDataSeq < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_data_contents = []
      i = 0
      while not @_io.eof?
        @file_data_contents << FileDataType.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :file_data_contents
  end
  class FinfoDataStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fd_type = (@_io.read_bytes(4)).force_encoding("ascii")
      @fd_creator = (@_io.read_bytes(4)).force_encoding("ascii")
      @fd_flags_0_7 = @_io.read_u1
      @fd_flags_8_f = @_io.read_u1
      @fd_location = @_io.read_u4be
      @fd_fldr = @_io.read_u2be
      self
    end
    attr_reader :fd_type
    attr_reader :fd_creator
    attr_reader :fd_flags_0_7
    attr_reader :fd_flags_8_f
    attr_reader :fd_location
    attr_reader :fd_fldr
  end
  class BackupDiskHeaderType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2be
      @magic = @_io.ensure_fixed_contents([67, 77, 87, 76].pack('C*'))
      @disk_number = @_io.read_u2be
      @total_disks = @_io.read_u2be
      @backup_start_time = @_io.read_u4be
      @backup_start_time2 = @_io.read_u4be
      @hard_drive_name_len = @_io.read_u1
      @hard_drive_name = (@_io.read_bytes(hard_drive_name_len)).force_encoding("ascii")
      @hard_drive_name_padding = @_io.read_bytes((31 - hard_drive_name_len))
      @total_file_size = @_io.read_u4be
      @total_size_used = @_io.read_u4be
      @bdh_padding = @_io.read_bytes(454)
      self
    end

    ##
    # valid up to and including version 0x0104
    attr_reader :version

    ##
    # identifies this file as an Apple Backup file
    attr_reader :magic

    ##
    # value is between 1 and total_disks
    attr_reader :disk_number

    ##
    # total number of disks used for the backup
    attr_reader :total_disks

    ##
    # Seconds since January 1, 1904 00:00:00 local time
    attr_reader :backup_start_time

    ##
    # duplicate of backup_start_time
    attr_reader :backup_start_time2

    ##
    # Length of the name of the hard drive that was backed up
    attr_reader :hard_drive_name_len

    ##
    # Name of the hard drive that was backed up
    attr_reader :hard_drive_name

    ##
    # Remainder of Pascal Str31 address space
    attr_reader :hard_drive_name_padding

    ##
    # Total size of this restore file; typically 0x161800
    attr_reader :total_file_size

    ##
    # Number of bytes actually used in this restore file; usually 0x161800 except for last file
    attr_reader :total_size_used

    ##
    # 0x00 padding to end of header
    attr_reader :bdh_padding
  end
  attr_reader :backup_disk_header
  attr_reader :boot_blocks
  attr_reader :file_data
  attr_reader :_raw_backup_disk_header
  attr_reader :_raw_boot_blocks
  attr_reader :_raw_file_data
end
