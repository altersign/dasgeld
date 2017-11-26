package Dasgeld::Config;

use Moose;
use namespace::autoclean;

my %_config = (
    database => {
        driver => 'SQLite',
        name   => 'db/dasgeld.db',
        SQLite => {
            sqlite_unicode => 1,
            RaiseError     => 1,
            on_connect_do  => "PRAGMA foreign_keys = ON",
        }
    }
);

has get => (
    is      => 'ro',
    isa     => 'HashRef',
    default => sub { \%_config },
);

sub connect_info {
    my ($self) = @_;

    my $db_config    = $self->get->{database};
    my %connect_info = (
        dsn => "dbi:$db_config->{driver}:$db_config->{name}",
        $db_config->{ $db_config->{driver} }->%*
    );

    return \%connect_info;
}

__PACKAGE__->meta->make_immutable;

1;
