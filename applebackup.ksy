meta:
  id: apple_backup
  title: Apple Backup segmented data file format
  application: Apple Backup 1.00 - 1.04
  license: MIT
  endian: be
  ks-debug: true
doc: |
  In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
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
doc-ref: https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/
seq:
  - id: backup_disk_header
    type: backup_disk_header_type
    size: 0x200
  - id: boot_blocks
    type: boot_blocks_type
    size: 0x400
  - id: file_data
    type: file_data_seq
    size: (backup_disk_header.total_size_used - 0x600)
types:
  file_data_seq:
    seq:
      - id: file_data_contents
        type: file_data_type
        repeat: eos
  backup_disk_header_type:
    seq:
      - id: version
        doc: valid up to and including version 0x0104
        type: u2
      - id: magic
        doc: identifies this file as an Apple Backup file
        contents: 'CMWL'
      - id: disk_number
        doc: value is between 1 and total_disks
        type: u2
      - id: total_disks
        doc: total number of disks used for the backup
        type: u2
      - id: backup_start_time
        doc: Seconds since January 1, 1904 00:00:00 local time
        type: u4
      - id: backup_start_time2
        doc: duplicate of backup_start_time
        type: u4
      - id: hard_drive_name_len
        doc: Length of the name of the hard drive that was backed up
        type: u1      
      - id: hard_drive_name
        doc: Name of the hard drive that was backed up
        type: str
        size: hard_drive_name_len
        encoding: ascii
      - id: hard_drive_name_padding
        doc: Remainder of Pascal Str31 address space
        size: 31 - hard_drive_name_len
      - id: total_file_size
        doc: Total size of this restore file; typically 0x161800
        type: u4
      - id: total_size_used
        doc: Number of bytes actually used in this restore file; usually 0x161800 except for last file
        type: u4
      - id: bdh_padding
        doc: 0x00 padding to end of header
        size: 0x1c6
  boot_blocks_type:
    doc: |
      Standard SCSI boot blocks, begins with LK, shortly followed by
      System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
      Theyare written to the hard drive by the restore program when the 
      System Folder is blessed as it's restored.
    doc-ref: http://mcosre.sourceforge.net/docs/boot_blocks.html
    seq:
      - id: sig_bytes
        contents: LK
      - id: branch_code
        type: u4
      - id: boot_block_flags
        type: u1
      - id: boot_block_version_number
        type: u1
      - id: secondary_sound_and_video_pages
        type: u2
      - id: len_system_name
        type: u1
      - id: system_name
        type: str
        encoding: ascii
        size: len_system_name
      - id: system_name_padding
        size: (0xf - len_system_name)
      - id: len_finder_name
        type: u1
      - id: finder_name
        type: str
        encoding: ascii
        size: len_finder_name
      - id: finder_name_padding
        size: (0xf - len_finder_name)
      - id: len_debugger_name
        type: u1
      - id: debugger_name
        type: str
        encoding: ascii
        size: len_debugger_name
      - id: debugger_name_padding
        size: (0x0f - len_debugger_name)
      - id: len_dissassembler_name
        type: u1
      - id: dissassembler_name
        type: str
        encoding: ascii
        size: len_dissassembler_name
      - id: dissassembler_name_padding
        size: (0x0f - len_dissassembler_name)
      - id: len_start_up_screen_name
        type: u1
      - id: start_up_screen_name
        type: str
        encoding: ascii
        size: len_start_up_screen_name
      - id: start_up_screen_name_padding
        size: (0x0f - len_start_up_screen_name)
      - id: len_boot_up_name
        type: u1
      - id: boot_up_name
        type: str
        encoding: ascii
        size: len_boot_up_name
      - id: boot_up_name_padding
        size: (0x0f - len_boot_up_name)
      - id: len_clipboard_name
        type: u1
      - id: clipboard_name
        type: str
        encoding: ascii
        size: len_clipboard_name
      - id: clipboard_name_padding
        size: (0x0f - len_clipboard_name)
      - id: max_files
        type: u2
      - id: event_queue_size
        type: u2
      - id: heap_on_128k_mac
        type: u4
      - id: heap_on_256k_mac
        type: u4
      - id: heap_on_512k_mac # on all machines
        type: u4
      - id: boot_code
        size: 0x376
  file_data_type:
    seq:
      - id: file_version
        #contents: [0x01, 0x00] or [0x01, 0x03]
        type: u2
      - id: file_magic
        contents: 'RLDW'
        #type: u4
      - id: file_starts_on_disk
        type: u2
      - id: backup_start_time
        doc: Seconds since January 1, 1904 00:00:00 local time
        type: u4
      - id: header_offset
        type: u4
      - id: file_name_len
        type: u1
      - id: file_name
        type: str
        size: file_name_len
        encoding: ascii
      - id: file_name_padding
        size: 31 - file_name_len
      - id: file_part
        type: u2
      - id: folder_flags
        type: u1
      - id: validity_flag
        type: u1
      - id: finfo_data
        type: finfo_data_struct
        if: folder_flags == 0
        size: 16
      - id: fxinfo_data
        type: fxinfo_data_struct
        if: folder_flags == 0
        size: 16
      - id: dinfo_data
        type: dinfo_data_struct
        if: folder_flags != 0
        size: 16
      - id: dxinfo_data
        type: dxinfo_data_struct
        if: folder_flags != 0
        size: 16
      - id: file_attributes
        doc: HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
        type: u1
      - id: file_reserved
        type: u1
      - id: creation_date
        doc: Seconds since January 1, 1904 00:00:00 local time
        type: u4
      - id: modification_date
        doc: Seconds since January 1, 1904 00:00:00 local time
        type: u4
      - id: data_fork_length
        type: u4
      - id: resource_fork_length
        type: u4
      - id: data_fork_in_file_length
        type: u4
      - id: resource_fork_in_file_length
        type: u4
      - id: full_file_path_length
        type: u2
      - id: full_file_path
        type: str
        encoding: ascii
        size: full_file_path_length
      - id: data_fork
        size: data_fork_in_file_length
      - id: resource_fork
        size: resource_fork_in_file_length
      - id: file_padding
        size: (0x200 - ((0x70 + data_fork_in_file_length + resource_fork_in_file_length + full_file_path_length) % 0x200))
        if: ((0x200 - ((0x70 + data_fork_in_file_length + resource_fork_in_file_length + full_file_path_length) % 0x200)) != 0x200) or (_parent._parent.backup_disk_header.disk_number - _parent._parent.backup_disk_header.total_disks == 0) 
  finfo_data_struct:
    seq:
      - id: fd_type
        type: str
        encoding: ascii
        size: 4
      - id: fd_creator
        type: str
        encoding: ascii
        size: 4
      - id: fd_flags_0_7
        type: u1
      - id: fd_flags_8_f
        type: u1
      - id: fd_location
        type: u4
      - id: fd_fldr
        type: u2
  fxinfo_data_struct:
    seq:
      - id: fd_icon_id
        type: u2
      - id: fd_unused
        size: 8
      - id: fd_comment
        type: u2
      - id: fd_put_away
        type: u4
  dinfo_data_struct:
    seq:
      - id: fr_rect
        size: 8
      - id: fr_flags
        type: u2
      - id: fr_location
        type: u4
      - id: fr_view
        type: u2
  dxinfo_data_struct:
    seq:
      - id: fr_scroll
        type: u4
      - id: fr_open_chain
        type: u4
      - id: fr_unused
        size: 2
      - id: fr_comment
        type: u2
      - id: fr_put_away
        type: u4
