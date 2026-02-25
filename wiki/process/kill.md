# `process::kill`

Terminate a process (SIGTERM)

## Usage

```bash
process::kill ...
```

## Source

```bash
process::kill() {
    kill -TERM "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
