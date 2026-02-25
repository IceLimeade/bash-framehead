# `fs::inode`

Inode number

## Usage

```bash
fs::inode ...
```

## Source

```bash
fs::inode() {
    stat -c '%i' "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
