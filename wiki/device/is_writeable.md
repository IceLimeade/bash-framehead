# `device::is_writeable`

Check if device is writable

## Usage

```bash
device::is_writeable ...
```

## Source

```bash
device::is_writeable() {
    [[ -w "$1" ]]
}
```

## Module

[`device`](../device.md)
