# `math::is_even`

Check if integer is even

## Usage

```bash
math::is_even ...
```

## Source

```bash
math::is_even() {
    (( $1 % 2 == 0 ))
}
```

## Module

[`math`](../math.md)
