# `terminal::cursor::home`

Move cursor to top-left (home)

## Usage

```bash
terminal::cursor::home ...
```

## Source

```bash
terminal::cursor::home() {
    printf '\033[H'
}
```

## Module

[`terminal`](../terminal.md)
