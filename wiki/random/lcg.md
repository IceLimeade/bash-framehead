# `random::lcg`

Returns: next state (also the output value)

## Usage

```bash
random::lcg ...
```

## Source

```bash
random::lcg() {
    _random::mask32 $(( $1 * 1664525 + 1013904223 ))
}
```

## Module

[`random`](../random.md)
