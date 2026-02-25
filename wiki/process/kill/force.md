# `process::kill::force`

Force kill a process (SIGKILL)

## Usage

```bash
process::kill::force ...
```

## Source

```bash
process::kill::force() {
    kill -KILL "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
