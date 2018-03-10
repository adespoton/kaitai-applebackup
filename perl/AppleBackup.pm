# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package AppleBackup;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_raw_backup_disk_header} = $self->{_io}->read_bytes(512);
    my $io__raw_backup_disk_header = IO::KaitaiStruct::Stream->new($self->{_raw_backup_disk_header});
    $self->{backup_disk_header} = AppleBackup::BackupDiskHeaderType->new($io__raw_backup_disk_header, $self, $self->{_root});
    $self->{_raw_boot_blocks} = $self->{_io}->read_bytes(1024);
    my $io__raw_boot_blocks = IO::KaitaiStruct::Stream->new($self->{_raw_boot_blocks});
    $self->{boot_blocks} = AppleBackup::BootBlocksType->new($io__raw_boot_blocks, $self, $self->{_root});
    $self->{_raw_file_data} = $self->{_io}->read_bytes(($self->backup_disk_header()->total_size_used() - 1536));
    my $io__raw_file_data = IO::KaitaiStruct::Stream->new($self->{_raw_file_data});
    $self->{file_data} = AppleBackup::FileDataSeq->new($io__raw_file_data, $self, $self->{_root});
}

sub backup_disk_header {
    my ($self) = @_;
    return $self->{backup_disk_header};
}

sub boot_blocks {
    my ($self) = @_;
    return $self->{boot_blocks};
}

sub file_data {
    my ($self) = @_;
    return $self->{file_data};
}

sub _raw_backup_disk_header {
    my ($self) = @_;
    return $self->{_raw_backup_disk_header};
}

sub _raw_boot_blocks {
    my ($self) = @_;
    return $self->{_raw_boot_blocks};
}

sub _raw_file_data {
    my ($self) = @_;
    return $self->{_raw_file_data};
}

########################################################################
package AppleBackup::FileDataType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_version} = $self->{_io}->read_u2be();
    $self->{file_magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (82, 76, 68, 87)));
    $self->{file_starts_on_disk} = $self->{_io}->read_u2be();
    $self->{backup_start_time} = $self->{_io}->read_u4be();
    $self->{header_offset} = $self->{_io}->read_u4be();
    $self->{file_name_len} = $self->{_io}->read_u1();
    $self->{file_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->file_name_len()));
    $self->{file_name_padding} = $self->{_io}->read_bytes((31 - $self->file_name_len()));
    $self->{file_part} = $self->{_io}->read_u2be();
    $self->{folder_flags} = $self->{_io}->read_u1();
    $self->{validity_flag} = $self->{_io}->read_u1();
    if ($self->folder_flags() == 0) {
        $self->{_raw_finfo_data} = $self->{_io}->read_bytes(16);
        my $io__raw_finfo_data = IO::KaitaiStruct::Stream->new($self->{_raw_finfo_data});
        $self->{finfo_data} = AppleBackup::FinfoDataStruct->new($io__raw_finfo_data, $self, $self->{_root});
    }
    if ($self->folder_flags() == 0) {
        $self->{_raw_fxinfo_data} = $self->{_io}->read_bytes(16);
        my $io__raw_fxinfo_data = IO::KaitaiStruct::Stream->new($self->{_raw_fxinfo_data});
        $self->{fxinfo_data} = AppleBackup::FxinfoDataStruct->new($io__raw_fxinfo_data, $self, $self->{_root});
    }
    if ($self->folder_flags() != 0) {
        $self->{_raw_dinfo_data} = $self->{_io}->read_bytes(16);
        my $io__raw_dinfo_data = IO::KaitaiStruct::Stream->new($self->{_raw_dinfo_data});
        $self->{dinfo_data} = AppleBackup::DinfoDataStruct->new($io__raw_dinfo_data, $self, $self->{_root});
    }
    if ($self->folder_flags() != 0) {
        $self->{_raw_dxinfo_data} = $self->{_io}->read_bytes(16);
        my $io__raw_dxinfo_data = IO::KaitaiStruct::Stream->new($self->{_raw_dxinfo_data});
        $self->{dxinfo_data} = AppleBackup::DxinfoDataStruct->new($io__raw_dxinfo_data, $self, $self->{_root});
    }
    $self->{file_attributes} = $self->{_io}->read_u1();
    $self->{file_reserved} = $self->{_io}->read_u1();
    $self->{creation_date} = $self->{_io}->read_u4be();
    $self->{modification_date} = $self->{_io}->read_u4be();
    $self->{data_fork_length} = $self->{_io}->read_u4be();
    $self->{resource_fork_length} = $self->{_io}->read_u4be();
    $self->{data_fork_in_file_length} = $self->{_io}->read_u4be();
    $self->{resource_fork_in_file_length} = $self->{_io}->read_u4be();
    $self->{full_file_path_length} = $self->{_io}->read_u2be();
    $self->{full_file_path} = Encode::decode("ascii", $self->{_io}->read_bytes($self->full_file_path_length()));
    $self->{data_fork} = $self->{_io}->read_bytes($self->data_fork_in_file_length());
    $self->{resource_fork} = $self->{_io}->read_bytes($self->resource_fork_in_file_length());
    if ( (((512 - ((((112 + $self->data_fork_in_file_length()) + $self->resource_fork_in_file_length()) + $self->full_file_path_length()) % 512)) != 512) || (($self->_parent()->_parent()->backup_disk_header()->disk_number() - $self->_parent()->_parent()->backup_disk_header()->total_disks()) == 0)) ) {
        $self->{file_padding} = $self->{_io}->read_bytes((512 - ((((112 + $self->data_fork_in_file_length()) + $self->resource_fork_in_file_length()) + $self->full_file_path_length()) % 512)));
    }
}

