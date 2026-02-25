# `terminal::shopt::nocaseglob::enable`

_No description available._

## Usage

```bash
terminal::shopt::nocaseglob::enable ...
```

## Source

```bash
terminal::shopt::nocaseglob::enable()    { shopt -s nocaseglob   2>/dev/null; }  # case-insensitive glob
```

## Module

[`terminal`](../terminal.md)
