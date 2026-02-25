# `net::ip::is_loopback`

Check if IP is loopback

## Usage

```bash
net::ip::is_loopback ...
```

## Source

```bash
net::ip::is_loopback() {
    [[ "$1" == "127."* || "$1" == "::1" ]]
}
```

## Module

[`net`](../net.md)
