# `array::rotate`

Rotate array left by n positions

## Usage

```bash
array::rotate ...
```

## Source

```bash
array::rotate() {
    local n="$1"; shift
    local -a arr=("$@")
    local len="${#arr[@]}"
    n=$(( n % len ))
    printf '%s\n' "${arr[@]:$n}" "${arr[@]:0:$n}"
}
```

## Module

[`array`](../array.md)
