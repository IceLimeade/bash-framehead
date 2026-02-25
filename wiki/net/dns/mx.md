# `net::dns::mx`

Get MX records for a domain

## Usage

```bash
net::dns::mx ...
```

## Source

```bash
net::dns::mx() {
    net::dns::records "$1" MX
}
```

## Module

[`net`](../net.md)
