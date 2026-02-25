# `math::min`

Minimum of two values

## Usage

```bash
math::min ...
```

## Source

```bash
math::min() {
    echo $(( $1 < $2 ? $1 : $2 ))
}
```

## Module

[`math`](../math.md)
