# `terminal::scroll::down`

Scroll down n lines

## Usage

```bash
terminal::scroll::down ...
```

## Source

```bash
terminal::scroll::down() {
    printf '\033[%sT' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
