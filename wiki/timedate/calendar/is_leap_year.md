# `timedate::calendar::is_leap_year`

==============================================================================

## Usage

```bash
timedate::calendar::is_leap_year ...
```

## Source

```bash
timedate::calendar::is_leap_year() {
    local year="$1"
    (( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ))
}
```

## Module

[`timedate`](../timedate.md)
