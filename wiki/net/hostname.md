# `net::hostname`

Get the system hostname

## Usage

```bash
net::hostname ...
```

## Source

```bash
net::hostname() {
    hostname 2>/dev/null || cat /etc/hostname 2>/dev/null
}
```

## Module

[`net`](../net.md)
