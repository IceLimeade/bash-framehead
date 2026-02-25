# `terminal::clear::line`

Clear current line

## Usage

```bash
terminal::clear::line ...
```

## Source

```bash
terminal::clear::line() {
    printf '\033[2K'
}
```

## Module

[`terminal`](../terminal.md)
