# `terminal::shopt::nocasematch::enable`

_No description available._

## Usage

```bash
terminal::shopt::nocasematch::enable ...
```

## Source

```bash
terminal::shopt::nocasematch::enable()   { shopt -s nocasematch  2>/dev/null; }  # case-insensitive [[ =~
```

## Module

[`terminal`](../terminal.md)
