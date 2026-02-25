# `array::push`

Append elements (print existing + new)

## Usage

```bash
array::push ...
```

## Source

```bash
array::push() {
    local new="$1"; shift
    printf '%s\n' "$@" "$new"
}
```

## Module

[`array`](../array.md)
