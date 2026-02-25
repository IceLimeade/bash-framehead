# `fs::word_count`

Count words in a file

## Usage

```bash
fs::word_count ...
```

## Source

```bash
fs::word_count() {
    wc -w < "$1"
}
```

## Module

[`fs`](../fs.md)
