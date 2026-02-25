# `terminal::is_tty::stderr`

Check if stderr is a terminal

## Usage

```bash
terminal::is_tty::stderr ...
```

## Source

```bash
terminal::is_tty::stderr() {
    [[ -t 2 ]]
}
```

## Module

[`terminal`](../terminal.md)
