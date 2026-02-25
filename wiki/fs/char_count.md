# `fs::char_count`

Count characters in a file

## Usage

```bash
fs::char_count ...
```

## Source

```bash
fs::char_count() {
    wc -c < "$1"
}
```

## Module

[`fs`](../fs.md)
