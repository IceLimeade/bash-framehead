# `terminal::shopt::enable`

Enable a shopt option, return 1 if unsupported

## Usage

```bash
terminal::shopt::enable ...
```

## Source

```bash
terminal::shopt::enable() {
    shopt -s "$1" 2>/dev/null
}
```

## Module

[`terminal`](../terminal.md)
