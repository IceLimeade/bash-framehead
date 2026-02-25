# `array::set`

Replace element at index with new value

## Usage

```bash
array::set ...
```

## Source

```bash
array::set() {
    local idx="$1" val="$2" i=0; shift 2
    for el in "$@"; do
        [[ "$i" -eq "$idx" ]] && echo "$val" || echo "$el"
        (( i++ ))
    done
}
```

## Module

[`array`](../array.md)
