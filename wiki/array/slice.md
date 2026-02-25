# `array::slice`

Slice a subarray

## Usage

```bash
array::slice ...
```

## Source

```bash
array::slice() {
    local start="$1" len="$2"; shift 2
    local -a arr=("$@")
    printf '%s\n' "${arr[@]:$start:$len}"
}
```

## Module

[`array`](../array.md)
