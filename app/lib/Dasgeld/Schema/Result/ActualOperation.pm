use utf8;

package Dasgeld::Schema::Result::ActualOperation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::ActualOperation

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
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<actual_operation>

=cut

__PACKAGE__->table("actual_operation");

=head1 ACCESSORS

=head2 operation_id

  data_type: 'integer'
  is_nullable: 1

=head2 account_id

  data_type: 'integer'
  is_nullable: 1

=head2 amount

  data_type: 'integer'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 tags

  data_type: 'text'
  is_nullable: 1

=head2 performed

  data_type: 'timestamp'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  is_nullable: 1

=head2 parent_operation_id

  data_type: 'integer'
  is_nullable: 1

=head2 is_actual

  data_type: 'boolean'
  is_nullable: 1

=head2 revision

  data_type: 'integer'
  is_nullable: 1

=head2 editor_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "operation_id",
    { data_type => "integer", is_nullable => 1 },
    "account_id",
    { data_type => "integer", is_nullable => 1 },
    "amount",
    { data_type => "integer", is_nullable => 1 },
    "description",
    { data_type => "text", is_nullable => 1 },
    "tags",
    { data_type => "text", is_nullable => 1 },
    "performed",
    { data_type => "timestamp", is_nullable => 1 },
    "created",
    { data_type => "timestamp", is_nullable => 1 },
    "parent_operation_id",
    { data_type => "integer", is_nullable => 1 },
    "is_actual",
    { data_type => "boolean", is_nullable => 1 },
    "revision",
    { data_type => "integer", is_nullable => 1 },
    "editor_id",
    { data_type => "integer", is_nullable => 1 },
);

# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-05-07 23:44:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R8eNw/911fAwWGdq+oIq4A

=head1 RELATIONS

=head2 account

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
    "account",
    "Dasgeld::Schema::Result::Account",
    { account_id => "account_id" },
    {   is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION"
    },
);

=head2 editor

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Person>

=cut

__PACKAGE__->belongs_to(
    "editor",
    "Dasgeld::Schema::Result::Person",
    { person_id => "editor_id" },
    {   is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION"
    },
);

=head2 operation_tags

Type: has_many

Related object: L<Dasgeld::Schema::Result::OperationTag>

=cut

__PACKAGE__->has_many(
    "operation_tags",
    "Dasgeld::Schema::Result::OperationTag",
    { "foreign.operation_id" => "self.operation_id" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

1;
