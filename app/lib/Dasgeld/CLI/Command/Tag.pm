package Dasgeld::CLI::Command::Tag;

use v5.24;
use Carp;
use Moose::Util::TypeConstraints;
use MooseX::App::Command;
use experimental 'smartmatch';

extends qw(Dasgeld::CLI::App);

parameter 'operation' => (
    is            => 'rw',
    isa           => enum( [qw(list add)] ),
    documentation => q[list add],
    required      => 1,
);

option 'verbose' => (
    is            => 'rw',
    isa           => 'Bool',
    required      => 0,
    default       => 0,
    documentation => q[Show number of usages for a tag],
);

command_short_description 'Management of tags';

sub run {
    my ($self) = @_;

    given ( $self->operation ) {
        when ('list') {
            $self->list;
        }
        when ('add') {
            $self->add;
        }
        default {
            croak 'Unknown or non-implemented operation: ' . $_;
        }
    }
}

sub list {
    my ($self) = @_;
    my $tags = $self->app->schema->resultset('Tag');

    if ( $self->verbose ) {

        # This is goint to be a query with JOIN to count usages in one query,
        # see below
        # $tags->search( {},
        #     {
        #         join => {operation_tag => operation}
        #     }
        # );
    }
    while ( my $tag = $tags->next ) {

        # TODO: This is highly ineffectife way to calculate number of usages:
        # it generate N+1 queries for N tags. We should use join instead.
        say $tag->name
          . ( $self->verbose ? "\tused: " . $tag->operations->count() : '' );
    }
}

sub add {
    say "Not implemented";
}

1;
