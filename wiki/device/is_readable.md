# `device::is_readable`

Check if device is readable

## Usage

```bash
device::is_readable ...
```

## Source

```bash
device::is_readable() {
    [[ -r "$1" ]]
}
```

## Module

[`device`](../device.md)
