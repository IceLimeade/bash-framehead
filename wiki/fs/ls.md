# `fs::ls`

List directory contents (one per line)

## Usage

```bash
fs::ls ...
```

## Source

```bash
fs::ls() {
    ls -1 "${1:-.}"
}
```

## Module

[`fs`](../fs.md)
