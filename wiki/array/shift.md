# `array::shift`

Remove first element

## Usage

```bash
array::shift ...
```

## Source

```bash
array::shift() {
    shift
    printf '%s\n' "$@"
}
```

## Module

[`array`](../array.md)
