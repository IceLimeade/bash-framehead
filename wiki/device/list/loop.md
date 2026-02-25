# `device::list::loop`

List all loop devices

## Usage

```bash
device::list::loop ...
```

## Source

```bash
device::list::loop() {
    find /dev -maxdepth 1 -name 'loop*' -type b 2>/dev/null | sort
}
```

## Module

[`device`](../device.md)
