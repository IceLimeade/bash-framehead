# `string::is_octal`

_No description available._

## Usage

```bash
string::is_octal ...
```

## Source

```bash
string::is_octal() {
  [[ "$1" =~ ^0[0-7]+$ ]]
}
```

## Module

[`string`](../string.md)
