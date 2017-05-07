package Dasgeld::CLI::Command::Withdraw;

use v5.24;
use Carp;
use Moose::Util::TypeConstraints;
use MooseX::App::Command;

extends qw(Dasgeld::CLI::App);

command_short_description 'Withdraw amounts from account';

parameter 'amount' => (
    is            => 'rw',
    isa           => subtype( 'Num' => where { $_ > 0 } ),
    required      => 1,
    documentation => q[Amount of money to withdraw from the account],
);

option 'tags' => (
    is            => 'rw',
    isa           => 'ArrayRef[Str]',
    cmd_split     => ',',
    default       => sub { ['no-tag'] },
    cmd_tags      => [qw(Optional)],
    documentation => q[Comma separated tags],
);

option 'description' => (
    is            => 'rw',
    isa           => 'Str',
    cmd_aliases   => [qw(m message)],
    documentation => q[Withdraw description],
);

option 'account' => (
    is            => 'rw',
    isa           => 'Str',
    required      => 1,
    cmd_aliases   => [qw(a)],
    documentation => q[Account name],
);

sub run {
    my ($self) = @_;
    my $schema = $self->app->schema;

    my $guard = $schema->txn_scope_guard;

    my $account
      = $schema->resultset('Account')->find( { name => $self->account } )
      or croak 'Account not found';

    # TODO: $self->app->assert_credentials($self->user);

    my $auth = $schema->resultset('Auth')->find( { username => $self->user } )
      or croak 'Auth record not found';

    my $op = $schema->resultset('Operation')->new_result(
        {   editor_id  => $auth->person->person_id,
            account_id => $account->account_id,

            # convert to integer
            amount      => -int( $self->amount * 100 ),
            description => $self->description,
            tags        => join ', ' => $self->tags->@*,
        }
    );
    $op->insert;

    foreach my $tag_name ( $self->tags->@* ) {
        my $tag = $schema->resultset('Tag')
          ->find_or_create( { name => $tag_name } );
        $op->create_related( 'operation_tags', { tag_id => $tag->tag_id } );
    }

    $guard->commit;
}

1;
