# `device::exists`

Check if device exists (block or character)

## Usage

```bash
device::exists ...
```

## Source

```bash
device::exists() {
    [[ -b "$1" || -c "$1" ]]
}
```

## Module

[`device`](../device.md)
