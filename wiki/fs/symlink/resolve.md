# `fs::symlink::resolve`

Resolved symlink target (follows chain)

## Usage

```bash
fs::symlink::resolve ...
```

## Source

```bash
fs::symlink::resolve() {
    readlink -f "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
