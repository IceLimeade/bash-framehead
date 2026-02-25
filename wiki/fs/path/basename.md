# `fs::path::basename`

Get filename from path (like basename)

## Usage

```bash
fs::path::basename ...
```

## Source

```bash
fs::path::basename() {
    echo "${1##*/}"
}
```

## Module

[`fs`](../fs.md)