sub file_version {
    my ($self) = @_;
    return $self->{file_version};
}

sub file_magic {
    my ($self) = @_;
    return $self->{file_magic};
}

sub file_starts_on_disk {
    my ($self) = @_;
    return $self->{file_starts_on_disk};
}

sub backup_start_time {
    my ($self) = @_;
    return $self->{backup_start_time};
}

sub header_offset {
    my ($self) = @_;
    return $self->{header_offset};
}

sub file_name_len {
    my ($self) = @_;
    return $self->{file_name_len};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub file_name_padding {
    my ($self) = @_;
    return $self->{file_name_padding};
}

sub file_part {
    my ($self) = @_;
    return $self->{file_part};
}

sub folder_flags {
    my ($self) = @_;
    return $self->{folder_flags};
}

sub validity_flag {
    my ($self) = @_;
    return $self->{validity_flag};
}

sub finfo_data {
    my ($self) = @_;
    return $self->{finfo_data};
}

sub fxinfo_data {
    my ($self) = @_;
    return $self->{fxinfo_data};
}

sub dinfo_data {
    my ($self) = @_;
    return $self->{dinfo_data};
}

sub dxinfo_data {
    my ($self) = @_;
    return $self->{dxinfo_data};
}

sub file_attributes {
    my ($self) = @_;
    return $self->{file_attributes};
}

sub file_reserved {
    my ($self) = @_;
    return $self->{file_reserved};
}

sub creation_date {
    my ($self) = @_;
    return $self->{creation_date};
}

sub modification_date {
    my ($self) = @_;
    return $self->{modification_date};
}

sub data_fork_length {
    my ($self) = @_;
    return $self->{data_fork_length};
}

sub resource_fork_length {
    my ($self) = @_;
    return $self->{resource_fork_length};
}

sub data_fork_in_file_length {
    my ($self) = @_;
    return $self->{data_fork_in_file_length};
}

sub resource_fork_in_file_length {
    my ($self) = @_;
    return $self->{resource_fork_in_file_length};
}

sub full_file_path_length {
    my ($self) = @_;
    return $self->{full_file_path_length};
}

sub full_file_path {
    my ($self) = @_;
    return $self->{full_file_path};
}

sub data_fork {
    my ($self) = @_;
    return $self->{data_fork};
}

sub resource_fork {
    my ($self) = @_;
    return $self->{resource_fork};
}

sub file_padding {
    my ($self) = @_;
    return $self->{file_padding};
}

sub _raw_finfo_data {
    my ($self) = @_;
    return $self->{_raw_finfo_data};
}

sub _raw_fxinfo_data {
    my ($self) = @_;
    return $self->{_raw_fxinfo_data};
}

sub _raw_dinfo_data {
    my ($self) = @_;
    return $self->{_raw_dinfo_data};
}

sub _raw_dxinfo_data {
    my ($self) = @_;
    return $self->{_raw_dxinfo_data};
}

########################################################################
package AppleBackup::FxinfoDataStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{fd_icon_id} = $self->{_io}->read_u2be();
    $self->{fd_unused} = $self->{_io}->read_bytes(8);
    $self->{fd_comment} = $self->{_io}->read_u2be();
    $self->{fd_put_away} = $self->{_io}->read_u4be();
}

