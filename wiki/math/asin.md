# `math::asin`

_No description available._

## Usage

```bash
math::asin ...
```

## Source

```bash
math::asin() {
    math::bc "a($1 / sqrt(1 - $1^2))"
}
```

## Module

[`math`](../math.md)
