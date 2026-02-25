# `math::ceil`

Ceiling — smallest integer ≥ n

## Usage

```bash
math::ceil ...
```

## Source

```bash
math::ceil() {
    math::bc "scale=0; if ($1 == ($1 / 1)) $1 else if ($1 > 0) ($1 / 1) + 1 else ($1 / 1)"
}
```

## Module

[`math`](../math.md)
