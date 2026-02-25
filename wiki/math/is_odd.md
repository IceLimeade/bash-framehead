# `math::is_odd`

Check if integer is odd

## Usage

```bash
math::is_odd ...
```

## Source

```bash
math::is_odd() {
    (( $1 % 2 != 0 ))
}
```

## Module

[`math`](../math.md)
