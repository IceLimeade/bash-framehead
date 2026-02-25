# `terminal::shopt::list::enabled`

List all enabled shopt options

## Usage

```bash
terminal::shopt::list::enabled ...
```

## Source

```bash
terminal::shopt::list::enabled() {
    shopt | awk '$2 == "on" {print $1}'
}
```

## Module

[`terminal`](../terminal.md)
