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
  attr_reader :_debug
  SEQ_FIELDS = ["backup_disk_header", "boot_blocks", "file_data"]
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    @_debug = {}
  end

  def _read
    (@_debug['backup_disk_header'] ||= {})[:start] = @_io.pos
    @_raw_backup_disk_header = @_io.read_bytes(512)
    io = Kaitai::Struct::Stream.new(@_raw_backup_disk_header)
    @backup_disk_header = BackupDiskHeaderType.new(io, self, @_root)
    @backup_disk_header._read
    (@_debug['backup_disk_header'] ||= {})[:end] = @_io.pos
    (@_debug['boot_blocks'] ||= {})[:start] = @_io.pos
    @_raw_boot_blocks = @_io.read_bytes(1024)
    io = Kaitai::Struct::Stream.new(@_raw_boot_blocks)
    @boot_blocks = BootBlocksType.new(io, self, @_root)
    @boot_blocks._read
    (@_debug['boot_blocks'] ||= {})[:end] = @_io.pos
    (@_debug['file_data'] ||= {})[:start] = @_io.pos
    @_raw_file_data = @_io.read_bytes((backup_disk_header.total_size_used - 1536))
    io = Kaitai::Struct::Stream.new(@_raw_file_data)
    @file_data = FileDataSeq.new(io, self, @_root)
    @file_data._read
    (@_debug['file_data'] ||= {})[:end] = @_io.pos
    self
  end
  class FileDataType < Kaitai::Struct::Struct
    attr_reader :_debug
    SEQ_FIELDS = ["file_version", "file_magic", "file_starts_on_disk", "backup_start_time", "header_offset", "file_name_len", "file_name", "file_name_padding", "file_part", "folder_flags", "validity_flag", "finfo_data", "fxinfo_data", "dinfo_data", "dxinfo_data", "file_attributes", "file_reserved", "creation_date", "modification_date", "data_fork_length", "resource_fork_length", "data_fork_in_file_length", "resource_fork_in_file_length", "full_file_path_length", "full_file_path", "data_fork", "resource_fork", "file_padding"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['file_version'] ||= {})[:start] = @_io.pos
      @file_version = @_io.read_u2be
      (@_debug['file_version'] ||= {})[:end] = @_io.pos
      (@_debug['file_magic'] ||= {})[:start] = @_io.pos
      @file_magic = @_io.ensure_fixed_contents([82, 76, 68, 87].pack('C*'))
      (@_debug['file_magic'] ||= {})[:end] = @_io.pos
      (@_debug['file_starts_on_disk'] ||= {})[:start] = @_io.pos
      @file_starts_on_disk = @_io.read_u2be
      (@_debug['file_starts_on_disk'] ||= {})[:end] = @_io.pos
      (@_debug['backup_start_time'] ||= {})[:start] = @_io.pos
      @backup_start_time = @_io.read_u4be
      (@_debug['backup_start_time'] ||= {})[:end] = @_io.pos
      (@_debug['header_offset'] ||= {})[:start] = @_io.pos
      @header_offset = @_io.read_u4be
      (@_debug['header_offset'] ||= {})[:end] = @_io.pos
      (@_debug['file_name_len'] ||= {})[:start] = @_io.pos
      @file_name_len = @_io.read_u1
      (@_debug['file_name_len'] ||= {})[:end] = @_io.pos
      (@_debug['file_name'] ||= {})[:start] = @_io.pos
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("ascii")
      (@_debug['file_name'] ||= {})[:end] = @_io.pos
      (@_debug['file_name_padding'] ||= {})[:start] = @_io.pos
      @file_name_padding = @_io.read_bytes((31 - file_name_len))
      (@_debug['file_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['file_part'] ||= {})[:start] = @_io.pos
      @file_part = @_io.read_u2be
      (@_debug['file_part'] ||= {})[:end] = @_io.pos
      (@_debug['folder_flags'] ||= {})[:start] = @_io.pos
      @folder_flags = @_io.read_u1
      (@_debug['folder_flags'] ||= {})[:end] = @_io.pos
      (@_debug['validity_flag'] ||= {})[:start] = @_io.pos
      @validity_flag = @_io.read_u1
      (@_debug['validity_flag'] ||= {})[:end] = @_io.pos
      if folder_flags == 0
        (@_debug['finfo_data'] ||= {})[:start] = @_io.pos
        @_raw_finfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_finfo_data)
        @finfo_data = FinfoDataStruct.new(io, self, @_root)
        @finfo_data._read
        (@_debug['finfo_data'] ||= {})[:end] = @_io.pos
      end
      if folder_flags == 0
        (@_debug['fxinfo_data'] ||= {})[:start] = @_io.pos
        @_raw_fxinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_fxinfo_data)
        @fxinfo_data = FxinfoDataStruct.new(io, self, @_root)
        @fxinfo_data._read
        (@_debug['fxinfo_data'] ||= {})[:end] = @_io.pos
      end
      if folder_flags != 0
        (@_debug['dinfo_data'] ||= {})[:start] = @_io.pos
        @_raw_dinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_dinfo_data)
        @dinfo_data = DinfoDataStruct.new(io, self, @_root)
        @dinfo_data._read
        (@_debug['dinfo_data'] ||= {})[:end] = @_io.pos
      end
      if folder_flags != 0
        (@_debug['dxinfo_data'] ||= {})[:start] = @_io.pos
        @_raw_dxinfo_data = @_io.read_bytes(16)
        io = Kaitai::Struct::Stream.new(@_raw_dxinfo_data)
        @dxinfo_data = DxinfoDataStruct.new(io, self, @_root)
        @dxinfo_data._read
        (@_debug['dxinfo_data'] ||= {})[:end] = @_io.pos
      end
      (@_debug['file_attributes'] ||= {})[:start] = @_io.pos
      @file_attributes = @_io.read_u1
      (@_debug['file_attributes'] ||= {})[:end] = @_io.pos
      (@_debug['file_reserved'] ||= {})[:start] = @_io.pos
      @file_reserved = @_io.read_u1
      (@_debug['file_reserved'] ||= {})[:end] = @_io.pos
      (@_debug['creation_date'] ||= {})[:start] = @_io.pos
      @creation_date = @_io.read_u4be
      (@_debug['creation_date'] ||= {})[:end] = @_io.pos
      (@_debug['modification_date'] ||= {})[:start] = @_io.pos
      @modification_date = @_io.read_u4be
      (@_debug['modification_date'] ||= {})[:end] = @_io.pos
      (@_debug['data_fork_length'] ||= {})[:start] = @_io.pos
      @data_fork_length = @_io.read_u4be
      (@_debug['data_fork_length'] ||= {})[:end] = @_io.pos
      (@_debug['resource_fork_length'] ||= {})[:start] = @_io.pos
      @resource_fork_length = @_io.read_u4be
      (@_debug['resource_fork_length'] ||= {})[:end] = @_io.pos
      (@_debug['data_fork_in_file_length'] ||= {})[:start] = @_io.pos
      @data_fork_in_file_length = @_io.read_u4be
      (@_debug['data_fork_in_file_length'] ||= {})[:end] = @_io.pos
      (@_debug['resource_fork_in_file_length'] ||= {})[:start] = @_io.pos
      @resource_fork_in_file_length = @_io.read_u4be
      (@_debug['resource_fork_in_file_length'] ||= {})[:end] = @_io.pos
      (@_debug['full_file_path_length'] ||= {})[:start] = @_io.pos
      @full_file_path_length = @_io.read_u2be
      (@_debug['full_file_path_length'] ||= {})[:end] = @_io.pos
      (@_debug['full_file_path'] ||= {})[:start] = @_io.pos
      @full_file_path = (@_io.read_bytes(full_file_path_length)).force_encoding("ascii")
      (@_debug['full_file_path'] ||= {})[:end] = @_io.pos
      (@_debug['data_fork'] ||= {})[:start] = @_io.pos
      @data_fork = @_io.read_bytes(data_fork_in_file_length)
      (@_debug['data_fork'] ||= {})[:end] = @_io.pos
      (@_debug['resource_fork'] ||= {})[:start] = @_io.pos
      @resource_fork = @_io.read_bytes(resource_fork_in_file_length)
      (@_debug['resource_fork'] ||= {})[:end] = @_io.pos
      if  (((512 - ((((112 + data_fork_in_file_length) + resource_fork_in_file_length) + full_file_path_length) % 512)) != 512) || ((_parent._parent.backup_disk_header.disk_number - _parent._parent.backup_disk_header.total_disks) == 0)) 
        (@_debug['file_padding'] ||= {})[:start] = @_io.pos
        @file_padding = @_io.read_bytes((512 - ((((112 + data_fork_in_file_length) + resource_fork_in_file_length) + full_file_path_length) % 512)))
        (@_debug['file_padding'] ||= {})[:end] = @_io.pos
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
    attr_reader :_debug
    SEQ_FIELDS = ["fd_icon_id", "fd_unused", "fd_comment", "fd_put_away"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['fd_icon_id'] ||= {})[:start] = @_io.pos
      @fd_icon_id = @_io.read_u2be
      (@_debug['fd_icon_id'] ||= {})[:end] = @_io.pos
      (@_debug['fd_unused'] ||= {})[:start] = @_io.pos
      @fd_unused = @_io.read_bytes(8)
      (@_debug['fd_unused'] ||= {})[:end] = @_io.pos
      (@_debug['fd_comment'] ||= {})[:start] = @_io.pos
      @fd_comment = @_io.read_u2be
      (@_debug['fd_comment'] ||= {})[:end] = @_io.pos
      (@_debug['fd_put_away'] ||= {})[:start] = @_io.pos
      @fd_put_away = @_io.read_u4be
      (@_debug['fd_put_away'] ||= {})[:end] = @_io.pos
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
    attr_reader :_debug
    SEQ_FIELDS = ["sig_bytes", "branch_code", "boot_block_flags", "boot_block_version_number", "secondary_sound_and_video_pages", "len_system_name", "system_name", "system_name_padding", "len_finder_name", "finder_name", "finder_name_padding", "len_debugger_name", "debugger_name", "debugger_name_padding", "len_dissassembler_name", "dissassembler_name", "dissassembler_name_padding", "len_start_up_screen_name", "start_up_screen_name", "start_up_screen_name_padding", "len_boot_up_name", "boot_up_name", "boot_up_name_padding", "len_clipboard_name", "clipboard_name", "clipboard_name_padding", "max_files", "event_queue_size", "heap_on_128k_mac", "heap_on_256k_mac", "heap_on_512k_mac", "boot_code"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['sig_bytes'] ||= {})[:start] = @_io.pos
      @sig_bytes = @_io.ensure_fixed_contents([76, 75].pack('C*'))
      (@_debug['sig_bytes'] ||= {})[:end] = @_io.pos
      (@_debug['branch_code'] ||= {})[:start] = @_io.pos
      @branch_code = @_io.read_u4be
      (@_debug['branch_code'] ||= {})[:end] = @_io.pos
      (@_debug['boot_block_flags'] ||= {})[:start] = @_io.pos
      @boot_block_flags = @_io.read_u1
      (@_debug['boot_block_flags'] ||= {})[:end] = @_io.pos
      (@_debug['boot_block_version_number'] ||= {})[:start] = @_io.pos
      @boot_block_version_number = @_io.read_u1
      (@_debug['boot_block_version_number'] ||= {})[:end] = @_io.pos
      (@_debug['secondary_sound_and_video_pages'] ||= {})[:start] = @_io.pos
      @secondary_sound_and_video_pages = @_io.read_u2be
      (@_debug['secondary_sound_and_video_pages'] ||= {})[:end] = @_io.pos
      (@_debug['len_system_name'] ||= {})[:start] = @_io.pos
      @len_system_name = @_io.read_u1
      (@_debug['len_system_name'] ||= {})[:end] = @_io.pos
      (@_debug['system_name'] ||= {})[:start] = @_io.pos
      @system_name = (@_io.read_bytes(len_system_name)).force_encoding("ascii")
      (@_debug['system_name'] ||= {})[:end] = @_io.pos
      (@_debug['system_name_padding'] ||= {})[:start] = @_io.pos
      @system_name_padding = @_io.read_bytes((15 - len_system_name))
      (@_debug['system_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_finder_name'] ||= {})[:start] = @_io.pos
      @len_finder_name = @_io.read_u1
      (@_debug['len_finder_name'] ||= {})[:end] = @_io.pos
      (@_debug['finder_name'] ||= {})[:start] = @_io.pos
      @finder_name = (@_io.read_bytes(len_finder_name)).force_encoding("ascii")
      (@_debug['finder_name'] ||= {})[:end] = @_io.pos
      (@_debug['finder_name_padding'] ||= {})[:start] = @_io.pos
      @finder_name_padding = @_io.read_bytes((15 - len_finder_name))
      (@_debug['finder_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_debugger_name'] ||= {})[:start] = @_io.pos
      @len_debugger_name = @_io.read_u1
      (@_debug['len_debugger_name'] ||= {})[:end] = @_io.pos
      (@_debug['debugger_name'] ||= {})[:start] = @_io.pos
      @debugger_name = (@_io.read_bytes(len_debugger_name)).force_encoding("ascii")
      (@_debug['debugger_name'] ||= {})[:end] = @_io.pos
      (@_debug['debugger_name_padding'] ||= {})[:start] = @_io.pos
      @debugger_name_padding = @_io.read_bytes((15 - len_debugger_name))
      (@_debug['debugger_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_dissassembler_name'] ||= {})[:start] = @_io.pos
      @len_dissassembler_name = @_io.read_u1
      (@_debug['len_dissassembler_name'] ||= {})[:end] = @_io.pos
      (@_debug['dissassembler_name'] ||= {})[:start] = @_io.pos
      @dissassembler_name = (@_io.read_bytes(len_dissassembler_name)).force_encoding("ascii")
      (@_debug['dissassembler_name'] ||= {})[:end] = @_io.pos
      (@_debug['dissassembler_name_padding'] ||= {})[:start] = @_io.pos
      @dissassembler_name_padding = @_io.read_bytes((15 - len_dissassembler_name))
      (@_debug['dissassembler_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_start_up_screen_name'] ||= {})[:start] = @_io.pos
      @len_start_up_screen_name = @_io.read_u1
      (@_debug['len_start_up_screen_name'] ||= {})[:end] = @_io.pos
      (@_debug['start_up_screen_name'] ||= {})[:start] = @_io.pos
      @start_up_screen_name = (@_io.read_bytes(len_start_up_screen_name)).force_encoding("ascii")
      (@_debug['start_up_screen_name'] ||= {})[:end] = @_io.pos
      (@_debug['start_up_screen_name_padding'] ||= {})[:start] = @_io.pos
      @start_up_screen_name_padding = @_io.read_bytes((15 - len_start_up_screen_name))
      (@_debug['start_up_screen_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_boot_up_name'] ||= {})[:start] = @_io.pos
      @len_boot_up_name = @_io.read_u1
      (@_debug['len_boot_up_name'] ||= {})[:end] = @_io.pos
      (@_debug['boot_up_name'] ||= {})[:start] = @_io.pos
      @boot_up_name = (@_io.read_bytes(len_boot_up_name)).force_encoding("ascii")
      (@_debug['boot_up_name'] ||= {})[:end] = @_io.pos
      (@_debug['boot_up_name_padding'] ||= {})[:start] = @_io.pos
      @boot_up_name_padding = @_io.read_bytes((15 - len_boot_up_name))
      (@_debug['boot_up_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['len_clipboard_name'] ||= {})[:start] = @_io.pos
      @len_clipboard_name = @_io.read_u1
      (@_debug['len_clipboard_name'] ||= {})[:end] = @_io.pos
      (@_debug['clipboard_name'] ||= {})[:start] = @_io.pos
      @clipboard_name = (@_io.read_bytes(len_clipboard_name)).force_encoding("ascii")
      (@_debug['clipboard_name'] ||= {})[:end] = @_io.pos
      (@_debug['clipboard_name_padding'] ||= {})[:start] = @_io.pos
      @clipboard_name_padding = @_io.read_bytes((15 - len_clipboard_name))
      (@_debug['clipboard_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['max_files'] ||= {})[:start] = @_io.pos
      @max_files = @_io.read_u2be
      (@_debug['max_files'] ||= {})[:end] = @_io.pos
      (@_debug['event_queue_size'] ||= {})[:start] = @_io.pos
      @event_queue_size = @_io.read_u2be
      (@_debug['event_queue_size'] ||= {})[:end] = @_io.pos
      (@_debug['heap_on_128k_mac'] ||= {})[:start] = @_io.pos
      @heap_on_128k_mac = @_io.read_u4be
      (@_debug['heap_on_128k_mac'] ||= {})[:end] = @_io.pos
      (@_debug['heap_on_256k_mac'] ||= {})[:start] = @_io.pos
      @heap_on_256k_mac = @_io.read_u4be
      (@_debug['heap_on_256k_mac'] ||= {})[:end] = @_io.pos
      (@_debug['heap_on_512k_mac'] ||= {})[:start] = @_io.pos
      @heap_on_512k_mac = @_io.read_u4be
      (@_debug['heap_on_512k_mac'] ||= {})[:end] = @_io.pos
      (@_debug['boot_code'] ||= {})[:start] = @_io.pos
      @boot_code = @_io.read_bytes(886)
      (@_debug['boot_code'] ||= {})[:end] = @_io.pos
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
    attr_reader :_debug
    SEQ_FIELDS = ["fr_rect", "fr_flags", "fr_location", "fr_view"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['fr_rect'] ||= {})[:start] = @_io.pos
      @fr_rect = @_io.read_bytes(8)
      (@_debug['fr_rect'] ||= {})[:end] = @_io.pos
      (@_debug['fr_flags'] ||= {})[:start] = @_io.pos
      @fr_flags = @_io.read_u2be
      (@_debug['fr_flags'] ||= {})[:end] = @_io.pos
      (@_debug['fr_location'] ||= {})[:start] = @_io.pos
      @fr_location = @_io.read_u4be
      (@_debug['fr_location'] ||= {})[:end] = @_io.pos
      (@_debug['fr_view'] ||= {})[:start] = @_io.pos
      @fr_view = @_io.read_u2be
      (@_debug['fr_view'] ||= {})[:end] = @_io.pos
      self
    end
    attr_reader :fr_rect
    attr_reader :fr_flags
    attr_reader :fr_location
    attr_reader :fr_view
  end
  class DxinfoDataStruct < Kaitai::Struct::Struct
    attr_reader :_debug
    SEQ_FIELDS = ["fr_scroll", "fr_open_chain", "fr_unused", "fr_comment", "fr_put_away"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['fr_scroll'] ||= {})[:start] = @_io.pos
      @fr_scroll = @_io.read_u4be
      (@_debug['fr_scroll'] ||= {})[:end] = @_io.pos
      (@_debug['fr_open_chain'] ||= {})[:start] = @_io.pos
      @fr_open_chain = @_io.read_u4be
      (@_debug['fr_open_chain'] ||= {})[:end] = @_io.pos
      (@_debug['fr_unused'] ||= {})[:start] = @_io.pos
      @fr_unused = @_io.read_bytes(2)
      (@_debug['fr_unused'] ||= {})[:end] = @_io.pos
      (@_debug['fr_comment'] ||= {})[:start] = @_io.pos
      @fr_comment = @_io.read_u2be
      (@_debug['fr_comment'] ||= {})[:end] = @_io.pos
      (@_debug['fr_put_away'] ||= {})[:start] = @_io.pos
      @fr_put_away = @_io.read_u4be
      (@_debug['fr_put_away'] ||= {})[:end] = @_io.pos
      self
    end
    attr_reader :fr_scroll
    attr_reader :fr_open_chain
    attr_reader :fr_unused
    attr_reader :fr_comment
    attr_reader :fr_put_away
  end
  class FileDataSeq < Kaitai::Struct::Struct
    attr_reader :_debug
    SEQ_FIELDS = ["file_data_contents"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['file_data_contents'] ||= {})[:start] = @_io.pos
      @file_data_contents = []
      i = 0
      while not @_io.eof?
        (@_debug['file_data_contents'][:arr] ||= [])[@file_data_contents.size] = {:start => @_io.pos}
        _t_file_data_contents = FileDataType.new(@_io, self, @_root)
        _t_file_data_contents._read
        @file_data_contents << _t_file_data_contents
        @_debug['file_data_contents'][:arr][@file_data_contents.size - 1][:end] = @_io.pos
        i += 1
      end
      (@_debug['file_data_contents'] ||= {})[:end] = @_io.pos
      self
    end
    attr_reader :file_data_contents
  end
  class FinfoDataStruct < Kaitai::Struct::Struct
    attr_reader :_debug
    SEQ_FIELDS = ["fd_type", "fd_creator", "fd_flags_0_7", "fd_flags_8_f", "fd_location", "fd_fldr"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['fd_type'] ||= {})[:start] = @_io.pos
      @fd_type = (@_io.read_bytes(4)).force_encoding("ascii")
      (@_debug['fd_type'] ||= {})[:end] = @_io.pos
      (@_debug['fd_creator'] ||= {})[:start] = @_io.pos
      @fd_creator = (@_io.read_bytes(4)).force_encoding("ascii")
      (@_debug['fd_creator'] ||= {})[:end] = @_io.pos
      (@_debug['fd_flags_0_7'] ||= {})[:start] = @_io.pos
      @fd_flags_0_7 = @_io.read_u1
      (@_debug['fd_flags_0_7'] ||= {})[:end] = @_io.pos
      (@_debug['fd_flags_8_f'] ||= {})[:start] = @_io.pos
      @fd_flags_8_f = @_io.read_u1
      (@_debug['fd_flags_8_f'] ||= {})[:end] = @_io.pos
      (@_debug['fd_location'] ||= {})[:start] = @_io.pos
      @fd_location = @_io.read_u4be
      (@_debug['fd_location'] ||= {})[:end] = @_io.pos
      (@_debug['fd_fldr'] ||= {})[:start] = @_io.pos
      @fd_fldr = @_io.read_u2be
      (@_debug['fd_fldr'] ||= {})[:end] = @_io.pos
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
    attr_reader :_debug
    SEQ_FIELDS = ["version", "magic", "disk_number", "total_disks", "backup_start_time", "backup_start_time2", "hard_drive_name_len", "hard_drive_name", "hard_drive_name_padding", "total_file_size", "total_size_used", "bdh_padding"]
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      @_debug = {}
    end

    def _read
      (@_debug['version'] ||= {})[:start] = @_io.pos
      @version = @_io.read_u2be
      (@_debug['version'] ||= {})[:end] = @_io.pos
      (@_debug['magic'] ||= {})[:start] = @_io.pos
      @magic = @_io.ensure_fixed_contents([67, 77, 87, 76].pack('C*'))
      (@_debug['magic'] ||= {})[:end] = @_io.pos
      (@_debug['disk_number'] ||= {})[:start] = @_io.pos
      @disk_number = @_io.read_u2be
      (@_debug['disk_number'] ||= {})[:end] = @_io.pos
      (@_debug['total_disks'] ||= {})[:start] = @_io.pos
      @total_disks = @_io.read_u2be
      (@_debug['total_disks'] ||= {})[:end] = @_io.pos
      (@_debug['backup_start_time'] ||= {})[:start] = @_io.pos
      @backup_start_time = @_io.read_u4be
      (@_debug['backup_start_time'] ||= {})[:end] = @_io.pos
      (@_debug['backup_start_time2'] ||= {})[:start] = @_io.pos
      @backup_start_time2 = @_io.read_u4be
      (@_debug['backup_start_time2'] ||= {})[:end] = @_io.pos
      (@_debug['hard_drive_name_len'] ||= {})[:start] = @_io.pos
      @hard_drive_name_len = @_io.read_u1
      (@_debug['hard_drive_name_len'] ||= {})[:end] = @_io.pos
      (@_debug['hard_drive_name'] ||= {})[:start] = @_io.pos
      @hard_drive_name = (@_io.read_bytes(hard_drive_name_len)).force_encoding("ascii")
      (@_debug['hard_drive_name'] ||= {})[:end] = @_io.pos
      (@_debug['hard_drive_name_padding'] ||= {})[:start] = @_io.pos
      @hard_drive_name_padding = @_io.read_bytes((31 - hard_drive_name_len))
      (@_debug['hard_drive_name_padding'] ||= {})[:end] = @_io.pos
      (@_debug['total_file_size'] ||= {})[:start] = @_io.pos
      @total_file_size = @_io.read_u4be
      (@_debug['total_file_size'] ||= {})[:end] = @_io.pos
      (@_debug['total_size_used'] ||= {})[:start] = @_io.pos
      @total_size_used = @_io.read_u4be
      (@_debug['total_size_used'] ||= {})[:end] = @_io.pos
      (@_debug['bdh_padding'] ||= {})[:start] = @_io.pos
      @bdh_padding = @_io.read_bytes(454)
      (@_debug['bdh_padding'] ||= {})[:end] = @_io.pos
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
