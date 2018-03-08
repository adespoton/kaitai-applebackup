meta:
  id: macbinary
  title: MacBinary III flattened Macintosh file
  file-extension: bin
  license: MIT
  endian: be
doc: |
    The binary format consists of a 128-byte header containing all the information necessary 
    to reproduce the document's directory entry on the receiving Macintosh; 
    followed by the document's Data Fork (if it has one), padded with nulls to 
    a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
    (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
    are contained in the header.
doc-ref: http://web.archive.org/web/20050305044255/http://www.lazerware.com:80/formats/macbinary/macbinary_iii.html
seq:
  - id: old_section_header
    contents: [0]
  - id: filename_length
    type: u1
  - id: filename
    type: str
    encoding: ascii
    size: filename_length
  - id: filename_padding
    size: (63 - filename_length)
  - id: file_type
    type: str
    encoding: ascii
    size: 4
  - id: file_creator
    type: str
    encoding: ascii
    size: 4
  - id: finder_flags_8_e
    doc: |
      Bit 7 - isAlias. 
      Bit 6 - isInvisible. 
      Bit 5 - hasBundle. 
      Bit 4 - nameLocked. 
      Bit 3 - isStationery. 
      Bit 2 - hasCustomIcon. 
      Bit 1 - reserved. 
      Bit 0 - hasBeenInited.
    size: 1
  - id: zero_fill
    contents: [0]
  - id: win_y_pos
    type: u2
  - id: win_x_pos
    type: u2
  - id: win_id
    type: u2
  - id: protected_flag
    type: u1
  - id: zero_fill_2
    contents: [0]
  - id: data_fork_length
    type: u4
  - id: resource_fork_length
    type: u4
  - id: creation_date
    doc: seconds since Jan 1, 1904
    type: u4
  - id: modification_date
    doc: seconds since Jan 1, 1904
    type: u4
  - id: get_info_length
    type: u2
  - id: finder_flags_0_7
    doc: |
      Bit 7 - hasNoInits 
      Bit 6 - isShared 
      Bit 5 - requiresSwitchLaunch
      Bit 4 - ColorReserved
      Bits 1-3 - color 
      Bit 0 - isOnDesk
    type: u1
  - id: signature
    type: u4
  - id: fd_script
    doc: script of file name from fdScript field of fxInfo record
    type: u1
  - id: fd_x_flags
    doc: extended finder flags from fdXFlags field of fxInfo record
    type: u1
  - id: padding
    size: 8
  - id: total_unpacked_files_length
    type: u4
  - id: second_header_length
    doc: |
      if non-zero, skip this many bytes, 
      rounded up to the next multiple of 128.
      This was reserved for future use, and has never been used.
      So this value should always be 0.
    type: u2
  - id: second_header
    size: second_header_length
    if: second_header_length != 0
  - id: second_header_padding
    size: (128 - (second_header_length % 128))
    if: second_header_length != 0
  - id: macbinary_version
    type: u1
  - id: min_macbinary_version_needed
    type: u1
  - id: crc_check
    type: u4
  - id: data_fork
    size: data_fork_length
    if: data_fork_length != 0
  - id: data_fork_padding
    size: (128 - (data_fork_length % 128))
    if: (data_fork_length % 128) != 0
  - id: resource_fork
    size: resource_fork_length
  - id: resource_fork_padding
    size: (128 - (resource_fork_length % 128))
