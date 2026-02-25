# `terminal::cursor::prev_line`

Move cursor to start of line n lines up

## Usage

```bash
terminal::cursor::prev_line ...
```

## Source

```bash
terminal::cursor::prev_line() {
    printf '\033[%sF' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
