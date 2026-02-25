# `fs::appendln`

Append with newline

## Usage

```bash
fs::appendln ...
```

## Source

```bash
fs::appendln() {
    printf '%s\n' "$2" >> "$1"
}
```

## Module

[`fs`](../fs.md)
