# `array::contains`

Check if array contains a value

## Usage

```bash
array::contains ...
```

## Source

```bash
array::contains() {
    local needle="$1"; shift
    local el
    for el in "$@"; do
        [[ "$el" == "$needle" ]] && return 0
    done
    return 1
}
```

## Module

[`array`](../array.md)
