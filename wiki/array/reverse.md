# `array::reverse`

Reverse order of elements

## Usage

```bash
array::reverse ...
```

## Source

```bash
array::reverse() {
    local -a arr=("$@")
    local i
    for (( i=${#arr[@]}-1; i>=0; i-- )); do
        echo "${arr[$i]}"
    done
}
```

## Module

[`array`](../array.md)