sub fd_icon_id {
    my ($self) = @_;
    return $self->{fd_icon_id};
}

sub fd_unused {
    my ($self) = @_;
    return $self->{fd_unused};
}

sub fd_comment {
    my ($self) = @_;
    return $self->{fd_comment};
}

sub fd_put_away {
    my ($self) = @_;
    return $self->{fd_put_away};
}

########################################################################
package AppleBackup::BootBlocksType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sig_bytes} = $self->{_io}->ensure_fixed_contents(pack('C*', (76, 75)));
    $self->{branch_code} = $self->{_io}->read_u4be();
    $self->{boot_block_flags} = $self->{_io}->read_u1();
    $self->{boot_block_version_number} = $self->{_io}->read_u1();
    $self->{secondary_sound_and_video_pages} = $self->{_io}->read_u2be();
    $self->{len_system_name} = $self->{_io}->read_u1();
    $self->{system_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_system_name()));
    $self->{system_name_padding} = $self->{_io}->read_bytes((15 - $self->len_system_name()));
    $self->{len_finder_name} = $self->{_io}->read_u1();
    $self->{finder_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_finder_name()));
    $self->{finder_name_padding} = $self->{_io}->read_bytes((15 - $self->len_finder_name()));
    $self->{len_debugger_name} = $self->{_io}->read_u1();
    $self->{debugger_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_debugger_name()));
    $self->{debugger_name_padding} = $self->{_io}->read_bytes((15 - $self->len_debugger_name()));
    $self->{len_dissassembler_name} = $self->{_io}->read_u1();
    $self->{dissassembler_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_dissassembler_name()));
    $self->{dissassembler_name_padding} = $self->{_io}->read_bytes((15 - $self->len_dissassembler_name()));
    $self->{len_start_up_screen_name} = $self->{_io}->read_u1();
    $self->{start_up_screen_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_start_up_screen_name()));
    $self->{start_up_screen_name_padding} = $self->{_io}->read_bytes((15 - $self->len_start_up_screen_name()));
    $self->{len_boot_up_name} = $self->{_io}->read_u1();
    $self->{boot_up_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_boot_up_name()));
    $self->{boot_up_name_padding} = $self->{_io}->read_bytes((15 - $self->len_boot_up_name()));
    $self->{len_clipboard_name} = $self->{_io}->read_u1();
    $self->{clipboard_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->len_clipboard_name()));
    $self->{clipboard_name_padding} = $self->{_io}->read_bytes((15 - $self->len_clipboard_name()));
    $self->{max_files} = $self->{_io}->read_u2be();
    $self->{event_queue_size} = $self->{_io}->read_u2be();
    $self->{heap_on_128k_mac} = $self->{_io}->read_u4be();
    $self->{heap_on_256k_mac} = $self->{_io}->read_u4be();
    $self->{heap_on_512k_mac} = $self->{_io}->read_u4be();
    $self->{boot_code} = $self->{_io}->read_bytes(886);
}

