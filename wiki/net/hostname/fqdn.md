# `net::hostname::fqdn`

Get the fully qualified domain name

## Usage

```bash
net::hostname::fqdn ...
```

## Source

```bash
net::hostname::fqdn() {
    hostname -f 2>/dev/null
}
```

## Module

[`net`](../net.md)
