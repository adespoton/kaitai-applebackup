// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "apple_backup.h"



apple_backup_t::apple_backup_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void apple_backup_t::_read() {
    m__raw_backup_disk_header = m__io->read_bytes(512);
    m__io__raw_backup_disk_header = new kaitai::kstream(m__raw_backup_disk_header);
    m_backup_disk_header = new backup_disk_header_type_t(m__io__raw_backup_disk_header, this, m__root);
    m__raw_boot_blocks = m__io->read_bytes(1024);
    m__io__raw_boot_blocks = new kaitai::kstream(m__raw_boot_blocks);
    m_boot_blocks = new boot_blocks_type_t(m__io__raw_boot_blocks, this, m__root);
    m__raw_file_data = m__io->read_bytes((backup_disk_header()->total_size_used() - 1536));
    m__io__raw_file_data = new kaitai::kstream(m__raw_file_data);
    m_file_data = new file_data_seq_t(m__io__raw_file_data, this, m__root);
}

apple_backup_t::~apple_backup_t() {
    delete m__io__raw_backup_disk_header;
    delete m_backup_disk_header;
    delete m__io__raw_boot_blocks;
    delete m_boot_blocks;
    delete m__io__raw_file_data;
    delete m_file_data;
}

apple_backup_t::file_data_type_t::file_data_type_t(kaitai::kstream* p__io, apple_backup_t::file_data_seq_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::file_data_type_t::_read() {
    m_file_version = m__io->read_u2be();
    m_file_magic = m__io->ensure_fixed_contents(std::string("\x52\x4C\x44\x57", 4));
    m_file_starts_on_disk = m__io->read_u2be();
    m_backup_start_time = m__io->read_u4be();
    m_header_offset = m__io->read_u4be();
    m_file_name_len = m__io->read_u1();
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(file_name_len()), std::string("ascii"));
    m_file_name_padding = m__io->read_bytes((31 - file_name_len()));
    m_file_part = m__io->read_u2be();
    m_folder_flags = m__io->read_u1();
    m_validity_flag = m__io->read_u1();
    n_finfo_data = true;
    if (folder_flags() == 0) {
        n_finfo_data = false;
        m__raw_finfo_data = m__io->read_bytes(16);
        m__io__raw_finfo_data = new kaitai::kstream(m__raw_finfo_data);
        m_finfo_data = new finfo_data_struct_t(m__io__raw_finfo_data, this, m__root);
    }
    n_fxinfo_data = true;
    if (folder_flags() == 0) {
        n_fxinfo_data = false;
        m__raw_fxinfo_data = m__io->read_bytes(16);
        m__io__raw_fxinfo_data = new kaitai::kstream(m__raw_fxinfo_data);
        m_fxinfo_data = new fxinfo_data_struct_t(m__io__raw_fxinfo_data, this, m__root);
    }
    n_dinfo_data = true;
    if (folder_flags() != 0) {
        n_dinfo_data = false;
        m__raw_dinfo_data = m__io->read_bytes(16);
        m__io__raw_dinfo_data = new kaitai::kstream(m__raw_dinfo_data);
        m_dinfo_data = new dinfo_data_struct_t(m__io__raw_dinfo_data, this, m__root);
    }
    n_dxinfo_data = true;
    if (folder_flags() != 0) {
        n_dxinfo_data = false;
        m__raw_dxinfo_data = m__io->read_bytes(16);
        m__io__raw_dxinfo_data = new kaitai::kstream(m__raw_dxinfo_data);
        m_dxinfo_data = new dxinfo_data_struct_t(m__io__raw_dxinfo_data, this, m__root);
    }
    m_file_attributes = m__io->read_u1();
    m_file_reserved = m__io->read_u1();
    m_creation_date = m__io->read_u4be();
    m_modification_date = m__io->read_u4be();
    m_data_fork_length = m__io->read_u4be();
    m_resource_fork_length = m__io->read_u4be();
    m_data_fork_in_file_length = m__io->read_u4be();
    m_resource_fork_in_file_length = m__io->read_u4be();
    m_full_file_path_length = m__io->read_u2be();
    m_full_file_path = kaitai::kstream::bytes_to_str(m__io->read_bytes(full_file_path_length()), std::string("ascii"));
    m_data_fork = m__io->read_bytes(data_fork_in_file_length());
    m_resource_fork = m__io->read_bytes(resource_fork_in_file_length());
    n_file_padding = true;
    if ( (((512 - kaitai::kstream::mod((((112 + data_fork_in_file_length()) + resource_fork_in_file_length()) + full_file_path_length()), 512)) != 512) || ((_parent()->_parent()->backup_disk_header()->disk_number() - _parent()->_parent()->backup_disk_header()->total_disks()) == 0)) ) {
        n_file_padding = false;
        m_file_padding = m__io->read_bytes((512 - kaitai::kstream::mod((((112 + data_fork_in_file_length()) + resource_fork_in_file_length()) + full_file_path_length()), 512)));
    }
}

apple_backup_t::file_data_type_t::~file_data_type_t() {
    if (!n_finfo_data) {
        delete m__io__raw_finfo_data;
        delete m_finfo_data;
    }
    if (!n_fxinfo_data) {
        delete m__io__raw_fxinfo_data;
        delete m_fxinfo_data;
    }
    if (!n_dinfo_data) {
        delete m__io__raw_dinfo_data;
        delete m_dinfo_data;
    }
    if (!n_dxinfo_data) {
        delete m__io__raw_dxinfo_data;
        delete m_dxinfo_data;
    }
    if (!n_file_padding) {
    }
}

apple_backup_t::fxinfo_data_struct_t::fxinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::fxinfo_data_struct_t::_read() {
    m_fd_icon_id = m__io->read_u2be();
    m_fd_unused = m__io->read_bytes(8);
    m_fd_comment = m__io->read_u2be();
    m_fd_put_away = m__io->read_u4be();
}

