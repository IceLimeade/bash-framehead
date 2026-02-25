# `terminal::shopt::enable`

==============================================================================

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
