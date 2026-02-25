# `process::cpu`

==============================================================================

## Usage

```bash
process::cpu ...
```

## Source

```bash
process::cpu() {
    ps -o pcpu= -p "$1" 2>/dev/null | tr -d ' '
}
```

## Module

[`process`](../process.md)
