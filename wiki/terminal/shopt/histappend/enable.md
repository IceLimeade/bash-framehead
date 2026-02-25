# `terminal::shopt::histappend::enable`

_No description available._

## Usage

```bash
terminal::shopt::histappend::enable ...
```

## Source

```bash
terminal::shopt::histappend::enable()    { shopt -s histappend   2>/dev/null; }  # append to history
```

## Module

[`terminal`](../terminal.md)
