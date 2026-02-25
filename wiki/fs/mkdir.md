# `fs::mkdir`

Create directory (including parents)

## Usage

```bash
fs::mkdir ...
```

## Source

```bash
fs::mkdir() {
    mkdir -p "$1"
}
```

## Module

[`fs`](../fs.md)
