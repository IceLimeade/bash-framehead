# `timedate::tz::convert`

==============================================================================

## Usage

```bash
timedate::tz::convert ...
```

## Source

```bash
timedate::tz::convert() {
    local ts="$1" tz="$2"
    if _timedate::has_gnu_date; then
        TZ="$tz" date -d "@$ts" "+%Y-%m-%d %H:%M:%S %Z" 2>/dev/null
    else
        TZ="$tz" date -r "$ts" "+%Y-%m-%d %H:%M:%S %Z" 2>/dev/null
    fi
}
```

## Module

[`timedate`](../timedate.md)
