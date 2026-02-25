# `string::is_numeric`

_No description available._

## Usage

```bash
string::is_numeric ...
```

## Source

```bash
string::is_numeric() {
  # accepts int, float, hex, binary, octal
  string::is_integer "$1" || string::is_float "$1" ||
    string::is_hex "$1" || string::is_bin "$1" ||
    string::is_octal "$1"
}
```

## Module

[`string`](../string.md)
