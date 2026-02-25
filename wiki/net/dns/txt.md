# `net::dns::txt`

Get TXT records (useful for SPF, DKIM etc.)

## Usage

```bash
net::dns::txt ...
```

## Source

```bash
net::dns::txt() {
    net::dns::records "$1" TXT
}
```

## Module

[`net`](../net.md)
