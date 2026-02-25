# `array::equals`

Check if two arrays are equal (same elements, same order)

## Usage

```bash
array::equals ...
```

## Source

```bash
array::equals() {
    local -a a=($1) b=($2)
    [[ "${#a[@]}" -ne "${#b[@]}" ]] && return 1
    local i
    for (( i=0; i<${#a[@]}; i++ )); do
        [[ "${a[$i]}" != "${b[$i]}" ]] && return 1
    done
    return 0
}
```

## Module

[`array`](../array.md)
