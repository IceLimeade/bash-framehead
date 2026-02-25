# `string::is_alpha`

Check if string is alphabetic only

## Usage

```bash
string::is_alpha ...
```

## Source

```bash
string::is_alpha() {
  [[ "$1" =~ ^[a-zA-Z]+$ ]]
}
```

## Module

[`string`](../string.md)
