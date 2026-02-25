# `math::sum`

Sum of a sequence of integers

## Usage

```bash
math::sum ...
```

## Source

```bash
math::sum() {
    local total=0
    for n in "$@"; do (( total += n )); done
    echo "$total"
}
```

## Module

[`math`](../math.md)
