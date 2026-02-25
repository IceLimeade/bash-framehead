# `terminal::shopt::histappend::disable`

_No description available._

## Usage

```bash
terminal::shopt::histappend::disable ...
```

## Source

```bash
terminal::shopt::histappend::disable()   { shopt -u histappend   2>/dev/null; }
```

## Module

[`terminal`](../terminal.md)
