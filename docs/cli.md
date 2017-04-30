# Command line interface

## Users

    dasgeld user add [<name>]
    dasgeld user list
    dasgeld user edit [<name>]

    dasgeld user disable <name>
    dasgeld user enable <name>

## Accounts

    dasgeld account add <name>
    dasgeld account list
    dasgeld account default

## Operations

    dasgeld add <summa> [--message <message>] [--account <name>] [--user <name>] [--tags <tag>[, ...]]
    dasgeld [withdraw] <summa> [--message <message>] [--account <name>] [--user <name>] [--tags <tag>[, ...]]
    dasgeld edit [<changed summa>] --operation <id> [--date <changed date>]  [--message <message>] [--tags <tag>[, ...]]

## Reports

    dasgeld report [--from <date>] [--to <date>]
    dasgeld list [--from <date>] [--to <date>]
