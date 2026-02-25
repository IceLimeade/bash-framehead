# `terminal::screen::normal`

Return to normal screen buffer

## Usage

```bash
terminal::screen::normal ...
```

## Source

```bash
terminal::screen::normal() {
    printf '\033[?1049l'
}
```

## Module

[`terminal`](../terminal.md)
