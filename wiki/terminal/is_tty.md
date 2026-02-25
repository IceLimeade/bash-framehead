# `terminal::is_tty`

Check if stdout is a terminal

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
