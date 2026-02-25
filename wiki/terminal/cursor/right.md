# `terminal::cursor::right`

Move cursor right n cols

## Usage

```bash
terminal::cursor::right ...
```

## Source

```bash
terminal::cursor::right() {
    printf '\033[%sC' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
