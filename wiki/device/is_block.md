# `device::is_block`

Check if path is a block device

## Usage

```bash
device::is_block ...
```

## Source

```bash
device::is_block() {
    [[ -b "$1" ]]
}
```

## Module

[`device`](../device.md)
