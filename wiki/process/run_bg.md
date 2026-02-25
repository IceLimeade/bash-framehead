# `process::run_bg`

Run a command in the background, print its PID

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
