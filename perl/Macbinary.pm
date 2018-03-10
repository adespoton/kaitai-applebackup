# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Macbinary;

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

    $self->{old_section_header} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
    $self->{filename_length} = $self->{_io}->read_u1();
    $self->{filename} = Encode::decode("ascii", $self->{_io}->read_bytes($self->filename_length()));
    $self->{filename_padding} = $self->{_io}->read_bytes((63 - $self->filename_length()));
    $self->{file_type} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{file_creator} = Encode::decode("ascii", $self->{_io}->read_bytes(4));
    $self->{finder_flags_8_f} = $self->{_io}->read_bytes(1);
    $self->{zero_fill} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
    $self->{win_y_pos} = $self->{_io}->read_u2be();
    $self->{win_x_pos} = $self->{_io}->read_u2be();
    $self->{win_id} = $self->{_io}->read_u2be();
    $self->{protected_flag} = $self->{_io}->read_u1();
    $self->{zero_fill_2} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
    $self->{data_fork_length} = $self->{_io}->read_u4be();
    $self->{resource_fork_length} = $self->{_io}->read_u4be();
    $self->{creation_date} = $self->{_io}->read_u4be();
    $self->{modification_date} = $self->{_io}->read_u4be();
    $self->{get_info_length} = $self->{_io}->read_u2be();
    $self->{finder_flags_0_7} = $self->{_io}->read_u1();
    $self->{signature} = $self->{_io}->read_u4be();
    $self->{fd_script} = $self->{_io}->read_u1();
    $self->{fd_x_flags} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(8);
    $self->{total_unpacked_files_length} = $self->{_io}->read_u4be();
    $self->{second_header_length} = $self->{_io}->read_u2be();
    if ($self->second_header_length() != 0) {
        $self->{second_header} = $self->{_io}->read_bytes($self->second_header_length());
    }
    if ($self->second_header_length() != 0) {
        $self->{second_header_padding} = $self->{_io}->read_bytes((128 - ($self->second_header_length() % 128)));
    }
    $self->{macbinary_version} = $self->{_io}->read_u1();
    $self->{min_macbinary_version_needed} = $self->{_io}->read_u1();
    $self->{crc_check} = $self->{_io}->read_u4be();
    if ($self->data_fork_length() != 0) {
        $self->{data_fork} = $self->{_io}->read_bytes($self->data_fork_length());
    }
    if (($self->data_fork_length() % 128) != 0) {
        $self->{data_fork_padding} = $self->{_io}->read_bytes((128 - ($self->data_fork_length() % 128)));
    }
    $self->{resource_fork} = $self->{_io}->read_bytes($self->resource_fork_length());
    $self->{resource_fork_padding} = $self->{_io}->read_bytes((128 - ($self->resource_fork_length() % 128)));
}

sub old_section_header {
    my ($self) = @_;
    return $self->{old_section_header};
}

sub filename_length {
    my ($self) = @_;
    return $self->{filename_length};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub filename_padding {
    my ($self) = @_;
    return $self->{filename_padding};
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub file_creator {
    my ($self) = @_;
    return $self->{file_creator};
}

sub finder_flags_8_f {
    my ($self) = @_;
    return $self->{finder_flags_8_f};
}

sub zero_fill {
    my ($self) = @_;
    return $self->{zero_fill};
}

sub win_y_pos {
    my ($self) = @_;
    return $self->{win_y_pos};
}

sub win_x_pos {
    my ($self) = @_;
    return $self->{win_x_pos};
}

sub win_id {
    my ($self) = @_;
    return $self->{win_id};
}

sub protected_flag {
    my ($self) = @_;
    return $self->{protected_flag};
}

sub zero_fill_2 {
    my ($self) = @_;
    return $self->{zero_fill_2};
}

sub data_fork_length {
    my ($self) = @_;
    return $self->{data_fork_length};
}

sub resource_fork_length {
    my ($self) = @_;
    return $self->{resource_fork_length};
}

sub creation_date {
    my ($self) = @_;
    return $self->{creation_date};
}

sub modification_date {
    my ($self) = @_;
    return $self->{modification_date};
}

sub get_info_length {
    my ($self) = @_;
    return $self->{get_info_length};
}

sub finder_flags_0_7 {
    my ($self) = @_;
    return $self->{finder_flags_0_7};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub fd_script {
    my ($self) = @_;
    return $self->{fd_script};
}

sub fd_x_flags {
    my ($self) = @_;
    return $self->{fd_x_flags};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub total_unpacked_files_length {
    my ($self) = @_;
    return $self->{total_unpacked_files_length};
}

sub second_header_length {
    my ($self) = @_;
    return $self->{second_header_length};
}

sub second_header {
    my ($self) = @_;
    return $self->{second_header};
}

sub second_header_padding {
    my ($self) = @_;
    return $self->{second_header_padding};
}

sub macbinary_version {
    my ($self) = @_;
    return $self->{macbinary_version};
}

sub min_macbinary_version_needed {
    my ($self) = @_;
    return $self->{min_macbinary_version_needed};
}

sub crc_check {
    my ($self) = @_;
    return $self->{crc_check};
}

sub data_fork {
    my ($self) = @_;
    return $self->{data_fork};
}

sub data_fork_padding {
    my ($self) = @_;
    return $self->{data_fork_padding};
}

sub resource_fork {
    my ($self) = @_;
    return $self->{resource_fork};
}

sub resource_fork_padding {
    my ($self) = @_;
    return $self->{resource_fork_padding};
}

1;
