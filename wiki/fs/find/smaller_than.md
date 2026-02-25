# `fs::find::smaller_than`

Find files smaller than n bytes

## Usage

```bash
fs::find::smaller_than ...
```

## Source

```bash
fs::find::smaller_than() {
    find "${1:-.}" -type f -size "-${2}c" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
