# `math::deg_to_rad`

Convert degrees to radians

## Usage

```bash
math::deg_to_rad ...
```

## Source

```bash
math::deg_to_rad() {
    math::bc "$1 * $MATH_PI / 180"
}
```

## Module

[`math`](../math.md)
