# Setup process

## Prerequsives

Perl >= 5.24
cpanm
sqlite

## Process

cpanm Dancer2::Plugin::DBIC

### Database migration engine: initial setup

    sqitch init dasgeld --engine sqlite --top-dir sqitch --uri https://github.com/altersign/dasgeld/

Edit sqitch.conf to add database name: "db/dasgeld.db".

    sqitch add baseschema -m"Add initial database schema, sqlite compatible"

Copy db/schema.sql to sqitch/deploy/baseschema.sql

    sqitch deploy

Create dbicdump.conf and put there settings for DBIx::Class::Schema::Loader

Add revert and verify scripts