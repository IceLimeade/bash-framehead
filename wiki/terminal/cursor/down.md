# `terminal::cursor::down`

Move cursor down n rows

## Usage

```bash
terminal::cursor::down ...
```

## Source

```bash
terminal::cursor::down() {
    printf '\033[%sB' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
