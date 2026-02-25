# `terminal::cursor::restore`

Restore cursor to saved position

## Usage

```bash
terminal::cursor::restore ...
```

## Source

```bash
terminal::cursor::restore() {
    printf '\033[u'
}
```

## Module

[`terminal`](../terminal.md)
