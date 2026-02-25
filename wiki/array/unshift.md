# `array::unshift`

Prepend an element

## Usage

```bash
array::unshift ...
```

## Source

```bash
array::unshift() {
    local new="$1"; shift
    printf '%s\n' "$new" "$@"
}
```

## Module

[`array`](../array.md)
