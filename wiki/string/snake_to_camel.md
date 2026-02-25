# `string::snake_to_camel`

snake_case → camelCase

## Usage

```bash
string::snake_to_camel ...
```

## Source

```bash
string::snake_to_camel() {
  string::plain_to_camel "${1//_/ }"
}
```

## Module

[`string`](../string.md)
