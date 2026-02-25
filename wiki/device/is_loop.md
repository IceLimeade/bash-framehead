# `device::is_loop`

Check if device is a loop device

## Usage

```bash
device::is_loop ...
```

## Source

```bash
device::is_loop() {
    [[ "$1" == /dev/loop* ]]
}
```

## Module

[`device`](../device.md)
