# `process::reload`

Reload a process config (SIGHUP)

## Usage

```bash
process::reload ...
```

## Source

```bash
process::reload() {
    kill -HUP "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
