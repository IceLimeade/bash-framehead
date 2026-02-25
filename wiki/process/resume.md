# `process::resume`

Resume a suspended process (SIGCONT)

## Usage

```bash
process::resume ...
```

## Source

```bash
process::resume() {
    kill -CONT "$1" 2>/dev/null
}
```

## Module

[`process`](../process.md)
