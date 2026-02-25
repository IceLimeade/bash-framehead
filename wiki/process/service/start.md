# `process::service::start`

Start a systemd service

## Usage

```bash
process::service::start ...
```

## Source

```bash
process::service::start() {
    if runtime::has_command systemctl; then
        systemctl start "$1"
    elif runtime::has_command service; then
        service "$1" start
    fi
}
```

## Module

[`process`](../process.md)
