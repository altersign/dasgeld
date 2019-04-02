# Command line interface

## Users

    dasgeld user add [<name>]       # Not implemented
    dasgeld user list
    dasgeld user edit [<name>]      # Not implemented

    dasgeld user disable <name>     # Not implemented
    dasgeld user enable <name>      # Not implemented

## Accounts

    dasgeld account add <name>      # Not implemented
    dasgeld account list            # Not implemented
    dasgeld account default         # Not implemented

# Tags

    dasgeld tag list [--verbose]

## Operations

    dasgeld add <summa> [--message <message>] [--account <name>] [--user <name>] [--tags <tag>[, ...]]
    dasgeld [withdraw|w] <summa> [--message|m <message>] [--account|a <name>] [--user <name>] [--tags <tag>[, ...]] [--transfer account_name] [--date <operation date>]
    dasgeld edit [<changed summa>] --operation <id> [--date <changed date>]  [--message <message>] [--tags <tag>[, ...]]

## Reports

    dasgeld report [--from <date>] [--to <date>] [--account|a <name>]
    dasgeld list [--from <date>] [--to <date>] [--account|a <name>] [--verbose]
