use utf8;
package Dasgeld::Schema::Result::OperationTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dasgeld::Schema::Result::OperationTag

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

=head1 TABLE: C<operation_tag>

=cut

__PACKAGE__->table("operation_tag");

=head1 ACCESSORS

=head2 operation_tag_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 operation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "operation_tag_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "operation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tag_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</operation_tag_id>

=back

=cut

__PACKAGE__->set_primary_key("operation_tag_id");

=head1 RELATIONS

=head2 operation

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Operation>

=cut

__PACKAGE__->belongs_to(
  "operation",
  "Dasgeld::Schema::Result::Operation",
  { operation_id => "operation_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 tag

Type: belongs_to

Related object: L<Dasgeld::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
  "tag",
  "Dasgeld::Schema::Result::Tag",
  { tag_id => "tag_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-16 01:48:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+inARj42GzQIUrH/2JxXUA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
