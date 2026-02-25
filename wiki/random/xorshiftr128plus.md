# `random::xorshiftr128plus`

==============================================================================

## Usage

```bash
random::xorshiftr128plus ...
```

## Source

```bash
random::xorshiftr128plus() {
    local s0="$1" s1="$2"

    local result=$(( s0 + s1 ))
    s1=$(( s1 ^ s0 ))
    s0=$(( $(_random::rotl64 $s0 23) ^ s1 ^ (s1 << 17) ))
    s1=$(_random::rotl64 $s1 26)

    echo "$result $s0 $s1"
}
```

## Module

[`random`](../random.md)
