# `terminal::shopt::disable`

Disable a shopt option

## Usage

```bash
terminal::shopt::disable ...
```

## Source

```bash
terminal::shopt::disable() {
    shopt -u "$1" 2>/dev/null
}
```

## Module

[`terminal`](../terminal.md)
