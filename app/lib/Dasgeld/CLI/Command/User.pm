package Dasgeld::CLI::Command::User;

use v5.24;
use Carp;
use Moose::Util::TypeConstraints;
use MooseX::App::Command;
use experimental 'smartmatch';

extends qw(Dasgeld::CLI::App);

parameter 'operation' => (
    is            => 'rw',
    isa           => enum( [qw(add list edit disable enable)] ),
    documentation => q[add/list/edit/disable/enable],
    required      => 1,
);

command_short_description 'Managament of user accounts';

sub run {
    my ($self) = @_;

    given ( $self->operation ) {
        when ('list') {
            $self->list;
        }
        when ('enable') {
            say 'Enabling ... not really';
        }
        when ('disable') {
            say 'Disabling ... not really';
        }
        default {
            croak 'Unknown or non-implemented operation: ' . $_;
        }
    }
}

sub list {
    my ($self) = @_;
    my $persons = $self->app->schema->resultset('Person');
    while ( my $person = $persons->next ) {
        say $person->name . "\temail: " . $person->email;
    }
}

1;
