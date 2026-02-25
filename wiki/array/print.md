# `array::print`

Print each element on its own line (normalise for piping)

## Usage

```bash
array::print ...
```

## Source

```bash
array::print() {
    printf '%s\n' "$@"
}
```

## Module

[`array`](../array.md)
