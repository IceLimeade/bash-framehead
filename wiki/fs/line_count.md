# `fs::line_count`

Count lines in a file

## Usage

```bash
fs::line_count ...
```

## Source

```bash
fs::line_count() {
    wc -l < "$1"
}
```

## Module

[`fs`](../fs.md)
