# `fs::link_count`

Number of hard links

## Usage

```bash
fs::link_count ...
```

## Source

```bash
fs::link_count() {
    stat -c '%h' "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
