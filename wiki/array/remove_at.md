# `array::remove_at`

Remove element at index

## Usage

```bash
array::remove_at ...
```

## Source

```bash
array::remove_at() {
    local idx="$1" i=0; shift
    for el in "$@"; do
        [[ "$i" -ne "$idx" ]] && echo "$el"
        (( i++ ))
    done
}
```

## Module

[`array`](../array.md)
