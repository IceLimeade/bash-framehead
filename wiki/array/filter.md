# `array::filter`

Filter elements matching a regex

## Usage

```bash
array::filter ...
```

## Source

```bash
array::filter() {
    local regex="$1"; shift
    for el in "$@"; do
        [[ "$el" =~ $regex ]] && echo "$el"
    done
}
```

## Module

[`array`](../array.md)
