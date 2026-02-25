# `hash::slot`

Consistent hashing — map a value to a bucket (0 to n-1)

## Usage

```bash
hash::slot ...
```

## Source

```bash
hash::slot() {
    local n="$1" value="$2"
    local h
    h=$(hash::fnv1a32 "$value")
    echo $(( h % n ))
}
```

## Module

[`hash`](../hash.md)
