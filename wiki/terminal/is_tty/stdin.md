# `terminal::is_tty::stdin`

Check if stdin is a terminal

## Usage

```bash
terminal::is_tty::stdin ...
```

## Source

```bash
terminal::is_tty::stdin() {
    [[ -t 0 ]]
}
```

## Module

[`terminal`](../terminal.md)
