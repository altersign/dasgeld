use utf8;

package Dasgeld::Schema::Result::Account;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::Account

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );

=head1 TABLE: C<account>

=cut

__PACKAGE__->table("account");

=head1 ACCESSORS

=head2 account_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 account_owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 currency

  data_type: 'char'
  default_value: 'EUR'
  is_nullable: 0
  size: 3

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "account_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "account_owner_id",
    { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
    "name",
    { data_type => "text", is_nullable => 0 },
    "currency",
    {   data_type => "char", default_value => "EUR", is_nullable => 0,
        size      => 3
    },
    "created",
    {   data_type     => "timestamp",
        default_value => \"current_timestamp",
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</account_id>

=back

=cut

__PACKAGE__->set_primary_key("account_id");

=head1 RELATIONS

=head2 account_owner

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Person>

=cut

__PACKAGE__->belongs_to(
    "account_owner",
    "Dasgeld::Schema::Result::Person",
    { person_id => "account_owner_id" },
    {   is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION"
    },
);

=head2 operations

Type: has_many

Related object: L<Dasgeld::Schema::Result::Operation>

=cut

__PACKAGE__->has_many(
    "operations",
    "Dasgeld::Schema::Result::Operation",
    { "foreign.account_id" => "self.account_id" },
    { cascade_copy         => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2019-02-23 03:31:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s9ewik7SAs5qOvjP9SNITw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
