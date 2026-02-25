# `string::constant_to_camel`

CONSTANT_CASE → camelCase

## Usage

```bash
string::constant_to_camel ...
```

## Source

```bash
string::constant_to_camel() {
  string::snake_to_camel "${1,,}"
}
```

## Module

[`string`](../string.md)