sub sig_bytes {
    my ($self) = @_;
    return $self->{sig_bytes};
}

sub branch_code {
    my ($self) = @_;
    return $self->{branch_code};
}

sub boot_block_flags {
    my ($self) = @_;
    return $self->{boot_block_flags};
}

sub boot_block_version_number {
    my ($self) = @_;
    return $self->{boot_block_version_number};
}

sub secondary_sound_and_video_pages {
    my ($self) = @_;
    return $self->{secondary_sound_and_video_pages};
}

sub len_system_name {
    my ($self) = @_;
    return $self->{len_system_name};
}

sub system_name {
    my ($self) = @_;
    return $self->{system_name};
}

sub system_name_padding {
    my ($self) = @_;
    return $self->{system_name_padding};
}

sub len_finder_name {
    my ($self) = @_;
    return $self->{len_finder_name};
}

sub finder_name {
    my ($self) = @_;
    return $self->{finder_name};
}

sub finder_name_padding {
    my ($self) = @_;
    return $self->{finder_name_padding};
}

sub len_debugger_name {
    my ($self) = @_;
    return $self->{len_debugger_name};
}

sub debugger_name {
    my ($self) = @_;
    return $self->{debugger_name};
}

sub debugger_name_padding {
    my ($self) = @_;
    return $self->{debugger_name_padding};
}

sub len_dissassembler_name {
    my ($self) = @_;
    return $self->{len_dissassembler_name};
}

sub dissassembler_name {
    my ($self) = @_;
    return $self->{dissassembler_name};
}

sub dissassembler_name_padding {
    my ($self) = @_;
    return $self->{dissassembler_name_padding};
}

sub len_start_up_screen_name {
    my ($self) = @_;
    return $self->{len_start_up_screen_name};
}

sub start_up_screen_name {
    my ($self) = @_;
    return $self->{start_up_screen_name};
}

sub start_up_screen_name_padding {
    my ($self) = @_;
    return $self->{start_up_screen_name_padding};
}

sub len_boot_up_name {
    my ($self) = @_;
    return $self->{len_boot_up_name};
}

sub boot_up_name {
    my ($self) = @_;
    return $self->{boot_up_name};
}

sub boot_up_name_padding {
    my ($self) = @_;
    return $self->{boot_up_name_padding};
}

sub len_clipboard_name {
    my ($self) = @_;
    return $self->{len_clipboard_name};
}

sub clipboard_name {
    my ($self) = @_;
    return $self->{clipboard_name};
}

sub clipboard_name_padding {
    my ($self) = @_;
    return $self->{clipboard_name_padding};
}

sub max_files {
    my ($self) = @_;
    return $self->{max_files};
}

sub event_queue_size {
    my ($self) = @_;
    return $self->{event_queue_size};
}

sub heap_on_128k_mac {
    my ($self) = @_;
    return $self->{heap_on_128k_mac};
}

sub heap_on_256k_mac {
    my ($self) = @_;
    return $self->{heap_on_256k_mac};
}

sub heap_on_512k_mac {
    my ($self) = @_;
    return $self->{heap_on_512k_mac};
}

sub boot_code {
    my ($self) = @_;
    return $self->{boot_code};
}

########################################################################
package AppleBackup::DinfoDataStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{fr_rect} = $self->{_io}->read_bytes(8);
    $self->{fr_flags} = $self->{_io}->read_u2be();
    $self->{fr_location} = $self->{_io}->read_u4be();
    $self->{fr_view} = $self->{_io}->read_u2be();
}

sub fr_rect {
    my ($self) = @_;
    return $self->{fr_rect};
}

sub fr_flags {
    my ($self) = @_;
    return $self->{fr_flags};
}

sub fr_location {
    my ($self) = @_;
    return $self->{fr_location};
}

sub fr_view {
    my ($self) = @_;
    return $self->{fr_view};
}

