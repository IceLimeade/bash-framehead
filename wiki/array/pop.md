# `array::pop`

Remove last element

## Usage

```bash
array::pop ...
```

## Source

```bash
array::pop() {
    local -a arr=("$@")
    unset 'arr[-1]'
    printf '%s\n' "${arr[@]}"
}
```

## Module

[`array`](../array.md)
