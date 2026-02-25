# `colour::supports`

colour.sh — bash-frameheader colour lib

## Usage

```bash
colour::supports ...
```

## Source

```bash
colour::supports() {
    [[ -t 1 ]] || return 1
    local count
    count=$(colour::depth)
    (( count >= 8 ))
}
```

## Module

[`colour`](../colour.md)
