use utf8;
package Dasgeld::Schema::Result::Operation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::Operation

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

=head1 TABLE: C<operation>

=cut

__PACKAGE__->table("operation");

=head1 ACCESSORS

=head2 operation_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 account_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 summa

  data_type: 'integer'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 tags

  data_type: 'text'
  is_nullable: 1

=head2 performed

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 parent_operation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 is_actual

  data_type: 'boolean'
  default_value: 1
  is_nullable: 0

=head2 revision

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 editor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "operation_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "account_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "summa",
  { data_type => "integer", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "tags",
  { data_type => "text", is_nullable => 1 },
  "performed",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "parent_operation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "is_actual",
  { data_type => "boolean", default_value => 1, is_nullable => 0 },
  "revision",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "editor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</operation_id>

=back

=cut

__PACKAGE__->set_primary_key("operation_id");

=head1 RELATIONS

=head2 account

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
  "account",
  "Dasgeld::Schema::Result::Account",
  { account_id => "account_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 editor

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Person>

=cut

__PACKAGE__->belongs_to(
  "editor",
  "Dasgeld::Schema::Result::Person",
  { person_id => "editor_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 operation_tags

Type: has_many

Related object: L<Dasgeld::Schema::Result::OperationTag>

=cut

__PACKAGE__->has_many(
  "operation_tags",
  "Dasgeld::Schema::Result::OperationTag",
  { "foreign.operation_id" => "self.operation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 operations

Type: has_many

Related object: L<Dasgeld::Schema::Result::Operation>

=cut

__PACKAGE__->has_many(
  "operations",
  "Dasgeld::Schema::Result::Operation",
  { "foreign.parent_operation_id" => "self.operation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent_operation

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Operation>

=cut

__PACKAGE__->belongs_to(
  "parent_operation",
  "Dasgeld::Schema::Result::Operation",
  { operation_id => "parent_operation_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-16 01:48:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qqdvuwINzYjHGxiNGpQ9DQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
