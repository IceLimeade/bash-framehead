# `terminal::read_key`

==============================================================================

## Usage

```bash
terminal::read_key ...
```

## Source

```bash
terminal::read_key() {
    local _var="${1:-_TERMINAL_KEY}"
    local _key
    IFS= read -r -s -n1 _key
    printf -v "$_var" '%s' "$_key"
}
```

## Module

[`terminal`](../terminal.md)
