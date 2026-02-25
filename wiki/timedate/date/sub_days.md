# `timedate::date::sub_days`

Subtract n days from a date

## Usage

```bash
timedate::date::sub_days ...
```

## Source

```bash
timedate::date::sub_days() {
    timedate::date::add_days "$1" "$(( -$2 ))"
}
```

## Module

[`timedate`](../timedate.md)
