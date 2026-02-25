# `math::max`

Maximum of two values

## Usage

```bash
math::max ...
```

## Source

```bash
math::max() {
    echo $(( $1 > $2 ? $1 : $2 ))
}
```

## Module

[`math`](../math.md)
