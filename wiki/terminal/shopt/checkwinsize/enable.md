# `terminal::shopt::checkwinsize::enable`

_No description available._

## Usage

```bash
terminal::shopt::checkwinsize::enable ...
```

## Source

```bash
terminal::shopt::checkwinsize::enable()  { shopt -s checkwinsize 2>/dev/null; }  # update LINES/COLUMNS
```

## Module

[`terminal`](../terminal.md)
