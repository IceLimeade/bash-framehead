# `array::zip`

Zip two arrays together — pairs elements by index

## Usage

```bash
array::zip ...
```

## Source

```bash
array::zip() {
    local -a a=($1) b=($2)
    local len=$(( ${#a[@]} < ${#b[@]} ? ${#a[@]} : ${#b[@]} ))
    local i
    for (( i=0; i<len; i++ )); do
        echo "${a[$i]} ${b[$i]}"
    done
}
```

## Module

[`array`](../array.md)
