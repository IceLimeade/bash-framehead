# `terminal::is_tty`

terminal.sh — bash-frameheader terminal lib

## Usage

```bash
terminal::is_tty ...
```

## Source

```bash
terminal::is_tty() {
    [[ -t 1 ]]
}
```

## Module

[`terminal`](../terminal.md)
