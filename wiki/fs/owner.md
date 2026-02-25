# `fs::owner`

Owner username

## Usage

```bash
fs::owner ...
```

## Source

```bash
fs::owner() {
    stat -c '%U' "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
