# `fs::path::is_absolute`

Check if a path is absolute

## Usage

```bash
fs::path::is_absolute ...
```

## Source

```bash
fs::path::is_absolute() {
    [[ "$1" == /* ]]
}
```

## Module

[`fs`](../fs.md)
