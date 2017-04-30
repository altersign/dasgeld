package Dasgeld;

use v5.24;
use Moose;
use namespace::autoclean;

use Dasgeld::Config;
use Dasgeld::Schema;

our $VERSION = '0.01';

has config => (
    is       => 'ro',
    isa      => 'Dasgeld::Config',
    required => 1,
    default  => sub { Dasgeld::Config->new(); }
);

has schema => (
    is         => 'ro',
    isa        => 'Dasgeld::Schema',
    lazy_build => 1
);

sub _build_schema {
    my $self = shift;
    return Dasgeld::Schema->connect( $self->config->connect_info );
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Dasgeld - Family finance accounting

=head1 SYNOPSIS

    use Dasgeld;

    Dasgeld->new();

=head1 DESCRIPTION

Base Dasgeld class.

=head1 AUTHOR

Yaroslav Polyakov

=cut
