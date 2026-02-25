# `process::suspend`

Suspend a process (SIGSTOP)

## Usage

```bash
process::suspend ...
```

## Source

```bash
process::suspend() {
    kill -STOP "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
