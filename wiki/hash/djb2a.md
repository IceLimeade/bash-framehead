# `hash::djb2a`

DJB2a (xor variant) — slightly better distribution than djb2

## Usage

```bash
hash::djb2a ...
```

## Source

```bash
hash::djb2a() {
    local s="$1" hash=5381 i char
    for (( i=0; i<${#s}; i++ )); do
        char=$(printf '%d' "'${s:$i:1}")
        hash=$(( ((hash << 5) + hash ^ char) & 0xFFFFFFFF ))
    done
    echo "$hash"
}
```

## Module

[`hash`](../hash.md)
