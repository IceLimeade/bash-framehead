# `fs::modified`

Last modified time (unix timestamp)

## Usage

```bash
fs::modified ...
```

## Source

```bash
fs::modified() {
    stat -c '%Y' "$1" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
