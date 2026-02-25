# `random::seed32`

Seed from /dev/urandom — returns a 32-bit unsigned integer

## Usage

```bash
random::seed32 ...
```

## Source

```bash
random::seed32() {
    od -An -N4 -tu4 /dev/urandom 2>/dev/null | tr -d ' \n' || echo "$RANDOM"
}
```

## Module

[`random`](../random.md)
