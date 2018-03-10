// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "macbinary.h"



macbinary_t::macbinary_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, macbinary_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void macbinary_t::_read() {
    m_old_section_header = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_filename_length = m__io->read_u1();
    m_filename = kaitai::kstream::bytes_to_str(m__io->read_bytes(filename_length()), std::string("ascii"));
    m_filename_padding = m__io->read_bytes((63 - filename_length()));
    m_file_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_file_creator = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ascii"));
    m_finder_flags_8_f = m__io->read_bytes(1);
    m_zero_fill = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_win_y_pos = m__io->read_u2be();
    m_win_x_pos = m__io->read_u2be();
    m_win_id = m__io->read_u2be();
    m_protected_flag = m__io->read_u1();
    m_zero_fill_2 = m__io->ensure_fixed_contents(std::string("\x00", 1));
    m_data_fork_length = m__io->read_u4be();
    m_resource_fork_length = m__io->read_u4be();
    m_creation_date = m__io->read_u4be();
    m_modification_date = m__io->read_u4be();
    m_get_info_length = m__io->read_u2be();
    m_finder_flags_0_7 = m__io->read_u1();
    m_signature = m__io->read_u4be();
    m_fd_script = m__io->read_u1();
    m_fd_x_flags = m__io->read_u1();
    m_padding = m__io->read_bytes(8);
    m_total_unpacked_files_length = m__io->read_u4be();
    m_second_header_length = m__io->read_u2be();
    n_second_header = true;
    if (second_header_length() != 0) {
        n_second_header = false;
        m_second_header = m__io->read_bytes(second_header_length());
    }
    n_second_header_padding = true;
    if (second_header_length() != 0) {
        n_second_header_padding = false;
        m_second_header_padding = m__io->read_bytes((128 - kaitai::kstream::mod(second_header_length(), 128)));
    }
    m_macbinary_version = m__io->read_u1();
    m_min_macbinary_version_needed = m__io->read_u1();
    m_crc_check = m__io->read_u4be();
    n_data_fork = true;
    if (data_fork_length() != 0) {
        n_data_fork = false;
        m_data_fork = m__io->read_bytes(data_fork_length());
    }
    n_data_fork_padding = true;
    if (kaitai::kstream::mod(data_fork_length(), 128) != 0) {
        n_data_fork_padding = false;
        m_data_fork_padding = m__io->read_bytes((128 - kaitai::kstream::mod(data_fork_length(), 128)));
    }
    m_resource_fork = m__io->read_bytes(resource_fork_length());
    m_resource_fork_padding = m__io->read_bytes((128 - kaitai::kstream::mod(resource_fork_length(), 128)));
}

macbinary_t::~macbinary_t() {
    if (!n_second_header) {
    }
    if (!n_second_header_padding) {
    }
    if (!n_data_fork) {
    }
    if (!n_data_fork_padding) {
    }
}
