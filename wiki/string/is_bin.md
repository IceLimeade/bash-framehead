# `string::is_bin`

_No description available._

## Usage

```bash
string::is_bin ...
```

## Source

```bash
string::is_bin() {
  [[ "$1" =~ ^0b[01]+$ ]]
}
```

## Module

[`string`](../string.md)
