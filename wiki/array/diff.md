# `array::diff`

Difference — elements in first array not in second

## Usage

```bash
array::diff ...
```

## Source

```bash
array::diff() {
    local -a a=($1) b=($2)
    for el in "${a[@]}"; do
        local found=false
        for other in "${b[@]}"; do
            [[ "$el" == "$other" ]] && found=true && break
        done
        $found || echo "$el"
    done
}
```

## Module

[`array`](../array.md)
