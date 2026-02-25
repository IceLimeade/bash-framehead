# `math::round`

Round to nearest integer (or to d decimal places)

## Usage

```bash
math::round ...
```

## Source

```bash
math::round() {
    local n="$1" d="${2:-0}"
    math::bc "scale=${d}; (${n} + 0.5 * (${n} > 0) - 0.5 * (${n} < 0)) / 1" "$d"
}
```

## Module

[`math`](../math.md)
