# `process::is_running`

process.sh — bash-frameheader process management lib

## Usage

```bash
process::is_running ...
```

## Source

```bash
process::is_running() {
    kill -0 "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
