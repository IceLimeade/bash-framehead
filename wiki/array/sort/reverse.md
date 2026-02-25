# `array::sort::reverse`

Sort elements in reverse

## Usage

```bash
array::sort::reverse ...
```

## Source

```bash
array::sort::reverse() {
    printf '%s\n' "$@" | sort -r
}
```

## Module

[`array`](../array.md)
