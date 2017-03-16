use utf8;
package Dasgeld::Schema::Result::Auth;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::Auth

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

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<auth>

=cut

__PACKAGE__->table("auth");

=head1 ACCESSORS

=head2 auth_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 person_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 username

  data_type: 'text'
  is_nullable: 0

=head2 password

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "auth_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "person_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "username",
  { data_type => "text", is_nullable => 0 },
  "password",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</auth_id>

=back

=cut

__PACKAGE__->set_primary_key("auth_id");

=head1 RELATIONS

=head2 person

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Person>

=cut

__PACKAGE__->belongs_to(
  "person",
  "Dasgeld::Schema::Result::Person",
  { person_id => "person_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-16 01:48:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Od0PdC1wdypK/S1NWGHFoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
