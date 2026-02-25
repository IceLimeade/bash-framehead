# `timedate::time::format`

Current time in a custom format

## Usage

```bash
timedate::time::format ...
```

## Source

```bash
timedate::time::format() {
    local fmt="${1:-%H:%M:%S}"
    date +"$fmt"
}
```

## Module

[`timedate`](../timedate.md)
