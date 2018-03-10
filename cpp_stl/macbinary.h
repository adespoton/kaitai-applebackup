#ifndef MACBINARY_H_
#define MACBINARY_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * The binary format consists of a 128-byte header containing all the information necessary 
 * to reproduce the document's directory entry on the receiving Macintosh; 
 * followed by the document's Data Fork (if it has one), padded with nulls to 
 * a multiple of 128 bytes (if necessary); followed by the document's Resource Fork 
 * (again, padded if necessary). The lengths of these forks (either or both of which may be zero) 
 * are contained in the header.
 * \sa Source
 */

class macbinary_t : public kaitai::kstruct {

public:

    macbinary_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, macbinary_t* p__root = 0);

private:
    void _read();

public:
    ~macbinary_t();

private:
    std::string m_old_section_header;
    uint8_t m_filename_length;
    std::string m_filename;
    std::string m_filename_padding;
    std::string m_file_type;
    std::string m_file_creator;
    std::string m_finder_flags_8_f;
    std::string m_zero_fill;
    uint16_t m_win_y_pos;
    uint16_t m_win_x_pos;
    uint16_t m_win_id;
    uint8_t m_protected_flag;
    std::string m_zero_fill_2;
    uint32_t m_data_fork_length;
    uint32_t m_resource_fork_length;
    uint32_t m_creation_date;
    uint32_t m_modification_date;
    uint16_t m_get_info_length;
    uint8_t m_finder_flags_0_7;
    uint32_t m_signature;
    uint8_t m_fd_script;
    uint8_t m_fd_x_flags;
    std::string m_padding;
    uint32_t m_total_unpacked_files_length;
    uint16_t m_second_header_length;
    std::string m_second_header;
    bool n_second_header;

public:
    bool _is_null_second_header() { second_header(); return n_second_header; };

private:
    std::string m_second_header_padding;
    bool n_second_header_padding;

public:
    bool _is_null_second_header_padding() { second_header_padding(); return n_second_header_padding; };

private:
    uint8_t m_macbinary_version;
    uint8_t m_min_macbinary_version_needed;
    uint32_t m_crc_check;
    std::string m_data_fork;
    bool n_data_fork;

public:
    bool _is_null_data_fork() { data_fork(); return n_data_fork; };

private:
    std::string m_data_fork_padding;
    bool n_data_fork_padding;

public:
    bool _is_null_data_fork_padding() { data_fork_padding(); return n_data_fork_padding; };

private:
    std::string m_resource_fork;
    std::string m_resource_fork_padding;
    macbinary_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string old_section_header() const { return m_old_section_header; }
    uint8_t filename_length() const { return m_filename_length; }
    std::string filename() const { return m_filename; }
    std::string filename_padding() const { return m_filename_padding; }
    std::string file_type() const { return m_file_type; }
    std::string file_creator() const { return m_file_creator; }

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
    std::string finder_flags_8_f() const { return m_finder_flags_8_f; }
    std::string zero_fill() const { return m_zero_fill; }
    uint16_t win_y_pos() const { return m_win_y_pos; }
    uint16_t win_x_pos() const { return m_win_x_pos; }
    uint16_t win_id() const { return m_win_id; }
    uint8_t protected_flag() const { return m_protected_flag; }
    std::string zero_fill_2() const { return m_zero_fill_2; }
    uint32_t data_fork_length() const { return m_data_fork_length; }
    uint32_t resource_fork_length() const { return m_resource_fork_length; }

    /**
     * seconds since Jan 1, 1904
     */
    uint32_t creation_date() const { return m_creation_date; }

    /**
     * seconds since Jan 1, 1904
     */
    uint32_t modification_date() const { return m_modification_date; }
    uint16_t get_info_length() const { return m_get_info_length; }

    /**
     * Bit 7 - hasNoInits 
     * Bit 6 - isShared 
     * Bit 5 - requiresSwitchLaunch
     * Bit 4 - ColorReserved
     * Bits 1-3 - color 
     * Bit 0 - isOnDesk
     */
    uint8_t finder_flags_0_7() const { return m_finder_flags_0_7; }
    uint32_t signature() const { return m_signature; }

    /**
     * script of file name from fdScript field of fxInfo record
     */
    uint8_t fd_script() const { return m_fd_script; }

    /**
     * extended finder flags from fdXFlags field of fxInfo record
     */
    uint8_t fd_x_flags() const { return m_fd_x_flags; }
    std::string padding() const { return m_padding; }
    uint32_t total_unpacked_files_length() const { return m_total_unpacked_files_length; }

    /**
     * if non-zero, skip this many bytes, 
     * rounded up to the next multiple of 128.
     * This was reserved for future use, and has never been used.
     * So this value should always be 0.
     */
    uint16_t second_header_length() const { return m_second_header_length; }
    std::string second_header() const { return m_second_header; }
    std::string second_header_padding() const { return m_second_header_padding; }
    uint8_t macbinary_version() const { return m_macbinary_version; }
    uint8_t min_macbinary_version_needed() const { return m_min_macbinary_version_needed; }
    uint32_t crc_check() const { return m_crc_check; }
    std::string data_fork() const { return m_data_fork; }
    std::string data_fork_padding() const { return m_data_fork_padding; }
    std::string resource_fork() const { return m_resource_fork; }
    std::string resource_fork_padding() const { return m_resource_fork_padding; }
    macbinary_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MACBINARY_H_
