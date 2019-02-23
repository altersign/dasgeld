use utf8;

package Dasgeld::Schema::Result::Person;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::Person

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

=head1 TABLE: C<person>

=cut

__PACKAGE__->table("person");

=head1 ACCESSORS

=head2 person_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "person_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "name",
    { data_type => "text", is_nullable => 0 },
    "email",
    { data_type => "text", is_nullable => 0 },
    "created",
    {   data_type     => "timestamp",
        default_value => \"current_timestamp",
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</person_id>

=back

=cut

__PACKAGE__->set_primary_key("person_id");

=head1 RELATIONS

=head2 accounts

Type: has_many

Related object: L<Dasgeld::Schema::Result::Account>

=cut

__PACKAGE__->has_many(
    "accounts",
    "Dasgeld::Schema::Result::Account",
    { "foreign.account_owner_id" => "self.person_id" },
    { cascade_copy               => 0, cascade_delete => 0 },
);

=head2 auths

Type: has_many

Related object: L<Dasgeld::Schema::Result::Auth>

=cut

__PACKAGE__->has_many(
    "auths",
    "Dasgeld::Schema::Result::Auth",
    { "foreign.person_id" => "self.person_id" },
    { cascade_copy        => 0, cascade_delete => 0 },
);

=head2 operations

Type: has_many

Related object: L<Dasgeld::Schema::Result::Operation>

=cut

__PACKAGE__->has_many(
    "operations",
    "Dasgeld::Schema::Result::Operation",
    { "foreign.editor_id" => "self.person_id" },
    { cascade_copy        => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2019-02-23 03:31:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jimuWfrdC9pjk1ZydKEDLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
