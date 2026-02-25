# `colour::supports`

Check if the terminal supports any colour

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
