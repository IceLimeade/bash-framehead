# `array::flatten`

Flatten one level — splits each element by whitespace

## Usage

```bash
array::flatten ...
```

## Source

```bash
array::flatten() {
    for el in "$@"; do
        for word in $el; do
            echo "$word"
        done
    done
}
```

## Module

[`array`](../array.md)
