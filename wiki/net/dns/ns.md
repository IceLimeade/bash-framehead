# `net::dns::ns`

Get nameservers for a domain

## Usage

```bash
net::dns::ns ...
```

## Source

```bash
net::dns::ns() {
    net::dns::records "$1" NS
}
```

## Module

[`net`](../net.md)
