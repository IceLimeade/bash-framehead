# `string::is_integer`

Check if string is a valid integer

## Usage

```bash
string::is_integer ...
```

## Source

```bash
string::is_integer() {
  [[ "$1" =~ ^-?[0-9]+$ ]]
}
```

## Module

[`string`](../string.md)
