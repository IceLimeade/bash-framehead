# `terminal::shopt::checkwinsize::disable`

_No description available._

## Usage

```bash
terminal::shopt::checkwinsize::disable ...
```

## Source

```bash
terminal::shopt::checkwinsize::disable() { shopt -u checkwinsize 2>/dev/null; }
```

## Module

[`terminal`](../terminal.md)