apple_backup_t::fxinfo_data_struct_t::~fxinfo_data_struct_t() {
}

apple_backup_t::boot_blocks_type_t::boot_blocks_type_t(kaitai::kstream* p__io, apple_backup_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::boot_blocks_type_t::_read() {
    m_sig_bytes = m__io->ensure_fixed_contents(std::string("\x4C\x4B", 2));
    m_branch_code = m__io->read_u4be();
    m_boot_block_flags = m__io->read_u1();
    m_boot_block_version_number = m__io->read_u1();
    m_secondary_sound_and_video_pages = m__io->read_u2be();
    m_len_system_name = m__io->read_u1();
    m_system_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_system_name()), std::string("ascii"));
    m_system_name_padding = m__io->read_bytes((15 - len_system_name()));
    m_len_finder_name = m__io->read_u1();
    m_finder_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_finder_name()), std::string("ascii"));
    m_finder_name_padding = m__io->read_bytes((15 - len_finder_name()));
    m_len_debugger_name = m__io->read_u1();
    m_debugger_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_debugger_name()), std::string("ascii"));
    m_debugger_name_padding = m__io->read_bytes((15 - len_debugger_name()));
    m_len_dissassembler_name = m__io->read_u1();
    m_dissassembler_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_dissassembler_name()), std::string("ascii"));
    m_dissassembler_name_padding = m__io->read_bytes((15 - len_dissassembler_name()));
    m_len_start_up_screen_name = m__io->read_u1();
    m_start_up_screen_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_start_up_screen_name()), std::string("ascii"));
    m_start_up_screen_name_padding = m__io->read_bytes((15 - len_start_up_screen_name()));
    m_len_boot_up_name = m__io->read_u1();
    m_boot_up_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_boot_up_name()), std::string("ascii"));
    m_boot_up_name_padding = m__io->read_bytes((15 - len_boot_up_name()));
    m_len_clipboard_name = m__io->read_u1();
    m_clipboard_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_clipboard_name()), std::string("ascii"));
    m_clipboard_name_padding = m__io->read_bytes((15 - len_clipboard_name()));
    m_max_files = m__io->read_u2be();
    m_event_queue_size = m__io->read_u2be();
    m_heap_on_128k_mac = m__io->read_u4be();
    m_heap_on_256k_mac = m__io->read_u4be();
    m_heap_on_512k_mac = m__io->read_u4be();
    m_boot_code = m__io->read_bytes(886);
}

apple_backup_t::boot_blocks_type_t::~boot_blocks_type_t() {
}

apple_backup_t::dinfo_data_struct_t::dinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::dinfo_data_struct_t::_read() {
    m_fr_rect = m__io->read_bytes(8);
    m_fr_flags = m__io->read_u2be();
    m_fr_location = m__io->read_u4be();
    m_fr_view = m__io->read_u2be();
}

apple_backup_t::dinfo_data_struct_t::~dinfo_data_struct_t() {
}

apple_backup_t::dxinfo_data_struct_t::dxinfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::dxinfo_data_struct_t::_read() {
    m_fr_scroll = m__io->read_u4be();
    m_fr_open_chain = m__io->read_u4be();
    m_fr_unused = m__io->read_bytes(2);
    m_fr_comment = m__io->read_u2be();
    m_fr_put_away = m__io->read_u4be();
}

apple_backup_t::dxinfo_data_struct_t::~dxinfo_data_struct_t() {
}

apple_backup_t::file_data_seq_t::file_data_seq_t(kaitai::kstream* p__io, apple_backup_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::file_data_seq_t::_read() {
    m_file_data_contents = new std::vector<file_data_type_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_file_data_contents->push_back(new file_data_type_t(m__io, this, m__root));
            i++;
        }
    }
}

apple_backup_t::file_data_seq_t::~file_data_seq_t() {
    for (std::vector<file_data_type_t*>::iterator it = m_file_data_contents->begin(); it != m_file_data_contents->end(); ++it) {
        delete *it;
    }
    delete m_file_data_contents;
}

apple_backup_t::finfo_data_struct_t::finfo_data_struct_t(kaitai::kstream* p__io, apple_backup_t::file_data_type_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::finfo_data_struct_t::_read() {
    m_fd_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_fd_creator = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_fd_flags_0_7 = m__io->read_u1();
    m_fd_flags_8_f = m__io->read_u1();
    m_fd_location = m__io->read_u4be();
    m_fd_fldr = m__io->read_u2be();
}

apple_backup_t::finfo_data_struct_t::~finfo_data_struct_t() {
}

apple_backup_t::backup_disk_header_type_t::backup_disk_header_type_t(kaitai::kstream* p__io, apple_backup_t* p__parent, apple_backup_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void apple_backup_t::backup_disk_header_type_t::_read() {
    m_version = m__io->read_u2be();
    m_magic = m__io->ensure_fixed_contents(std::string("\x43\x4D\x57\x4C", 4));
    m_disk_number = m__io->read_u2be();
    m_total_disks = m__io->read_u2be();
    m_backup_start_time = m__io->read_u4be();
    m_backup_start_time2 = m__io->read_u4be();
    m_hard_drive_name_len = m__io->read_u1();
    m_hard_drive_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(hard_drive_name_len()), std::string("ascii"));
    m_hard_drive_name_padding = m__io->read_bytes((31 - hard_drive_name_len()));
    m_total_file_size = m__io->read_u4be();
    m_total_size_used = m__io->read_u4be();
    m_bdh_padding = m__io->read_bytes(454);
}

apple_backup_t::backup_disk_header_type_t::~backup_disk_header_type_t() {
}
