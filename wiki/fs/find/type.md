# `fs::find::type`

Recursive find by type (f=file, d=dir, l=symlink)

## Usage

```bash
fs::find::type ...
```

## Source

```bash
fs::find::type() {
    find "${1:-.}" -type "$2" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
