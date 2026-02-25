# `array::sort::numeric`

Sort elements numerically

## Usage

```bash
array::sort::numeric ...
```

## Source

```bash
array::sort::numeric() {
    printf '%s\n' "$@" | sort -n
}
```

## Module

[`array`](../array.md)
