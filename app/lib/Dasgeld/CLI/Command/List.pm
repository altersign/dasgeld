package Dasgeld::CLI::Command::List;

use utf8;
use v5.24;
use Carp;
use Moose::Util::TypeConstraints;
use DateTime;
use DateTime::Format::SQLite;

type 'DateTime', as 'Object', where { $_->isa('DateTime') };
type 'DateTimeStr',
  where { defined DateTime::Format::SQLite->parse_datetime($_) };
coerce 'DateTime',
  from 'Str',
  via { DateTime::Format::SQLite->parse_datetime($_) };

no Moose::Util::TypeConstraints;

use MooseX::App::Command;
extends qw(Dasgeld::CLI::App);

command_short_description 'List operations';

option 'from' => (
    is            => 'rw',
    isa           => 'DateTimeStr',
    cmd_tags      => [qw(Optional)],
    documentation => q[Start date in YYYY-MM-DD],
);

option 'to' => (
    is            => 'rw',
    isa           => 'DateTimeStr',
    cmd_tags      => [qw(Optional)],
    documentation => q[End date],
);

option 'account' => (
    is            => 'rw',
    isa           => 'Str',
    cmd_tags      => [qw(Optional)],
    cmd_aliases   => [qw(a)],
    documentation => q[Account name],
);

option 'verbose' => (
    is            => 'rw',
    isa           => 'Bool',
    required      => 0,
    default       => 0,
    documentation => q[Show details about operation: account, tags, etc],
);

sub run {
    my ($self) = @_;
    my $schema = $self->app->schema;

    my $auth = $schema->resultset('Auth')->find( { username => $self->user } )
      or croak 'Auth record not found';

    my $where = {};

    if ( $self->account ) {
        my $account
          = $schema->resultset('Account')->find( { name => $self->account } )
          or croak 'Account not found';
        $where->{account_id} = $account->account_id;
    }
    if ( $self->from ) {
        $where->{performed} = { '>=' => $self->from };
    }
    if ( $self->to ) {
        $where->{performed}{'<'} = $self->to;
    }

    my $operations = $schema->resultset('ActualOperation')
      ->search( $where, { 'order_by' => 'performed' } );

    my ( $count, $sum ) = ( 0, 0 );
    while ( my $op = $operations->next ) {
        if ( $self->verbose ) {
            printf "%d\t%s %4.2f\t%s\t%s\t%s\n", $op->operation_id,
              $op->performed,                    $op->amount / 100,
              $op->account->name,                $op->tags,
              ( $op->description // '-No description' );
        }
        else {
            printf "%d\t%s %4.2f\t%s\n", $op->operation_id, $op->performed,
              $op->amount / 100,
              ( $op->description // '-No description' );
        }
        $sum += $op->amount;
        $count++;
    }
    $sum /= 100;
    say "\tTotal: $count  records, $sum €";
}

1;
