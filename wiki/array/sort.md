# `array::sort`

Sort elements alphabetically

## Usage

```bash
array::sort ...
```

## Source

```bash
array::sort() {
    printf '%s\n' "$@" | sort
}
```

## Module

[`array`](../array.md)
