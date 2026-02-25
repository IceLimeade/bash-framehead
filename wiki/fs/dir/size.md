# `fs::dir::size`

Get total size of directory

## Usage

```bash
fs::dir::size ...
```

## Source

```bash
fs::dir::size() {
    du -sb "${1:-.}" 2>/dev/null | awk '{print $1}'
}
```

## Module

[`fs`](../fs.md)
