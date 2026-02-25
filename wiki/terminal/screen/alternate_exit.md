# `terminal::screen::alternate_exit`

_No description available._

## Usage

```bash
terminal::screen::alternate_exit ...
```

## Source

```bash
terminal::screen::alternate_exit() {
    terminal::screen::normal
    trap - EXIT INT TERM
}
```

## Module

[`terminal`](../terminal.md)
