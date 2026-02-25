# `fs::lines`

Read a range of lines

## Usage

```bash
fs::lines ...
```

## Source

```bash
fs::lines() {
    sed -n "${2},${3}p" "$1"
}
```

## Module

[`fs`](../fs.md)
