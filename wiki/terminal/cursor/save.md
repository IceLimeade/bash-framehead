# `terminal::cursor::save`

Save cursor position

## Usage

```bash
terminal::cursor::save ...
```

## Source

```bash
terminal::cursor::save() {
    printf '\033[s'
}
```

## Module

[`terminal`](../terminal.md)
