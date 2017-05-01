package Dasgeld::CLI::Command::Withdraw;

use v5.24;
use MooseX::App::Command;

extends qw(Dasgeld::CLI::App);

command_short_description 'Withdraw amounts from account';

parameter 'amount' => (
    is            => 'rw',
    isa           => 'Num',
    documentation => q[Amount of money to withdraw from the account],
    required      => 1,
);

option 'tags' => (
    is            => 'rw',
    isa           => 'Str',
    documentation => 'Withdraw description',
    default       => sub {'no-tag'}
);

#option 'description' => ();

sub run {
    my ($self) = @_;

    say $self->amount;
}

1;
