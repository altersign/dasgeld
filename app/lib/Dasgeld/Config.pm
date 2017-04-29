package Dasgeld::Config;

use Moose;
use namespace::autoclean;

my %_config = (
    database => {
        driver => 'SQLite',
        name   => 'db/dasgeld.db',
    }
);

has get => (
    is => 'ro',
    isa => 'HashRef',
    default => sub {\%_config},
);

sub connect_info {
    my ($self) = @_;

    my $db_config = $self->get->{database};
    return "dbi:$db_config->{driver}:$db_config->{name}";
}

__PACKAGE__->meta->make_immutable;

1;
