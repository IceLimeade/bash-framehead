# `fs::ls::all`

List with hidden files

## Usage

```bash
fs::ls::all ...
```

## Source

```bash
fs::ls::all() {
    ls -1A "${1:-.}"
}
```

## Module

[`fs`](../fs.md)
