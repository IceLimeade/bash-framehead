# `terminal::shopt::nullglob::enable`

_No description available._

## Usage

```bash
terminal::shopt::nullglob::enable ...
```

## Source

```bash
terminal::shopt::nullglob::enable()      { shopt -s nullglob     2>/dev/null; }  # failed globs → empty
```

## Module

[`terminal`](../terminal.md)
