#ifndef APPLE_BACKUP_H_
#define APPLE_BACKUP_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * In the early- to mid- 1990s, Apple produced their Macintosh Performa line of computers.
 * These computers did not come with install disks, but instead with software pre-installed
 * on the hard disk, with an Apple Backup program that could be used to back the hard disk's
 * contents up to 1440KB floppy disks in 1414KB files named "Backup Disk #" where # was 1 
 * through the last disk needed for a full drive backup.
 * These files had the Type/Creator codes of OBDa and OBBa.
 * Later versions of the Performa line came with Restore CDs that contained "Restore All Software"
 * and "Restore System Software" folders containing 1414KB files named "Data File #" -- where all
 * the required files resided in the same folder on the CD.
 * These files had the Type/Creatorcodes of OBDc and OBBa.
 * Both file types are flat data files as indicated in the struct below.
 * \sa Source
 */

class apple_backup_t : public kaitai::kstruct {

public:
    class file_data_type_t;
    class fxinfo_data_struct_t;
    class boot_blocks_type_t;
    class dinfo_data_struct_t;
    class dxinfo_data_struct_t;
    class file_data_seq_t;
    class finfo_data_struct_t;
    class backup_disk_header_type_t;

    apple_backup_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, apple_backup_t* p__root = 0);

private:
    void _read();

