# `array::union`

Union — all unique elements from both arrays

## Usage

```bash
array::union ...
```

## Source

```bash
array::union() {
    local -a a=($1) b=($2)
    array::unique "${a[@]}" "${b[@]}"
}
```

## Module

[`array`](../array.md)
