# SETUP PROCESS

## Prerequsives

Perl >= 5.24
cpanm
sqlite

## Process

cpanm Dancer2::Plugin::DBIC

### Database migration engine

    sqitch init dasgeld --engine sqlite --top-dir sqitch --uri https://github.com/altersign/dasgeld/

Edit sqitch.conf to add database name: "db/dasgeld.db".
