# `fs::delete`

Delete file or directory

## Usage

```bash
fs::delete ...
```

## Source

```bash
fs::delete() {
    rm -rf "$1"
}
```

## Module

[`fs`](../fs.md)
