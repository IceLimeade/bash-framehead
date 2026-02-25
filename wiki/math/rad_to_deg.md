# `math::rad_to_deg`

Convert radians to degrees

## Usage

```bash
math::rad_to_deg ...
```

## Source

```bash
math::rad_to_deg() {
    math::bc "$1 * 180 / $MATH_PI"
}
```

## Module

[`math`](../math.md)
