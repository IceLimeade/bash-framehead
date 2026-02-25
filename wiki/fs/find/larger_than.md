# `fs::find::larger_than`

Find files larger than n bytes

## Usage

```bash
fs::find::larger_than ...
```

## Source

```bash
fs::find::larger_than() {
    find "${1:-.}" -type f -size "+${2}c" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
