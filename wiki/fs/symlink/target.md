# `fs::symlink::target`

Symlink target

## Usage

```bash
fs::symlink::target ...
```

## Source

```bash
fs::symlink::target() {
    readlink "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
