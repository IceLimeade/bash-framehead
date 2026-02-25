# `fs::writeln`

Write with newline

## Usage

```bash
fs::writeln ...
```

## Source

```bash
fs::writeln() {
    printf '%s\n' "$2" > "$1"
}
```

## Module

[`fs`](../fs.md)
