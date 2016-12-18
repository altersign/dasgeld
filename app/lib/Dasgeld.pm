package Dasgeld;

use v5.24;
use Moose;

our $VERSION = '0.01';

has config => (
    is  => 'ro',
    isa => HashRef,
);

has model => (
    is  => 'ro'
);

1;

__END__

=head1 