# `random::xorshift64`

Returns: next state (also the output value)

## Usage

```bash
random::xorshift64 ...
```

## Source

```bash
random::xorshift64() {
    local x="$1"
    x=$(( x ^ (x << 13) ))
    x=$(( x ^ (x >> 7)  ))
    x=$(( x ^ (x << 17) ))
    echo "$x"
}
```

## Module

[`random`](../random.md)
