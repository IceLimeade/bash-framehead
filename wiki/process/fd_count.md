# `process::fd_count`

Get number of open file descriptors for a PID

## Usage

```bash
process::fd_count ...
```

## Source

```bash
process::fd_count() {
    ls "/proc/$1/fd" 2>/dev/null | wc -l
}
```

## Module

[`process`](../process.md)
