# `array::compact`

Return only elements that are non-empty

## Usage

```bash
array::compact ...
```

## Source

```bash
array::compact() {
    for el in "$@"; do
        [[ -n "$el" ]] && echo "$el"
    done
}
```

## Module

[`array`](../array.md)
