# `terminal::shopt::dotglob::enable`

_No description available._

## Usage

```bash
terminal::shopt::dotglob::enable ...
```

## Source

```bash
terminal::shopt::dotglob::enable()       { shopt -s dotglob      2>/dev/null; }  # globs match dotfiles
```

## Module

[`terminal`](../terminal.md)
