# `terminal::scroll::up`

Scroll up n lines

## Usage

```bash
terminal::scroll::up ...
```

## Source

```bash
terminal::scroll::up() {
    printf '\033[%sS' "${1:-1}"
}
```

## Module

[`terminal`](../terminal.md)
