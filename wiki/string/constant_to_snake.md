# `string::constant_to_snake`

CONSTANT_CASE → snake_case

## Usage

```bash
string::constant_to_snake ...
```

## Source

```bash
string::constant_to_snake() {
  echo "${1,,}"
}
```

## Module

[`string`](../string.md)
