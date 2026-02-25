# `random::xorshift32`

==============================================================================

## Usage

```bash
random::xorshift32 ...
```

## Source

```bash
random::xorshift32() {
    local x
    x=$(_random::mask32 "$1")
    x=$(( x ^ (x << 13) )); x=$(_random::mask32 $x)
    x=$(( x ^ (x >> 17) ))
    x=$(( x ^ (x << 5)  )); x=$(_random::mask32 $x)
    echo "$x"
}
```

## Module

[`random`](../random.md)
