# `string::snake_to_pascal`

snake_case → PascalCase

## Usage

```bash
string::snake_to_pascal ...
```

## Source

```bash
string::snake_to_pascal() {
  string::plain_to_pascal "${1//_/ }"
}
```

## Module

[`string`](../string.md)
