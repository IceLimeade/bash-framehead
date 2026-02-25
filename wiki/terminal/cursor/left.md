# `terminal::cursor::left`

Move cursor left n cols

## Usage

```bash
terminal::cursor::left ...
```

## Source

```bash
terminal::cursor::left() {
    printf '\033[%sD' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
