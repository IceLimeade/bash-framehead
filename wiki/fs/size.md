# `fs::size`

==============================================================================

## Usage

```bash
fs::size ...
```

## Source

```bash
fs::size() {
    stat -c '%s' "$1" 2>/dev/null || wc -c < "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
