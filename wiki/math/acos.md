# `math::acos`

_No description available._

## Usage

```bash
math::acos ...
```

## Source

```bash
math::acos() {
    math::bc "a(sqrt(1 - $1^2) / $1)"
}
```

## Module

[`math`](../math.md)
