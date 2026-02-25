# `hash::djb2`

==============================================================================

## Usage

```bash
hash::djb2 ...
```

## Source

```bash
hash::djb2() {
    local s="$1" hash=5381 i char
    for (( i=0; i<${#s}; i++ )); do
        char=$(printf '%d' "'${s:$i:1}")
        hash=$(( ((hash << 5) + hash + char) & 0xFFFFFFFF ))
    done
    echo "$hash"
}
```

## Module

[`hash`](../hash.md)
