package Dasgeld::CLI::App;

use MooseX::App qw(Color);
use Dasgeld;

app_namespace 'Dasgeld::CLI::Command';
app_command_register 'w' => 'Dasgeld::CLI::Command::Withdraw';

has app => (
    is      => 'ro',
    isa     => 'Dasgeld',
    default => sub { Dasgeld->new() },
);

option 'user' => (
    is  => 'rw',
    isa => 'Str',
    documentation =>
      'Optional user name. If not set, system user name is used',
);

1;
