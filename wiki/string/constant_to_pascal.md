# `string::constant_to_pascal`

CONSTANT_CASE → PascalCase

## Usage

```bash
string::constant_to_pascal ...
```

## Source

```bash
string::constant_to_pascal() {
  string::snake_to_pascal "${1,,}"
}
```

## Module

[`string`](../string.md)
