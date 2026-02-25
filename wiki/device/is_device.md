# `device::is_device`

device.sh — bash-frameheader device lib

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