########################################################################
package AppleBackup::DxinfoDataStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{fr_scroll} = $self->{_io}->read_u4be();
    $self->{fr_open_chain} = $self->{_io}->read_u4be();
    $self->{fr_unused} = $self->{_io}->read_bytes(2);
    $self->{fr_comment} = $self->{_io}->read_u2be();
    $self->{fr_put_away} = $self->{_io}->read_u4be();
}

sub fr_scroll {
    my ($self) = @_;
    return $self->{fr_scroll};
}

sub fr_open_chain {
    my ($self) = @_;
    return $self->{fr_open_chain};
}

sub fr_unused {
    my ($self) = @_;
    return $self->{fr_unused};
}

sub fr_comment {
    my ($self) = @_;
    return $self->{fr_comment};
}

sub fr_put_away {
    my ($self) = @_;
    return $self->{fr_put_away};
}

########################################################################
package AppleBackup::FileDataSeq;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_data_contents} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{file_data_contents}}, AppleBackup::FileDataType->new($self->{_io}, $self, $self->{_root});
    }
}

sub file_data_contents {
    my ($self) = @_;
    return $self->{file_data_contents};
}

########################################################################
package AppleBackup::FinfoDataStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{fd_type} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{fd_creator} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{fd_flags_0_7} = $self->{_io}->read_u1();
    $self->{fd_flags_8_f} = $self->{_io}->read_u1();
    $self->{fd_location} = $self->{_io}->read_u4be();
    $self->{fd_fldr} = $self->{_io}->read_u2be();
}

sub fd_type {
    my ($self) = @_;
    return $self->{fd_type};
}

sub fd_creator {
    my ($self) = @_;
    return $self->{fd_creator};
}

sub fd_flags_0_7 {
    my ($self) = @_;
    return $self->{fd_flags_0_7};
}

sub fd_flags_8_f {
    my ($self) = @_;
    return $self->{fd_flags_8_f};
}

sub fd_location {
    my ($self) = @_;
    return $self->{fd_location};
}

sub fd_fldr {
    my ($self) = @_;
    return $self->{fd_fldr};
}

########################################################################
package AppleBackup::BackupDiskHeaderType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_u2be();
    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (67, 77, 87, 76)));
    $self->{disk_number} = $self->{_io}->read_u2be();
    $self->{total_disks} = $self->{_io}->read_u2be();
    $self->{backup_start_time} = $self->{_io}->read_u4be();
    $self->{backup_start_time2} = $self->{_io}->read_u4be();
    $self->{hard_drive_name_len} = $self->{_io}->read_u1();
    $self->{hard_drive_name} = Encode::decode("ascii", $self->{_io}->read_bytes($self->hard_drive_name_len()));
    $self->{hard_drive_name_padding} = $self->{_io}->read_bytes((31 - $self->hard_drive_name_len()));
    $self->{total_file_size} = $self->{_io}->read_u4be();
    $self->{total_size_used} = $self->{_io}->read_u4be();
    $self->{bdh_padding} = $self->{_io}->read_bytes(454);
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub disk_number {
    my ($self) = @_;
    return $self->{disk_number};
}

sub total_disks {
    my ($self) = @_;
    return $self->{total_disks};
}

sub backup_start_time {
    my ($self) = @_;
    return $self->{backup_start_time};
}

sub backup_start_time2 {
    my ($self) = @_;
    return $self->{backup_start_time2};
}

sub hard_drive_name_len {
    my ($self) = @_;
    return $self->{hard_drive_name_len};
}

sub hard_drive_name {
    my ($self) = @_;
    return $self->{hard_drive_name};
}

sub hard_drive_name_padding {
    my ($self) = @_;
    return $self->{hard_drive_name_padding};
}

sub total_file_size {
    my ($self) = @_;
    return $self->{total_file_size};
}

sub total_size_used {
    my ($self) = @_;
    return $self->{total_size_used};
}

sub bdh_padding {
    my ($self) = @_;
    return $self->{bdh_padding};
}

1;
