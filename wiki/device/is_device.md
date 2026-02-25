# `device::is_device`

Check if path is a character device

## Usage

```bash
device::is_device ...
```

## Source

```bash
device::is_device() {
    [[ -c "$1" ]]
}
```

## Module

[`device`](../device.md)
