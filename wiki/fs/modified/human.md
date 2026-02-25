# `fs::modified::human`

Last modified time (human readable)

## Usage

```bash
fs::modified::human ...
```

## Source

```bash
fs::modified::human() {
    stat -c '%y' "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
