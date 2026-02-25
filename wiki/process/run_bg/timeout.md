# `process::run_bg::timeout`

Run a command in the background with a timeout

## Usage

```bash
process::run_bg::timeout ...
```

## Source

```bash
process::run_bg::timeout() {
    local timeout="$1"; shift
    (
        "$@" &
        local pid=$!
        sleep "$timeout"
        process::kill::graceful "$pid"
    ) &
    echo $!
}
```

## Module

[`process`](../process.md)
