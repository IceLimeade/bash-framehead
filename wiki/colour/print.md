# `colour::print`

Print text wrapped in colour, auto-reset after

## Usage

```bash
colour::print ...
```

## Source

```bash
colour::print() {
    local bit="$1" fg_bg="$2" col="$3" text="$4"
    colour::esc "$bit" "$fg_bg" "$col"
    printf '%s' "$text"
    colour::reset
}
```

## Module

[`colour`](../colour.md)
