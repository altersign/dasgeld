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

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
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

=head2 summa

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
  "summa",
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


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-16 01:48:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BIZJnm6T0D8G6Hk3GqjQTQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
