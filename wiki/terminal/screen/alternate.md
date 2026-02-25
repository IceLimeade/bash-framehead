# `terminal::screen::alternate`

Enter alternate screen buffer (like vim/less do)

## Usage

```bash
terminal::screen::alternate ...
```

## Source

```bash
terminal::screen::alternate() {
    printf '\033[?1049h'
}
```

## Module

[`terminal`](../terminal.md)
