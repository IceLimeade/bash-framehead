# `fs::append`

Append content to file

## Usage

```bash
fs::append ...
```

## Source

```bash
fs::append() {
    printf '%s' "$2" >> "$1"
}
```

## Module

[`fs`](../fs.md)