public:
    ~apple_backup_t();

    class file_data_type_t : public kaitai::kstruct {

    public:

        file_data_type_t(kaitai::kstream* p__io, apple_backup_t::file_data_seq_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_data_type_t();

    private:
        uint16_t m_file_version;
        std::string m_file_magic;
        uint16_t m_file_starts_on_disk;
        uint32_t m_backup_start_time;
        uint32_t m_header_offset;
        uint8_t m_file_name_len;
        std::string m_file_name;
        std::string m_file_name_padding;
        uint16_t m_file_part;
        uint8_t m_folder_flags;
        uint8_t m_validity_flag;
        finfo_data_struct_t* m_finfo_data;
        bool n_finfo_data;

    public:
        bool _is_null_finfo_data() { finfo_data(); return n_finfo_data; };

    private:
        fxinfo_data_struct_t* m_fxinfo_data;
        bool n_fxinfo_data;

    public:
        bool _is_null_fxinfo_data() { fxinfo_data(); return n_fxinfo_data; };

    private:
        dinfo_data_struct_t* m_dinfo_data;
        bool n_dinfo_data;

    public:
        bool _is_null_dinfo_data() { dinfo_data(); return n_dinfo_data; };

    private:
        dxinfo_data_struct_t* m_dxinfo_data;
        bool n_dxinfo_data;

    public:
        bool _is_null_dxinfo_data() { dxinfo_data(); return n_dxinfo_data; };

    private:
        uint8_t m_file_attributes;
        uint8_t m_file_reserved;
        uint32_t m_creation_date;
        uint32_t m_modification_date;
        uint32_t m_data_fork_length;
        uint32_t m_resource_fork_length;
        uint32_t m_data_fork_in_file_length;
        uint32_t m_resource_fork_in_file_length;
        uint16_t m_full_file_path_length;
        std::string m_full_file_path;
        std::string m_data_fork;
        std::string m_resource_fork;
        std::string m_file_padding;
        bool n_file_padding;

    public:
        bool _is_null_file_padding() { file_padding(); return n_file_padding; };

    private:
        apple_backup_t* m__root;
        apple_backup_t::file_data_seq_t* m__parent;
        std::string m__raw_finfo_data;
        kaitai::kstream* m__io__raw_finfo_data;
        std::string m__raw_fxinfo_data;
        kaitai::kstream* m__io__raw_fxinfo_data;
        std::string m__raw_dinfo_data;
        kaitai::kstream* m__io__raw_dinfo_data;
        std::string m__raw_dxinfo_data;
        kaitai::kstream* m__io__raw_dxinfo_data;

    public:
        uint16_t file_version() const { return m_file_version; }
        std::string file_magic() const { return m_file_magic; }
        uint16_t file_starts_on_disk() const { return m_file_starts_on_disk; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        uint32_t backup_start_time() const { return m_backup_start_time; }
        uint32_t header_offset() const { return m_header_offset; }
        uint8_t file_name_len() const { return m_file_name_len; }
        std::string file_name() const { return m_file_name; }
        std::string file_name_padding() const { return m_file_name_padding; }
        uint16_t file_part() const { return m_file_part; }
        uint8_t folder_flags() const { return m_folder_flags; }
        uint8_t validity_flag() const { return m_validity_flag; }
        finfo_data_struct_t* finfo_data() const { return m_finfo_data; }
        fxinfo_data_struct_t* fxinfo_data() const { return m_fxinfo_data; }
        dinfo_data_struct_t* dinfo_data() const { return m_dinfo_data; }
        dxinfo_data_struct_t* dxinfo_data() const { return m_dxinfo_data; }

        /**
         * HFileInfo.ioFlAttrib or DirInfo.ioFlAttrib from Mac Toolbox
         */
        uint8_t file_attributes() const { return m_file_attributes; }
        uint8_t file_reserved() const { return m_file_reserved; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        uint32_t creation_date() const { return m_creation_date; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        uint32_t modification_date() const { return m_modification_date; }
        uint32_t data_fork_length() const { return m_data_fork_length; }
        uint32_t resource_fork_length() const { return m_resource_fork_length; }
        uint32_t data_fork_in_file_length() const { return m_data_fork_in_file_length; }
        uint32_t resource_fork_in_file_length() const { return m_resource_fork_in_file_length; }
        uint16_t full_file_path_length() const { return m_full_file_path_length; }
        std::string full_file_path() const { return m_full_file_path; }
        std::string data_fork() const { return m_data_fork; }
        std::string resource_fork() const { return m_resource_fork; }
        std::string file_padding() const { return m_file_padding; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t::file_data_seq_t* _parent() const { return m__parent; }
        std::string _raw_finfo_data() const { return m__raw_finfo_data; }
        kaitai::kstream* _io__raw_finfo_data() const { return m__io__raw_finfo_data; }
        std::string _raw_fxinfo_data() const { return m__raw_fxinfo_data; }
        kaitai::kstream* _io__raw_fxinfo_data() const { return m__io__raw_fxinfo_data; }
        std::string _raw_dinfo_data() const { return m__raw_dinfo_data; }
        kaitai::kstream* _io__raw_dinfo_data() const { return m__io__raw_dinfo_data; }
        std::string _raw_dxinfo_data() const { return m__raw_dxinfo_data; }
        kaitai::kstream* _io__raw_dxinfo_data() const { return m__io__raw_dxinfo_data; }
    };

    class fxinfo_data_struct_t : public kaitai::kstruct {

    public:

        fxinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~fxinfo_data_struct_t();

    private:
        uint16_t m_fd_icon_id;
        std::string m_fd_unused;
        uint16_t m_fd_comment;
        uint32_t m_fd_put_away;
        apple_backup_t* m__root;
        apple_backup_t::file_data_type_t* m__parent;

    public:
        uint16_t fd_icon_id() const { return m_fd_icon_id; }
        std::string fd_unused() const { return m_fd_unused; }
        uint16_t fd_comment() const { return m_fd_comment; }
        uint32_t fd_put_away() const { return m_fd_put_away; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t::file_data_type_t* _parent() const { return m__parent; }
    };

    /**
     * Standard SCSI boot blocks, begins with LK, shortly followed by
     * System, Finder, MacsBug, Dissasembler, StartUpScreen, Finder and Clipboard.
     * Theyare written to the hard drive by the restore program when the 
     * System Folder is blessed as it's restored.
     * \sa Source
     */

    class boot_blocks_type_t : public kaitai::kstruct {

    public:

        boot_blocks_type_t(kaitai::kstream* p__io, apple_backup_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~boot_blocks_type_t();

    private:
        std::string m_sig_bytes;
        uint32_t m_branch_code;
        uint8_t m_boot_block_flags;
        uint8_t m_boot_block_version_number;
        uint16_t m_secondary_sound_and_video_pages;
        uint8_t m_len_system_name;
        std::string m_system_name;
        std::string m_system_name_padding;
        uint8_t m_len_finder_name;
        std::string m_finder_name;
        std::string m_finder_name_padding;
        uint8_t m_len_debugger_name;
        std::string m_debugger_name;
        std::string m_debugger_name_padding;
        uint8_t m_len_dissassembler_name;
        std::string m_dissassembler_name;
        std::string m_dissassembler_name_padding;
        uint8_t m_len_start_up_screen_name;
        std::string m_start_up_screen_name;
        std::string m_start_up_screen_name_padding;
        uint8_t m_len_boot_up_name;
        std::string m_boot_up_name;
        std::string m_boot_up_name_padding;
        uint8_t m_len_clipboard_name;
        std::string m_clipboard_name;
        std::string m_clipboard_name_padding;
        uint16_t m_max_files;
        uint16_t m_event_queue_size;
        uint32_t m_heap_on_128k_mac;
        uint32_t m_heap_on_256k_mac;
        uint32_t m_heap_on_512k_mac;
        std::string m_boot_code;
        apple_backup_t* m__root;
        apple_backup_t* m__parent;

    public:
        std::string sig_bytes() const { return m_sig_bytes; }
        uint32_t branch_code() const { return m_branch_code; }
        uint8_t boot_block_flags() const { return m_boot_block_flags; }
        uint8_t boot_block_version_number() const { return m_boot_block_version_number; }
        uint16_t secondary_sound_and_video_pages() const { return m_secondary_sound_and_video_pages; }
        uint8_t len_system_name() const { return m_len_system_name; }
        std::string system_name() const { return m_system_name; }
        std::string system_name_padding() const { return m_system_name_padding; }
        uint8_t len_finder_name() const { return m_len_finder_name; }
        std::string finder_name() const { return m_finder_name; }
        std::string finder_name_padding() const { return m_finder_name_padding; }
        uint8_t len_debugger_name() const { return m_len_debugger_name; }
        std::string debugger_name() const { return m_debugger_name; }
        std::string debugger_name_padding() const { return m_debugger_name_padding; }
        uint8_t len_dissassembler_name() const { return m_len_dissassembler_name; }
        std::string dissassembler_name() const { return m_dissassembler_name; }
        std::string dissassembler_name_padding() const { return m_dissassembler_name_padding; }
        uint8_t len_start_up_screen_name() const { return m_len_start_up_screen_name; }
        std::string start_up_screen_name() const { return m_start_up_screen_name; }
        std::string start_up_screen_name_padding() const { return m_start_up_screen_name_padding; }
        uint8_t len_boot_up_name() const { return m_len_boot_up_name; }
        std::string boot_up_name() const { return m_boot_up_name; }
        std::string boot_up_name_padding() const { return m_boot_up_name_padding; }
        uint8_t len_clipboard_name() const { return m_len_clipboard_name; }
        std::string clipboard_name() const { return m_clipboard_name; }
        std::string clipboard_name_padding() const { return m_clipboard_name_padding; }
        uint16_t max_files() const { return m_max_files; }
        uint16_t event_queue_size() const { return m_event_queue_size; }
        uint32_t heap_on_128k_mac() const { return m_heap_on_128k_mac; }
        uint32_t heap_on_256k_mac() const { return m_heap_on_256k_mac; }
        uint32_t heap_on_512k_mac() const { return m_heap_on_512k_mac; }
        std::string boot_code() const { return m_boot_code; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t* _parent() const { return m__parent; }
    };

    class dinfo_data_struct_t : public kaitai::kstruct {

    public:

        dinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~dinfo_data_struct_t();

    private:
        std::string m_fr_rect;
        uint16_t m_fr_flags;
        uint32_t m_fr_location;
        uint16_t m_fr_view;
        apple_backup_t* m__root;
        apple_backup_t::file_data_type_t* m__parent;

    public:
        std::string fr_rect() const { return m_fr_rect; }
        uint16_t fr_flags() const { return m_fr_flags; }
        uint32_t fr_location() const { return m_fr_location; }
        uint16_t fr_view() const { return m_fr_view; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t::file_data_type_t* _parent() const { return m__parent; }
    };

    class dxinfo_data_struct_t : public kaitai::kstruct {

    public:

        dxinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~dxinfo_data_struct_t();

    private:
        uint32_t m_fr_scroll;
        uint32_t m_fr_open_chain;
        std::string m_fr_unused;
        uint16_t m_fr_comment;
        uint32_t m_fr_put_away;
        apple_backup_t* m__root;
        apple_backup_t::file_data_type_t* m__parent;

    public:
        uint32_t fr_scroll() const { return m_fr_scroll; }
        uint32_t fr_open_chain() const { return m_fr_open_chain; }
        std::string fr_unused() const { return m_fr_unused; }
        uint16_t fr_comment() const { return m_fr_comment; }
        uint32_t fr_put_away() const { return m_fr_put_away; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t::file_data_type_t* _parent() const { return m__parent; }
    };

    class file_data_seq_t : public kaitai::kstruct {

    public:

        file_data_seq_t(kaitai::kstream* p__io, apple_backup_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_data_seq_t();

    private:
        std::vector<file_data_type_t*>* m_file_data_contents;
        apple_backup_t* m__root;
        apple_backup_t* m__parent;

    public:
        std::vector<file_data_type_t*>* file_data_contents() const { return m_file_data_contents; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t* _parent() const { return m__parent; }
    };

    class finfo_data_struct_t : public kaitai::kstruct {

    public:

        finfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~finfo_data_struct_t();

    private:
        std::string m_fd_type;
        std::string m_fd_creator;
        uint8_t m_fd_flags_0_7;
        uint8_t m_fd_flags_8_f;
        uint32_t m_fd_location;
        uint16_t m_fd_fldr;
        apple_backup_t* m__root;
        apple_backup_t::file_data_type_t* m__parent;

    public:
        std::string fd_type() const { return m_fd_type; }
        std::string fd_creator() const { return m_fd_creator; }
        uint8_t fd_flags_0_7() const { return m_fd_flags_0_7; }
        uint8_t fd_flags_8_f() const { return m_fd_flags_8_f; }
        uint32_t fd_location() const { return m_fd_location; }
        uint16_t fd_fldr() const { return m_fd_fldr; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t::file_data_type_t* _parent() const { return m__parent; }
    };

    class backup_disk_header_type_t : public kaitai::kstruct {

    public:

        backup_disk_header_type_t(kaitai::kstream* p__io, apple_backup_t* p__parent = 0, apple_backup_t* p__root = 0);

    private:
        void _read();

    public:
        ~backup_disk_header_type_t();

    private:
        uint16_t m_version;
        std::string m_magic;
        uint16_t m_disk_number;
        uint16_t m_total_disks;
        uint32_t m_backup_start_time;
        uint32_t m_backup_start_time2;
        uint8_t m_hard_drive_name_len;
        std::string m_hard_drive_name;
        std::string m_hard_drive_name_padding;
        uint32_t m_total_file_size;
        uint32_t m_total_size_used;
        std::string m_bdh_padding;
        apple_backup_t* m__root;
        apple_backup_t* m__parent;

    public:

        /**
         * valid up to and including version 0x0104
         */
        uint16_t version() const { return m_version; }

        /**
         * identifies this file as an Apple Backup file
         */
        std::string magic() const { return m_magic; }

        /**
         * value is between 1 and total_disks
         */
        uint16_t disk_number() const { return m_disk_number; }

        /**
         * total number of disks used for the backup
         */
        uint16_t total_disks() const { return m_total_disks; }

        /**
         * Seconds since January 1, 1904 00:00:00 local time
         */
        uint32_t backup_start_time() const { return m_backup_start_time; }

        /**
         * duplicate of backup_start_time
         */
        uint32_t backup_start_time2() const { return m_backup_start_time2; }

        /**
         * Length of the name of the hard drive that was backed up
         */
        uint8_t hard_drive_name_len() const { return m_hard_drive_name_len; }

        /**
         * Name of the hard drive that was backed up
         */
        std::string hard_drive_name() const { return m_hard_drive_name; }

        /**
         * Remainder of Pascal Str31 address space
         */
        std::string hard_drive_name_padding() const { return m_hard_drive_name_padding; }

        /**
         * Total size of this restore file; typically 0x161800
         */
        uint32_t total_file_size() const { return m_total_file_size; }

        /**
         * Number of bytes actually used in this restore file; usually 0x161800 except for last file
         */
        uint32_t total_size_used() const { return m_total_size_used; }

        /**
         * 0x00 padding to end of header
         */
        std::string bdh_padding() const { return m_bdh_padding; }
        apple_backup_t* _root() const { return m__root; }
        apple_backup_t* _parent() const { return m__parent; }
    };

private:
    backup_disk_header_type_t* m_backup_disk_header;
    boot_blocks_type_t* m_boot_blocks;
    file_data_seq_t* m_file_data;
    apple_backup_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_backup_disk_header;
    kaitai::kstream* m__io__raw_backup_disk_header;
    std::string m__raw_boot_blocks;
    kaitai::kstream* m__io__raw_boot_blocks;
    std::string m__raw_file_data;
    kaitai::kstream* m__io__raw_file_data;

public:
    backup_disk_header_type_t* backup_disk_header() const { return m_backup_disk_header; }
    boot_blocks_type_t* boot_blocks() const { return m_boot_blocks; }
    file_data_seq_t* file_data() const { return m_file_data; }
    apple_backup_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_backup_disk_header() const { return m__raw_backup_disk_header; }
    kaitai::kstream* _io__raw_backup_disk_header() const { return m__io__raw_backup_disk_header; }
    std::string _raw_boot_blocks() const { return m__raw_boot_blocks; }
    kaitai::kstream* _io__raw_boot_blocks() const { return m__io__raw_boot_blocks; }
    std::string _raw_file_data() const { return m__raw_file_data; }
    kaitai::kstream* _io__raw_file_data() const { return m__io__raw_file_data; }
};

#endif  // APPLE_BACKUP_H_
