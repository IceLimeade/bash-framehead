# `process::run_bg`

==============================================================================

## Usage

```bash
process::run_bg ...
```

## Source

```bash
process::run_bg() {
    "$@" &
    echo $!
}
```

## Module

[`process`](../process.md)
