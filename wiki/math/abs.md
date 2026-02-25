# `math::abs`

==============================================================================

## Usage

```bash
math::abs ...
```

## Source

```bash
math::abs() {
    echo $(( $1 < 0 ? -$1 : $1 ))
}
```

## Module

[`math`](../math.md)
