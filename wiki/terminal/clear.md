# `terminal::clear`

Clear entire screen

## Usage

```bash
terminal::clear ...
```

## Source

```bash
terminal::clear() {
    printf '\033[2J'
    terminal::cursor::home
}
```

## Module

[`terminal`](../terminal.md)
